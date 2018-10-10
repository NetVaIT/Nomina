unit CFDIDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Forms,
  Vcl.Dialogs, Windows, Vcl.ComCtrls, System.Types, System.IniFiles,
  System.Variants, System.Actions, Vcl.ActnList, Soap.EncdDecd,
  CFDLibHeader, DataTypeCast,
  cxMemo,
  CFDIUtils,
  Facturacion.Comprobante;

type
  TPAC = (pacFoliosDigitales, pacFinkok);
  TdmCFDI = class(TDataModule)
    adopSetCFDILog: TADOStoredProc;
    adocUpdCFDILogCancelar: TADOCommand;
    adocUpdCFDILogCancelarError: TADOCommand;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FBitacora: TcxMemo;
    FDirEXE: String;
    FFDPass: string;
    FFDUser: string;
    FPAC: TPAC;
    FFDPFXFile: string;
    FFDPFXPass: string;
    FCertificadoPkcs12Base64: string;
    procedure AgregarMensaje(pLinea: String);
    procedure SetBitacora(const Value: TcxMemo);
    procedure SetFDPass(const Value: string);
    procedure SetFDUser(const Value: string);
    procedure SetFDPFXFile(const Value: string);
    procedure SetFDPFXPass(const Value: string);
    procedure SetPAC(const Value: TPAC);
    function Timbrar(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
    function TimbrarFD(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
    function CancelarFD(pUUID: string): Boolean;
    function TimbrarFinkok(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
    function CancelarFinkok(pUUID: string): Boolean;
    procedure CrearPDFMasivo(pMes: Integer; pDirXML, pDirPDF: String;
      pFilesXML: TListItems);
    procedure SetCertificadoPkcs12Base64(const Value: string);
    property CertificadoPkcs12Base64: string read FCertificadoPkcs12Base64 write SetCertificadoPkcs12Base64;
  public
    { Public declarations }
    FCertificado: TFECertificado;
    property DirEXE: String read FDirEXE;
    property Bitacora: TcxMemo read FBitacora write SetBitacora;
    property FDUser: string read FFDUser write SetFDUser;
    property FDPass: string read FFDPass write SetFDPass;
    property FDPFXFile: string read FFDPFXFile write SetFDPFXFile;
    property FDPFXPass: string read FFDPFXPass write SetFDPFXPass;
    property PAC: TPAC read FPAC write SetPAC;
    procedure CrearXMLMasivo(pDirINI, pDirXML: String; pFilesINI: TListItems);
    procedure CrearXMLTimbrar(pAnio, pMes: Word; pFiltrar: Boolean; pDirINI,
      pDirINIPr, pDirError, pDirXML, pDirXMLFD: String; pFilesINI: TListItems);
    procedure TimbrarEcodex(pDirINI: String; pFilesINI: TListItems);
    function Cancelar(pUUID: string): Boolean;
//    function FDTimbrar(pMes: Integer; pDirXML, pDirXMLFD, pFileName: String): Boolean;
//    procedure FDTimbrarMasivo(pMes: Integer; pDirXML, pDirXMLFD: String;
//      pFilesXML: TListItems);
    function CrearPDF(pFileNameXML, pFileNamePDF: string): Boolean;
    function FDObtenerPDF(pUID, pFileNamePDF: string): Boolean;
    procedure FDConsultarCreditos();
    procedure FDConsultarTimbrePorReferencia(pFileNameXML, pReferencia: string);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils, MainFrm, xmlDoc, XMLIntf,
  {$IFDEF DEBUG}
    WSCFDI33Test,
  {$ELSE}
    WSCFDI33,
  {$ENDIF}
  {$IFDEF DEBUG}
    WSFinkokStampDemo, WSFinkokCancelDemo,
  {$ELSE}
    WSFinkokStamp, WSFinkokCancel,
  {$ENDIF}
  XMLtoPDFDmod;

{$R *.dfm}

{ TdmCFDI }

function WStringToArray(const S: WideString): StringArray;
var
  i : integer;
begin
  SetLength(result, Length(S) div 36); //cada uuid es de 36 caracteres
  if Length(S) > 0 then
  for i := 1 to Length(S) div 36 do
  begin
    SetLength(result[i-1], Length(S));
    result[i-1] := S;
  end;
end;

//function LeerArchivoTexto(pArchivo: string): string;
//var
//  F: TFileStream;
//  s: String;
//begin
//  F := TFileStream.Create( pArchivo, fmOpenRead );
//  try
//    SetLength( s, F.Size ); // *** Me faltaba esto, gracias por la corrección ***
//    F.Read( s[1], F.Size );
//    Result := s;
//  finally
//    F.Free;
//  end;
//end;

function LeerArchivoTexto(pArchivo: string): string;
var
  TXTFile: TextFile;
  Linea: string;
  Lineas: string;
begin
  Lineas := '';
  AssignFile(TXTFile, pArchivo);
  Reset(TXTFile);
  while not Eof(TXTFile) do
  begin
    ReadLn(TXTFile, Linea);
    Lineas := Lineas + Linea;
  end;
  CloseFile(TXTFile);
  Result := Lineas;
end;

procedure TdmCFDI.AgregarMensaje(pLinea: String);
begin
  if Assigned(Bitacora) then
    Bitacora.Lines.Add(pLinea);
end;

function TdmCFDI.Cancelar(pUUID: string): Boolean;
begin
  case PAC of
    pacFoliosDigitales: Result:= CancelarFD(pUUID);
    pacFinkok: Result := CancelarFinkok(pUUID);
    else Result := False;
  end;
end;

function TdmCFDI.CancelarFD(pUUID: string): Boolean;
var
  WSTFD: IWSCFDI33;
  RtFD: RespuestaCancelacion2;
  listaCFDI: ArrayOfstring;
begin
  Result := False;
  if FDUser = EmptyStr then exit;
  if FDPass = EmptyStr then exit;
  SetLength(listaCFDI, 1);
  listaCFDI[0]:= pUUID;
  WSTFD := GetIWSCFDI33(True, '', nil);
  RtFD := WSTFD.CancelarCFDI(FDUser, FDPass, FCertificado.RFCAlQuePertenece, listaCFDI, CertificadoPkcs12Base64, FDPFXPass);
  // Alamecan el la bitacora el resultado
  if RtFD.OperacionExitosa then
  begin
    adocUpdCFDILogCancelar.Parameters.ParamByName('UUID').Value:= pUUID;
    adocUpdCFDILogCancelar.Parameters.ParamByName('TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
    adocUpdCFDILogCancelar.Parameters.ParamByName('TFD2XMLAcuse').Value:= RtFD.XMLAcuse;
  //  RtFD.DetallesCancelacion[0].CodigoResultado
  //  RtFD.DetallesCancelacion[0].MensajeResultado
  //  RtFD.DetallesCancelacion[0].UUID
    adocUpdCFDILogCancelar.Execute;
  end
  else
  begin
    adocUpdCFDILogCancelarError.Parameters.ParamByName('UUID').Value:= pUUID;
    adocUpdCFDILogCancelarError.Parameters.ParamByName('TFD2MensajeError').Value:= RtFD.MensajeError;
    adocUpdCFDILogCancelarError.Parameters.ParamByName('TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
    adocUpdCFDILogCancelarError.Parameters.ParamByName('TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
    adocUpdCFDILogCancelarError.Execute;
  end;
  Result := RtFD.OperacionExitosa;
end;

function TdmCFDI.CancelarFinkok(pUUID: string): Boolean;
var
  WSTFinkok: IWSFinkokCancel;
  RTFinkok: CancelaCFDResult2;
  sKey,sCer:TByteDynArray;
  AUUID:StringArray;
  UUID:UUIDS;
//  aKey,aCer:TFileName;
begin
  Result := False;
  if FDUser = EmptyStr then exit;
  if FDPass = EmptyStr then exit;
 UUID:=UUIDS.Create;
//openssl x509 -inform DER -outform PEM -in CSD010_AAA010101AAA.cer -pubkey -out CSD010_AAA010101AAA.cer.pem
//openssl pkcs8 -inform DER -in CSD010_AAA010101AAA.key -passin pass:12345678a -out CSD010_AAA010101AAA.key.pem
//EjecutaExterno(ExtractFilePath(Application.ExeName)+'openssl x509 -inform DER -outform PEM -in '+ExtractFilePath(Application.ExeName)+'aad990814bp7_1210261233s.cer -pubkey -out '+ExtractFilePath(Application.ExeName)+'aad990814bp7_1210261233s.cer.pem');
//EjecutaExterno(ExtractFilePath(Application.ExeName)+'openssl pkcs8 -inform DER -in '+ExtractFilePath(Application.ExeName)+'aad990814bp7_1210261233s.key -passin pass:12345678a -out '+ExtractFilePath(Application.ExeName)+'aad990814bp7_1210261233s.key.pem');
 sCer:=FileToByteArray(FCertificado.Ruta+'.pem');
 sKey:=FileToByteArray(FCertificado.LlavePrivada.Ruta+'.pem');
 WSTFinkok := GetIWSFinkokCancel(True, '', nil);
 SetLength(AUUID, 0);
 AUUID:=WStringToArray(Trim(pUUID));
 UUID.uuids:=AUUID;
  {$IFDEF DEBUG}
    RTFinkok := WSTFinkok.cancel(UUID, FDUser, FDPass, FCertificado.RFCAlQuePertenece, sCer, sKey, False, EmptyStr);
  {$ELSE}
    RTFinkok := WSTFinkok.cancel(UUID, FDUser, FDPass, FCertificado.RFCAlQuePertenece, sCer, sKey, False);
  {$ENDIF}
 if Trim(RTFinkok.CodEstatus)<>'' then
  AgregarMensaje('Estatus UUID '+RTFinkok.CodEstatus)
 Else
  Begin
   if Trim(RTFinkok.Folios[0].EstatusUUID)<>'' then    AgregarMensaje('Estatus UUID '+RTFinkok.Folios[0].EstatusUUID);
   if Trim(RTFinkok.Folios[0].UUID)<>'' then    AgregarMensaje('UUID '+RTFinkok.Folios[0].UUID);
   if Trim(RTFinkok.Acuse)<>'' then     AgregarMensaje('Acuse '+RTFinkok.Acuse);
   if Trim(RTFinkok.Fecha)<>'' then     AgregarMensaje('Fecha '+RTFinkok.Fecha);
   if Trim(RTFinkok.RfcEmisor)<>'' Then AgregarMensaje('RFC Emisor '+RTFinkok.RfcEmisor);
  End;
 UUID.Free;
end;

function TdmCFDI.CrearPDF(pFileNameXML, pFileNamePDF: string): Boolean;
const
  cRTM32N11 = 'CFDINominaCOBAEM.rtm';
  cRTM32N12 = '';
  cRTM33N12 = '';
var
  dmodXMLtoPDF: TdmodXMLtoPDF;
  CFDI: TCFDI;
begin
  Result:= False;
  if FileExists(pFileNameXML) then
  begin
    dmodXMLtoPDF := TdmodXMLtoPDF.Create(Self);
    CFDI := TCFDI.Create(pFileNameXML);
    try
      dmodXMLtoPDF.CadenaOriginalTimbre:=  string(CFDI.CadenaOriginalTimbre);
      dmodXMLtoPDF.FileRTM := DirExe + PathDelim + cRTM32N11;
      dmodXMLtoPDF.GeneratePDFFile(pFileNameXML, pFileNamePDF);
      Result:= True;
    finally
      CFDI.Free;
      dmodXMLtoPDF.Free;
    end;
  end;
end;

procedure TdmCFDI.CrearPDFMasivo(pMes: Integer; pDirXML, pDirPDF: String;
  pFilesXML: TListItems);
var
  vContador: Integer;
  vCountTotal: Integer;
  vFileName, vFileNameXML, vFileNamePDF : String;
begin
  if pFilesXML.Count = 0 then exit;
  vCountTotal:= pFilesXML.Count - 1;
  for vContador := 0 to vCountTotal do
  begin
    vFileName := pFilesXML.Item[vContador].Caption;
    vFileNameXML := pDirXML + PathDelim + vFileName + '.XML';
    vFileNamePDF := pDirPDF + PathDelim + vFileName + '.PDF';
    CrearPDF(vFileNameXML, vFileNamePDF);
    ShowProgress(vContador, vCountTotal);
  end;
  ShowProgress(0, 0);
  ShowMessage('Proceso terminado');
end;

procedure TdmCFDI.CrearXMLTimbrar(pAnio, pMes: Word; pFiltrar: Boolean;
  pDirINI, pDirINIPr, pDirError, pDirXML, pDirXMLFD: String; pFilesINI: TListItems);
var
  vCountTotal, vContador: Integer;
  vFileName: String;
  vFileNameINI: String;
  vFileNameXML: String;
  vFileINI: String;
  vFileXML: String;
  vFileXMLT: String;
  vSD: string;
  xml: IXmlDocument;
  FechaPago: TDateTime;
  Year, Month, Day: Word;

  procedure ErrorLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@PeriodoAnio').Value:= pAnio;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
    adopSetCFDILog.Parameters.ParamByName('@XMLCreado').Value:= False;
    adopSetCFDILog.Parameters.ParamByName('@XMLFecha').Value:= Now;
    adopSetCFDILog.Parameters.ParamByName('@XMLError').Value:= 'Error:' + GetError + ' / ' + string(GetErrorExt);
    adopSetCFDILog.ExecProc;
  end;

  function GetFechaPago: TDateTime;
  var
    CFDI: IXmlDocument;
    nodeP, nodeD: IXMLNode;
    I,J: Integer;
    sFecha: string;
    FS: TFormatSettings;
  begin
    Result := MinDateTime;
    FS := TFormatSettings.Create;
    CFDI := LoadXMLDocument(vFileXML);
    CFDI.Active := True;
    for I := 0 to CFDI.DocumentElement.ChildNodes.Count - 1 do
    begin
      nodeP := CFDI.DocumentElement.ChildNodes[I];
      if nodeP.NodeType = ntElement then
      begin
        if nodeP.NodeName = 'cfdi:Complemento' then
        begin
          for J := 0 to nodeP.ChildNodes.Count - 1 do
          begin
            nodeD := nodeP.ChildNodes[J];
            if nodeD.NodeName = 'nomina12:Nomina' then
            begin
              if nodeD.HasAttribute('FechaPago') then
              begin
                sFecha := nodeD.Attributes['FechaPago'];
                FS := TFormatSettings.Create;
                FS.DateSeparator := '-';
                FS.ShortDateFormat := 'y/m/d';
                Result := StrToDateTime(sFecha, FS);
              end;
            end;
          end;
        end;
      end;
    end;
  end;

begin
  if pFilesINI.Count = 0 then exit;
  vCountTotal:= pFilesINI.Count - 1;
  for vContador := 0 to vCountTotal do
  begin
    vFileName := pFilesINI.Item[vContador].Caption;
    vFileNameXML := vFileName + '.XML';
    vFileNameINI := vFileName + '.INI';
    vFileINI := pDirINI + PathDelim + vFileNameINI;
    vFileXML := pDirXML + PathDelim + vFileNameXML;
    vFileXMLT := pDirXMLFD + PathDelim + vFileNameXML;
    // Genera XML con la libreria
		if GeneraCFD(ToChar(vFileINI),ToChar(FCertificado.LlavePrivada.Clave)) = OK then
    begin
      // Se genera nuevamente el sello ya que la libreria LibDLL deliberadamente lo genera incorrecto.
      vSD:= GetSelloV33(FCertificado, Utf8Encode(CFDLibHeader.CadenaOriginal));
      xml:= LoadXMLDocument(vFileXML);
      xml.Active:= True;
      if XML.DocumentElement.HasAttribute('Sello') then
      begin
        XML.DocumentElement.Attributes['Sello'] := vSD
      end;
      xml.SaveToFile(vFileXML);
      // Timbrar
      FechaPago :=  GetFechaPago;
      DecodeDate(FechaPago, Year, Month, Day);
      if Timbrar(Year, Month, vFileXML, vFileXMLT) then
      begin
        CopyFile(PChar(vFileINI), PChar(pDirINIPr + PathDelim + vFileNameINI), False);
        DeleteFile(PChar(vFileINI));
      end
      else
      begin
        CopyFile(PChar(vFileINI), PChar(pDirError + PathDelim + vFileNameINI), False);
        DeleteFile(PChar(vFileINI));
        ShowMessage('Error al timbrar, ver CFDILog');
        Break;
      end;
//      AgregarMensaje('Se grabo formato XML: '+ vFileName + '.XML');
//      AgregarMensaje('Se grabo la factura en formato XML, la Cadena Original y el Sello Digital son:'+
//  		CFDLibHeader.CadenaOriginal + ' / ' +  CFDLibHeader.SelloDigital + ' / ' + vSD);
//  		copy(CadenaOriginal,1,50) + '...' +  copy(SelloDigital,1,50) + '...');
    end
		else
    begin
      ErrorLog;
      CopyFile(PChar(vFileINI), PChar(pDirError + PathDelim + vFileNameINI), False);
      DeleteFile(PChar(vFileINI));
      ShowMessage('Error al generar XML, ver CFDILog');
      Break;
//			AgregarMensaje('Error:' + GetError + ' / ' + GetErrorExt);
    end;
    ShowProgress(vContador, vCountTotal);
  end;
  ShowProgress(0, 0);
  ShowMessage('Proceso terminado');
end;

procedure TdmCFDI.CrearXMLMasivo(pDirINI, pDirXML: String; pFilesINI: TListItems);
var
  vContador: Integer;
  vFileNameINI: String;
  vFileINI: String;
  vFileXML: String;
  vSD: string;
  xml: IXmlDocument;
begin
  if pFilesINI.Count = 0 then exit;
  for vContador := 0 to pFilesINI.Count - 1 do
  begin
    vFileNameINI := pFilesINI.Item[vContador].Caption;
    vFileINI := pDirINI + PathDelim + vFileNameINI + '.INI';
    vFileXML := pDirXML + PathDelim + vFileNameINI + '.XML';
		if GeneraCFD(ToChar(vFileINI),ToChar(FCertificado.LlavePrivada.Clave)) = OK then
    begin
      // Se genera nuevamente el sello ya que la libreria LibDLL deliberadamente lo genera incorrecto.
      vSD:= GetSelloV33(FCertificado, Utf8Encode(CFDLibHeader.CadenaOriginal));
      xml:= LoadXMLDocument(vFileXML);
      xml.Active:= True;
      if XML.DocumentElement.HasAttribute('Sello') then
      begin
        XML.DocumentElement.Attributes['Sello'] := vSD
      end;
      xml.SaveToFile(vFileXML);
      AgregarMensaje('Se grabo formato XML: '+ vFileNameINI + '.XML');
//      AgregarMensaje('Se grabo la factura en formato XML, la Cadena Original y el Sello Digital son:'+
//  		CFDLibHeader.CadenaOriginal + ' / ' +  CFDLibHeader.SelloDigital + ' / ' + vSD);
//  		copy(CadenaOriginal,1,50) + '...' +  copy(SelloDigital,1,50) + '...');
    end
		else
    begin
//      CopyFile(PChar(vFileNameINI), PChar(DirError + PathDelim + vFileNameINI), False);
//      DeleteFile(PChar(vFileNameINI));
			AgregarMensaje('Hubo un Error:' + GetError + ' / ' + string(GetErrorExt));
    end;
    ShowProgress(vContador, pFilesINI.Count - 1);
  end;
end;

procedure TdmCFDI.DataModuleCreate(Sender: TObject);
begin
  FDirEXE := ExtractFileDir(Application.ExeName);
end;

procedure TdmCFDI.SetBitacora(const Value: TcxMemo);
begin
  FBitacora := Value;
end;

procedure TdmCFDI.SetCertificadoPkcs12Base64(const Value: string);
begin
  FCertificadoPkcs12Base64 := Value;
end;

procedure TdmCFDI.SetFDPass(const Value: string);
begin
  FFDPass := Value;
end;

procedure TdmCFDI.SetFDPFXFile(const Value: string);
begin
  FFDPFXFile := Value;
  CertificadoPkcs12Base64:= LeerArchivoTexto(Value);
end;

procedure TdmCFDI.SetFDPFXPass(const Value: string);
begin
  FFDPFXPass := Value;
end;

procedure TdmCFDI.SetFDUser(const Value: string);
begin
  FFDUser := Value;
end;

procedure TdmCFDI.SetPAC(const Value: TPAC);
begin
  FPAC := Value;
end;

function TdmCFDI.Timbrar(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
begin
  case PAC of
    pacFoliosDigitales: Result := TimbrarFD(pAnio, pMes, pFileNameXML, pFileNameXMLT);
    pacFinkok: Result := TimbrarFinkok(pAnio, pMes, pFileNameXML, pFileNameXMLT);
    else Result := False;
  end;
end;

procedure TdmCFDI.TimbrarEcodex(pDirINI: String; pFilesINI: TListItems);
var
  vContador: Integer;
  vFileNameINI: String;
  vFileINI: String;
begin
  if pFilesINI.Count = 0 then exit;
  for vContador := 0 to pFilesINI.Count - 1 do
  begin
    vFileNameINI := pFilesINI.Item[vContador].Caption;
    vFileINI := pDirINI + PathDelim + vFileNameINI + '.INI';
		if TimbrarCFD(ToChar(vFileINI)) = OK then
    begin
      AgregarMensaje('TIMBRADO EXITOSO: ' + vFileNameINI);
    end
		else
    begin
//      CopyFile(PChar(vFileNameINI), PChar(DirError + PathDelim + vFileNameINI), False);
//      DeleteFile(PChar(vFileNameINI));
			AgregarMensaje('Hubo un Error:' + GetError + ' / ' + string(GetErrorExt));
    end;
    ShowProgress(vContador, pFilesINI.Count - 1);
  end;
end;

function TdmCFDI.TimbrarFD(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
var
  WSTFD: IWSCFDI33;
  RtFD: RespuestaTFD332;
  xmlO, xmlR: IXmlDocument;
  vFileName: string;
  Referencia: string;
//  IdCFDI: Integer;

  procedure AgregarLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@PeriodoAnio').Value:= pAnio;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileName;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= Referencia;
    adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RtFD.CodigoRespuesta;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RtFD.MensajeError;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
//    adopSetCFDILog.Parameters.ParamByName('@ID_CFDI').Value:= IdCFDI;
    if Assigned(RtFD.Timbre) then
    begin
      adopSetCFDILog.Parameters.ParamByName('@TFD2Estado').Value:= RtFD.Timbre.Estado;
      adopSetCFDILog.Parameters.ParamByName('@TFD2FechaTimbrado').Value:= RtFD.Timbre.FechaTimbrado.AsDateTime;
      adopSetCFDILog.Parameters.ParamByName('@TFD2NumeroCertificadoSAT').Value:= RtFD.Timbre.NumeroCertificadoSAT;
      adopSetCFDILog.Parameters.ParamByName('@TFD2SelloCFD').Value:= RtFD.Timbre.SelloCFD;
      adopSetCFDILog.Parameters.ParamByName('@TFD2SelloSAT').Value:= RtFD.Timbre.SelloSAT;
      adopSetCFDILog.Parameters.ParamByName('@TFD2UUID').Value:= RtFD.Timbre.UUID;
    end;
    adopSetCFDILog.ExecProc;
  end;

begin
  vFileName := ExtractFileName(pFileNameXML);
  Referencia := ChangeFileExt(vFileName, EmptyStr);
//  IdCFDI:= StrToIntDef(Copy(Referencia, Pos('_', Referencia), Length(Referencia)), 0);
  xmlO:= LoadXMLDocument(pFileNameXML);
  xmlO.Active:= True;
  WSTFD := GetIWSCFDI33(true, '', nil);
  RtFD := WSTFD.TimbrarCFDI(FDUser, FDPass, xmlO.XML.Text, vFileName);
  if RtFD.OperacionExitosa then
  begin
    xmlR := NewXMLDocument();
    xmlR.XML.Text:= RtFD.XMLResultado;
    xmlR.Active := True;
    xmlR.SaveToFile(pFileNameXMLT);
    Result:= True;
  end
  else
  begin
    Result:= False;
  end;
  AgregarLog;
end;

function TdmCFDI.TimbrarFinkok(pAnio, pMes: Word; pFileNameXML, pFileNameXMLT: string): Boolean;
var
  WSTFinkok: IWSFinkokStamp;
  RTFinkok: AcuseRecepcionCFDI2;
  sXML: TByteDynArray;
  xmlR: IXmlDocument;
  vFileName: string;
  Referencia: string;
  OperacionExitosa: Boolean;
  Incidencias: Integer;

  procedure AgregarLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@PeriodoAnio').Value:= pAnio;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileName;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= Referencia;
    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= OperacionExitosa;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Estado').Value:= 'Vigente';
    adopSetCFDILog.Parameters.ParamByName('@TFD2FechaTimbrado').Value:= StrToDateTimeDef(RTFinkok.Fecha, Now);
    adopSetCFDILog.Parameters.ParamByName('@TFD2NumeroCertificadoSAT').Value:= RTFinkok.NoCertificadoSAT;
    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloCFD').Value:= RTFinkok.Fecha;
    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloSAT').Value:= RTFinkok.SatSeal;
    adopSetCFDILog.Parameters.ParamByName('@TFD2UUID').Value:= RTFinkok.UUID;
    if Incidencias > 0 then
    begin
      adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RTFinkok.Incidencias[0].CodigoError;
      adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RTFinkok.Incidencias[0].MensajeIncidencia;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= MensajeErrorDetallado;
    end;
    adopSetCFDILog.ExecProc;
  end;

begin
  vFileName := ExtractFileName(pFileNameXML);
  Referencia := ChangeFileExt(vFileName, EmptyStr);
  sXML:= FIleToByteArray(pFileNameXML);
  WSTFinkok := GetIWSFinkokStamp(true, '', nil);
  {$IFDEF DEBUG}
    RTFinkok := WSTFinkok.stamp(sXML, FDUser, FDPass, EmptyStr);
  {$ELSE}
    RTFinkok := WSTFinkok.stamp(sXML, FDUser, FDPass);
  {$ENDIF}
  OperacionExitosa := (RTFinkok.CodEstatus = 'Comprobante timbrado satisfactoriamente');
  Incidencias := Length(RTFinkok.Incidencias);
  if OperacionExitosa then
  begin
    xmlR := NewXMLDocument();
    xmlR.XML.Text:= RTFinkok.xml;
    xmlR.Active := True;
    xmlR.SaveToFile(pFileNameXMLT);
    Result:= True;
  end
  else
  begin
    Result:= False;
  end;
  AgregarLog;
end;

procedure TdmCFDI.FDConsultarCreditos;
var
  WSTFD: IWSCFDI33;
  RtFD: RespuestaCreditos2;
  I: Integer;
begin
  WSTFD := GetIWSCFDI33(true, '', nil);
  RtFD := WSTFD.ConsultarCreditos(FDUser, FDPass);
  if RtFD.OperacionExitosa then
  begin
    for I := Low(RtFD.Paquetes) to High(RtFD.Paquetes) do
    begin
      ShowMessage( RtFD.Paquetes[I].Paquete + ': ' +
      InttoStr(RtFD.Paquetes[I].Timbres) + ': ' +
      InttoStr(RtFD.Paquetes[I].TimbresUsados) + ': ' +
      InttoStr(RtFD.Paquetes[I].TimbresRestantes)
      );

    end;
  end
  else
    ShowMessage(RtFD.MensajeError);
end;

procedure TdmCFDI.FDConsultarTimbrePorReferencia(pFileNameXML,
  pReferencia: string);
var
  WSTFD: IWSCFDI33;
  RtFD: RespuestaTFD332;
  xml: IXmlDocument;
begin
  WSTFD := GetIWSCFDI33(true, '', nil);
  RtFD := WSTFD.ConsultarTimbrePorReferencia(FDUser, FDPass, pReferencia);
  if RtFD.OperacionExitosa then
  begin
    xml := NewXMLDocument();
    xml.XML.Text:= RtFD.XMLResultado;
    xml.Active := True;
    xml.SaveToFile(pFileNameXML);
    AgregarMensaje('Obtenido FD: ' + pFileNameXML);
  end
  else
  begin
    AgregarMensaje('Hubo un Error:' + RtFD.MensajeError + ' / ' + RtFD.MensajeErrorDetallado);
  end;
end;

function TdmCFDI.FDObtenerPDF(pUID, pFileNamePDF: string): Boolean;
var
  WSTFD: IWSCFDI33;
  RtFD: RespuestaTFD332;

  procedure DecodeFile(const base64: AnsiString; const FileName: string);
  var
    stream: TBytesStream;
  begin
    stream := TBytesStream.Create(DecodeBase64(base64));
    try
      stream.SaveToFile(Filename);
    finally
      stream.Free;
    end;
  end;
  function EncodeFile(const FileName: string): AnsiString;
  var
    LStream: TMemoryStream;
  begin
    LStream := TMemoryStream.Create;
    try
      LStream.LoadFromFile(Filename);
      Result := EncodeBase64(LStream.Memory, LStream.Size);
    finally
      LStream.Free;
    end;
  end;

begin
  Result:= False;
  WSTFD := GetIWSCFDI33(true, '', nil);
  RtFD := WSTFD.ObtenerPDF(FDUser, FDPass, pUID, EmptyStr);
  if RtFD.OperacionExitosa then
  begin
    DecodeFile(RtFD.PDFResultado, pFileNamePDF);
    Result:= True;
  end;
end;

//procedure TdmCFDI.FDTimbrarMasivo(pMes: Integer; pDirXML, pDirXMLFD: String;
//pFilesXML: TListItems);
//var
//  vContador: Integer;
//  vFileName, vFileNameXML : String;
//  vFile: String;
//  vFileXML: String;
//  WSTFD: IWSTFD;
//  RtFD: RespuestaTFD2;
//  xmlO, xmlR: IXmlDocument;
//
//  procedure AgregarLog;
//  begin
//    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
//    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= vFileName;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RtFD.CodigoRespuesta;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RtFD.MensajeError;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2Estado').Value:= RtFD.Timbre.Estado;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2FechaTimbrado').Value:= RtFD.Timbre.FechaTimbrado.AsDateTime;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2NumeroCertificadoSAT').Value:= RtFD.Timbre.NumeroCertificadoSAT;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloCFD').Value:= RtFD.Timbre.SelloCFD;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloSAT').Value:= RtFD.Timbre.SelloSAT;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2UUID').Value:= RtFD.Timbre.UUID;
//    adopSetCFDILog.ExecProc;
//  end;
//begin
//  if pFilesXML.Count = 0 then exit;
//  WSTFD := GetIWSTFD(true, '', nil);
//  for vContador := 0 to pFilesXML.Count - 1 do
//  begin
//    vFileName := pFilesXML.Item[vContador].Caption;
//    vFileNameXML := vFileName + '.XML';
//    vFile := pDirXML + PathDelim + vFileNameXML;
//    vFileXML := pDirXMLFD + PathDelim + vFileNameXML;
//    xmlO:= LoadXMLDocument(vFile);
//    xmlO.Active:= True;
//    RtFD := WSTFD.TimbrarCFDI(FDUser, FDPass, xmlO.XML.Text, vFileName);
//    if RtFD.OperacionExitosa then
//    begin
//      xmlR := NewXMLDocument();
//      xmlR.XML.Text:= RtFD.XMLResultado;
//      xmlR.Active := True;
//      xmlR.SaveToFile(vFileXML);
//      AgregarLog;
////      AgregarMensaje('Timbrado FD: ' + vFileName);
//    end
//    else
//    begin
//      AgregarLog;
////      AgregarMensaje('Hubo un Error:' + RtFD.MensajeError + ' / ' + RtFD.MensajeErrorDetallado);
//    end;
//    ShowProgress(vContador, pFilesXML.Count - 1);
//  end;
//end;

//function TdmCFDI.FDTimbrar(pMes: Integer; pDirXML, pDirXMLFD: String;
//pFileName: String): Boolean;
//var
//  vFileNameXML : String;
//  vFile: String;
//  vFileXML: String;
//  WSTFD: IWSTFD;
//  RtFD: RespuestaTFD2;
//  xmlO, xmlR: IXmlDocument;
//
//  procedure AgregarLog;
//  begin
//    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
//    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= pFileName;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RtFD.CodigoRespuesta;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RtFD.MensajeError;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
//    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
//    if Assigned(RtFD.Timbre) then
//    begin
//      adopSetCFDILog.Parameters.ParamByName('@TFD2Estado').Value:= RtFD.Timbre.Estado;
//      adopSetCFDILog.Parameters.ParamByName('@TFD2FechaTimbrado').Value:= RtFD.Timbre.FechaTimbrado.AsDateTime;
//      adopSetCFDILog.Parameters.ParamByName('@TFD2NumeroCertificadoSAT').Value:= RtFD.Timbre.NumeroCertificadoSAT;
//      adopSetCFDILog.Parameters.ParamByName('@TFD2SelloCFD').Value:= RtFD.Timbre.SelloCFD;
//      adopSetCFDILog.Parameters.ParamByName('@TFD2SelloSAT').Value:= RtFD.Timbre.SelloSAT;
//      adopSetCFDILog.Parameters.ParamByName('@TFD2UUID').Value:= RtFD.Timbre.UUID;
//    end;
//    adopSetCFDILog.ExecProc;
//  end;
//begin
//  WSTFD := GetIWSTFD(true, '', nil);
//  vFileNameXML := pFileName + '.XML';
//  vFile := pDirXML + PathDelim + vFileNameXML;
//  vFileXML := pDirXMLFD + PathDelim + vFileNameXML;
//  xmlO:= LoadXMLDocument(vFile);
//  xmlO.Active:= True;
//  RtFD := WSTFD.TimbrarCFDI(FDUser, FDPass, xmlO.XML.Text, pFileName);
//  if RtFD.OperacionExitosa then
//  begin
//    xmlR := NewXMLDocument();
//    xmlR.XML.Text:= RtFD.XMLResultado;
//    xmlR.Active := True;
//    xmlR.SaveToFile(vFileXML);
//    AgregarLog;
//    Result:= True;
//  end
//  else
//  begin
//    AgregarLog;
//    Result:= False;
//  end;
//end;

end.
