unit CFDIDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Forms,
  Vcl.Dialogs, Windows, Vcl.ComCtrls, CFDLibHeader, DataTypeCast,
  System.Actions, Vcl.ActnList, Soap.EncdDecd,
  FacturaTipos,
  cxMemo;

type
  TdmCFDI = class(TDataModule)
    adopSetCFDILog: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FBitacora: TcxMemo;
    FDirEXE: String;
    FFDPass: string;
    FFDUser: string;
    procedure AgregarMensaje(pLinea: String);
    procedure SetBitacora(const Value: TcxMemo);
    /// <summary> Calculamos el sello digital para la cadena original de la factura
    /// Es importante que en cualquier variable que almacenemos la cadena original
    /// sea del tipo TStringCadenaOriginal para no perder la codificacion UTF8</summary>
    /// <param name="CadenaOriginal"> Cadenaorginal para genera el sello del comprobante</param>
    function GetSelloDigital(CadenaOriginal: TStringCadenaOriginal): String;
    function GetCadenOriginalTimbreFromCFDI(
      pFileNameXML: string): TStringCadenaOriginal;
    procedure SetFDPass(const Value: string);
    procedure SetFDUser(const Value: string);
  public
    { Public declarations }
    FCertificado: TFECertificado;
    property DirEXE: String read FDirEXE;
    property Bitacora: TcxMemo read FBitacora write SetBitacora;
    property FDUser: string read FFDUser write SetFDUser;
    property FDPass: string read FFDPass write SetFDPass;
    procedure CrearXML(pMes: Integer; pDirINI, pDirINIPr, pDirError, pDirXML,
      pDirXMLFD: String; pFilesINI: TListItems);
    procedure CrearXMLMasivo(pDirINI, pDirXML: String; pFilesINI: TListItems);
    procedure Timbrar(pDirINI: String; pFilesINI: TListItems);
    function FDTimbrar(pMes: Integer; pDirXML, pDirXMLFD, pFileName: String): Boolean;
    procedure FDTimbrarMasivo(pMes: Integer; pDirXML, pDirXMLFD: String;
      pFilesXML: TListItems);
    function FDObtenerPDF(pUID, pFileNamePDF: string): Boolean;
    procedure FDConsultarTimbrePorReferencia(pFileNameXML, pReferencia: string);
    function CrearPDF(pFileNameXML, pFileNamePDF: string): Boolean;
    procedure CrearPDFMasivo(pMes: Integer; pDirXML, pDirPDF: String;
      pFilesXML: TListItems);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils, MainFrm, WSTFD, xmlDoc, XMLIntf,
  SelloDigital, ClaseOpenSSL, ClaseCertificadoSellos, CadenaOriginalTimbre,
  XMLtoPDFDmod;

{$R *.dfm}

{ TdmCFDI }

procedure TdmCFDI.AgregarMensaje(pLinea: String);
begin
  if Assigned(Bitacora) then
    Bitacora.Lines.Add(pLinea);
end;

function TdmCFDI.CrearPDF(pFileNameXML, pFileNamePDF: string): Boolean;
var
  dmodXMLtoPDF: TdmodXMLtoPDF;
begin
  Result:= False;
  if FileExists(pFileNameXML) then
  begin
    dmodXMLtoPDF := TdmodXMLtoPDF.Create(Self);
    try
      dmodXMLtoPDF.CadenaOriginalTimbre:=  GetCadenOriginalTimbreFromCFDI(pFileNameXML);
      dmodXMLtoPDF.FileRTM := DirExe + PathDelim + 'CFDINominaCOBAEM.rtm';
      dmodXMLtoPDF.FileXTR := DirExe + PathDelim + 'CFDI32_N11.xtr';
      dmodXMLtoPDF.GeneratePDFFile(pFileNameXML, pFileNamePDF);
      Result:= True;
    finally
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

procedure TdmCFDI.CrearXML(pMes: Integer; pDirINI, pDirINIPr, pDirError, pDirXML, pDirXMLFD: String; pFilesINI: TListItems);
var
  vCountTotal, vContador: Integer;
  vFileName: String;
  vFileNameINI: String;
  vFileNameXML: String;
  vFileINI: String;
  vFileXML: String;
  vSD: string;
  xml: IXmlDocument;

  procedure ErrorLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
    adopSetCFDILog.Parameters.ParamByName('@XMLCreado').Value:= False;
    adopSetCFDILog.Parameters.ParamByName('@XMLFecha').Value:= Now;
    adopSetCFDILog.Parameters.ParamByName('@XMLError').Value:= 'Error:' + GetError + ' / ' + GetErrorExt;
    adopSetCFDILog.ExecProc;
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
		if GeneraCFD(ToChar(vFileINI),ToChar(FCertificado.LlavePrivada.Clave)) = OK then
    begin
      // Se genera nuevamente el sello ya que la libreria LibDLL deliberadamente lo genera incorrecto.
      vSD:= GetSelloDigital(Utf8Encode(CFDLibHeader.CadenaOriginal));
      xml:= LoadXMLDocument(vFileXML);
      xml.Active:= True;
      if XML.DocumentElement.HasAttribute('sello') then
      begin
        XML.DocumentElement.Attributes['sello'] := vSD
      end;
      xml.SaveToFile(vFileXML);
      if FDTimbrar(pMes, pDirXML, pDirXMLFD, vFileName) then
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
      vSD:= GetSelloDigital(Utf8Encode(CFDLibHeader.CadenaOriginal));
      xml:= LoadXMLDocument(vFileXML);
      xml.Active:= True;
      if XML.DocumentElement.HasAttribute('sello') then
      begin
        XML.DocumentElement.Attributes['sello'] := vSD
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
			AgregarMensaje('Hubo un Error:' + GetError + ' / ' + GetErrorExt);
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

procedure TdmCFDI.SetFDPass(const Value: string);
begin
  FFDPass := Value;
end;

procedure TdmCFDI.SetFDUser(const Value: string);
begin
  FFDUser := Value;
end;

procedure TdmCFDI.Timbrar(pDirINI: String; pFilesINI: TListItems);
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
			AgregarMensaje('Hubo un Error:' + GetError + ' / ' + GetErrorExt);
    end;
    ShowProgress(vContador, pFilesINI.Count - 1);
  end;
end;

procedure TdmCFDI.FDConsultarTimbrePorReferencia(pFileNameXML,
  pReferencia: string);
var
  WSTFD: IWSTFD;
  RtFD: RespuestaTFD2;
  xml: IXmlDocument;
begin
  WSTFD := GetIWSTFD(true, '', nil);
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
  WSTFD: IWSTFD;
  RtFD: RespuestaTFD2;

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
begin
  Result:= False;
  WSTFD := GetIWSTFD(true, '', nil);
  RtFD := WSTFD.ObtenerPDF(FDUser, FDPass, pUID, EmptyStr);
  if RtFD.OperacionExitosa then
  begin
    DecodeFile(RtFD.PDFResultado, pFileNamePDF);
    Result:= True;
  end;
end;

procedure TdmCFDI.FDTimbrarMasivo(pMes: Integer; pDirXML, pDirXMLFD: String;
pFilesXML: TListItems);
var
  vContador: Integer;
  vFileName, vFileNameXML : String;
  vFile: String;
  vFileXML: String;
  WSTFD: IWSTFD;
  RtFD: RespuestaTFD2;
  xmlO, xmlR: IXmlDocument;

  procedure AgregarLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= vFileName;
    adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RtFD.CodigoRespuesta;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RtFD.MensajeError;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Estado').Value:= RtFD.Timbre.Estado;
    adopSetCFDILog.Parameters.ParamByName('@TFD2FechaTimbrado').Value:= RtFD.Timbre.FechaTimbrado.AsDateTime;
    adopSetCFDILog.Parameters.ParamByName('@TFD2NumeroCertificadoSAT').Value:= RtFD.Timbre.NumeroCertificadoSAT;
    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloCFD').Value:= RtFD.Timbre.SelloCFD;
    adopSetCFDILog.Parameters.ParamByName('@TFD2SelloSAT').Value:= RtFD.Timbre.SelloSAT;
    adopSetCFDILog.Parameters.ParamByName('@TFD2UUID').Value:= RtFD.Timbre.UUID;
    adopSetCFDILog.ExecProc;
  end;
begin
  if pFilesXML.Count = 0 then exit;
  WSTFD := GetIWSTFD(true, '', nil);
  for vContador := 0 to pFilesXML.Count - 1 do
  begin
    vFileName := pFilesXML.Item[vContador].Caption;
    vFileNameXML := vFileName + '.XML';
    vFile := pDirXML + PathDelim + vFileNameXML;
    vFileXML := pDirXMLFD + PathDelim + vFileNameXML;
    xmlO:= LoadXMLDocument(vFile);
    xmlO.Active:= True;
    RtFD := WSTFD.TimbrarCFDI(FDUser, FDPass, xmlO.XML.Text, vFileName);
    if RtFD.OperacionExitosa then
    begin
      xmlR := NewXMLDocument();
      xmlR.XML.Text:= RtFD.XMLResultado;
      xmlR.Active := True;
      xmlR.SaveToFile(vFileXML);
      AgregarLog;
//      AgregarMensaje('Timbrado FD: ' + vFileName);
    end
    else
    begin
      AgregarLog;
//      AgregarMensaje('Hubo un Error:' + RtFD.MensajeError + ' / ' + RtFD.MensajeErrorDetallado);
    end;
    ShowProgress(vContador, pFilesXML.Count - 1);
  end;
end;

function TdmCFDI.FDTimbrar(pMes: Integer; pDirXML, pDirXMLFD: String;
pFileName: String): Boolean;
var
  vFileNameXML : String;
  vFile: String;
  vFileXML: String;
  WSTFD: IWSTFD;
  RtFD: RespuestaTFD2;
  xmlO, xmlR: IXmlDocument;

  procedure AgregarLog;
  begin
    adopSetCFDILog.Parameters.ParamByName('@Periodo').Value:= pMes;
    adopSetCFDILog.Parameters.ParamByName('@XMLNombre').Value:= vFileNameXML;
    adopSetCFDILog.Parameters.ParamByName('@TFD2Referencia').Value:= pFileName;
    adopSetCFDILog.Parameters.ParamByName('@TFD2CodigoRespuesta').Value:= RtFD.CodigoRespuesta;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeError').Value:= RtFD.MensajeError;
    adopSetCFDILog.Parameters.ParamByName('@TFD2MensajeErrorDetallado').Value:= RtFD.MensajeErrorDetallado;
    adopSetCFDILog.Parameters.ParamByName('@TFD2OperacionExitosa').Value:= RtFD.OperacionExitosa;
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
  WSTFD := GetIWSTFD(true, '', nil);
  vFileNameXML := pFileName + '.XML';
  vFile := pDirXML + PathDelim + vFileNameXML;
  vFileXML := pDirXMLFD + PathDelim + vFileNameXML;
  xmlO:= LoadXMLDocument(vFile);
  xmlO.Active:= True;
  RtFD := WSTFD.TimbrarCFDI(FDUser, FDPass, xmlO.XML.Text, pFileName);
  if RtFD.OperacionExitosa then
  begin
    xmlR := NewXMLDocument();
    xmlR.XML.Text:= RtFD.XMLResultado;
    xmlR.Active := True;
    xmlR.SaveToFile(vFileXML);
    AgregarLog;
    Result:= True;
  end
  else
  begin
    AgregarLog;
    Result:= False;
  end;
end;

function TdmCFDI.GetCadenOriginalTimbreFromCFDI(
  pFileNameXML: string): TStringCadenaOriginal;
const
  _RUTA_XSLT = './XSLT/cadenaoriginal_TFD_1_0.xslt';
var
  generadorCadenaOriginalTimbre: TCadenaOriginalDeTimbre;
  vTFD: String;

  function GetTFD: String;
  var
    CFDI: IXmlDocument;
    nodeP, nodeD: IXMLNode;
    I,J: Integer;
  begin
    CFDI := LoadXMLDocument(pFileNameXML);
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
            if nodeD.NodeName = 'tfd:TimbreFiscalDigital' then
            begin
              Result:= nodeD.XML;
            end;
          end;
        end;
      end;
    end;
  end;

begin
  vTFD:= GetTFD;
  if vTFD <> EmptyStr then
  begin
    generadorCadenaOriginalTimbre := TCadenaOriginalDeTimbre.Create(vTFD, _RUTA_XSLT);
    Result := generadorCadenaOriginalTimbre.Generar;
  end
  else
    Result:= EmptyStr;
end;

function TdmCFDI.GetSelloDigital(CadenaOriginal: TStringCadenaOriginal): String;
//const
//  _LONGITUD_SELLO_DIGITAL = 172;
var
  SelloDigital: TSelloDigital;
begin
  try
    // Creamos la clase SelloDigital que nos ayudara a "sellar" la factura en XML
    SelloDigital := TSelloDigital.Create(CadenaOriginal, fCertificado, tdSHA1);
    try
      result := SelloDigital.SelloCalculado;
    finally
      FreeAndNil(SelloDigital);
    end;
  except
    // TODO: Manejar los diferentes tipos de excepciones...
    on E:Exception do
    begin
      {$IFDEF DEBUG}
        ShowMessage(E.Message);
      {$ENDIF}
      raise;
    end;
  end;
end;

end.
