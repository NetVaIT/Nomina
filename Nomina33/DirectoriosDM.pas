unit DirectoriosDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  Vcl.Forms, Vcl.Controls, System.Actions, Vcl.ActnList, Vcl.Dialogs,
  DirectoriosFrm, CFDIDM;

const
  cDirINI = 'INI';
  cDirINIPr = 'INIPr';
  cDirXML = 'XML';
  cDirXMLFD = 'XMLFD';
  cDirError = 'Error';
  cDirPDF = 'PDF';

type
  TdmDirectorios = class(TDataModule)
    ActionList: TActionList;
    actCrearINI: TAction;
    actCrearXML: TAction;
    actTimbrar: TAction;
    actFDObtener: TAction;
    actFDObtenerPDF: TAction;
    adoqryPDF: TADOQuery;
    adoqryPDFCount: TADOQuery;
    adoqryPDFIdCFDILog: TAutoIncField;
    adoqryPDFTFD2Referencia: TStringField;
    adoqryPDFTFD2UUID: TStringField;
    adoqryPDFCountCUENTA: TIntegerField;
    adocUptLog: TADOCommand;
    actCrearPDF: TAction;
    actFDConsultarCreditos: TAction;
    adoqryPDFXMLNombre: TStringField;
    actCancelar: TAction;
    adoqCancelar: TADOQuery;
    adoqCancelarCount: TADOQuery;
    adoqCancelarCountCUENTA: TIntegerField;
    actCancelarMarcados: TAction;
    adoqCancelarIdCFDILog: TAutoIncField;
    adoqCancelarRFCReceptor: TWideStringField;
    adoqCancelarTotal: TFloatField;
    adoqCancelarUUID: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure actCrearINIExecute(Sender: TObject);
    procedure actCrearXMLExecute(Sender: TObject);
    procedure actTimbrarExecute(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure actFDObtenerExecute(Sender: TObject);
    procedure actFDObtenerPDFExecute(Sender: TObject);
    procedure actCrearPDFExecute(Sender: TObject);
    procedure actFDConsultarCreditosExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actCancelarMarcadosExecute(Sender: TObject);
  private
    { Private declarations }
    FModulo: Integer;
    FDirXML: String;
    FDirINI: String;
    FDirEXE: String;
    FDirError: String;
    FDirXMLFD: String;
    frmDirectorios: TfrmDirectorios;
    dmCFDI: TdmCFDI;
    FDirINIPr: String;
    FDirPDF: String;
    procedure FDObtenerPDF(pAnio, pMes: Integer; pFiltrar: Boolean);
    procedure CrearPDF(pAnio, pMes: Integer; pFiltrar: Boolean);
    procedure CancelarMarcados;
    procedure ValidarDirectorios;
    procedure DirectoriosActualizar;
  public
    { Public declarations }
    constructor CreateWModulo(AOwner: TComponent; Modulo: Integer);
    property DirEXE: String read FDirEXE;
    property DirINI: String read FDirINI;
    property DirINIPr: String read FDirINIPr;
    property DirXML: String read FDirXML;
    property DirXMLFD: String read FDirXMLFD;
    property DirPDF: String read FDirPDF;
    property DirError: String read FDirError;
    procedure ShowModule(pConteiner: TWinControl; pCation: TCaption);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils, MainFrm, COBAEMDM, IntervaDM;

{$R *.dfm}

{ TdmCOBAEM }

procedure TdmDirectorios.actCancelarExecute(Sender: TObject);
begin
//  dmCFDI.Cancelar(frmDirectorios.UUID);
end;

procedure TdmDirectorios.actCancelarMarcadosExecute(Sender: TObject);
begin
  CancelarMarcados;
end;

procedure TdmDirectorios.actCrearINIExecute(Sender: TObject);
var
  dmCOBAEM: TdmCOBAEM;
  dmInterva: TdmInterva;
begin
  ValidarDirectorios;
  case FModulo of
    1: begin
      dmInterva := TdmInterva.Create(Self);
      try
        dmInterva.FCertificado.Ruta := '.\Certificados\CertificadoFirmadoPM.cer';
        dmInterva.FCertificado.LlavePrivada.Ruta := '.\Certificados\LlavePkcs8PM.key';
        dmInterva.FCertificado.LlavePrivada.Clave := '12345678a';
        dmInterva.FCertificado.RFCAlQuePertenece := 'TES030201001';
        dmInterva.LugarExpedicion := '58290';
        dmInterva.EmisorRFC := 'CPE980406816';
        dmInterva.EmisorNombre := 'COMISION DE PESCA DEL ESTADO DE MICHOACAN';
        dmInterva.EmisorRegimenFiscal := '603';
        dmInterva.RegistroPatronal := '80158574752';
        dmInterva.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmInterva.Free;
      end;
    end;
//    1: begin
//      dmCOBAEM := TdmCOBAEM.Create(Self);
//      try
//        dmCOBAEM.FCertificado.Ruta := '.\Certificados\CertificadoFirmadoPM.cer';
//        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\LlavePkcs8PM.key';
//        dmCOBAEM.FCertificado.LlavePrivada.Clave := '12345678a';
//        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'TES030201001';
//        dmCOBAEM.LugarExpedicion := '58290';
//        dmCOBAEM.EmisorRFC := 'CPE980406816';
//        dmCOBAEM.EmisorNombre := 'COMISION DE PESCA DEL ESTADO DE MICHOACAN';
//        dmCOBAEM.EmisorRegimenFiscal := '603';
//        dmCOBAEM.RegistroPatronal := '80158574752';
//        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
//      finally
//        dmCOBAEM.Free;
//      end;
//    end;
    3: begin
      dmInterva := TdmInterva.Create(Self);
      try
        dmInterva.FCertificado.Ruta := '.\Certificados\SSS960912HW9_20180307_124415s.cer';
        dmInterva.FCertificado.LlavePrivada.Ruta := '.\Certificados\SSS960912HW9_20180307_124415.key';
        dmInterva.FCertificado.LlavePrivada.Clave := '96091200CSDNOM18';
        dmInterva.FCertificado.RFCAlQuePertenece := 'SSS960912HW9';
        dmInterva.LugarExpedicion := '78380';
        dmInterva.EmisorRFC := 'SSS960912HW9';
        dmInterva.EmisorNombre := 'SERVICIOS DE SALUD DE SAN LUIS POTOSI';
        dmInterva.EmisorRegimenFiscal := '603';
        dmInterva.RegistroPatronal := '12924S2424';
        dmInterva.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmInterva.Free;
      end;
    end;
    5: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\CSD_JMA880101MB2_20190222_090915s.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_JMA880101MB2_20190222_090915.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'jumapam88';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'JMA880101MB2';
        dmCOBAEM.LugarExpedicion := '82000';
        dmCOBAEM.EmisorRFC := 'JMA880101MB2';
        dmCOBAEM.EmisorNombre := 'JUNTA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO DE MAZATLAN, SINALOA';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := '23053863108';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    6: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\00001000000404505437.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CDS_PLE530816HC1_20161208_102907.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'HBCrhr03';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'PLE530816HC1';
        dmCOBAEM.LugarExpedicion := '21000';
        dmCOBAEM.EmisorRFC := 'PLE530816HC1';
        dmCOBAEM.EmisorNombre := 'Poder Legislativo del Estado de Baja California';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := '10973';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    // BPS
    10: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\00001000000409583489.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CBE830914QZ0_20180219_175953.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'TESO3303';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'CBE830914QZ0';
        dmCOBAEM.LugarExpedicion := '58170';
        dmCOBAEM.EmisorRFC := 'CBE830914QZ0';
        dmCOBAEM.EmisorNombre := 'COLEGIO DE BACHILLERES DEL ESTADO DE MICHOACAN';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := '07016053';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    11: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\00001000000307555908.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CAP980611AR5_20150709_135222.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'CAP980611AR5';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'CAP980611AR5';
        dmCOBAEM.LugarExpedicion := '58280';
        dmCOBAEM.EmisorRFC := 'CAP980611AR5';
        dmCOBAEM.EmisorNombre := 'COMITE DE ADQUISICIONES DEL PODER EJECUTIVO';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := 'C891039110';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    12: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'Pesca6819';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'CPE980406816';
        dmCOBAEM.LugarExpedicion := '58290';
        dmCOBAEM.EmisorRFC := 'CPE980406816';
        dmCOBAEM.EmisorNombre := 'COMISION DE PESCA DEL ESTADO DE MICHOACAN';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := 'C891039110-0';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    13: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\00001000000405966542.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_AST840426RQ9_20170417_135654.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'teca2016';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'AST840426RQ9';
        dmCOBAEM.LugarExpedicion := '58920';
        dmCOBAEM.EmisorRFC := 'AST840426RQ9';
        dmCOBAEM.EmisorNombre := 'ALMACENES, SERVICIOS Y TRANSPORTES EXTRAORDINARIOS A COMUNIDADES AGROPECUARIAS DEL ESTADO DE MICHOACAN S.A. DE C.V.';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := 'C891039110-0';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    14: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\CSD_PODER_JUDICAL_PJE141120LY3_20181222_134517s.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_PODER_JUDICAL_PJE141120LY3_20181222_134517.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := '141120LY';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'PJE141120LY3';
        dmCOBAEM.LugarExpedicion := '58190';
        dmCOBAEM.EmisorRFC := 'PJE141120LY3';
        dmCOBAEM.EmisorNombre := 'PODER JUDICIAL DEL ESTADO DE MICHOACAN';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := 'C8910391100';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    20: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\00001000000504513712.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MGU420214FG4_20200717_100911.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'Despacho2015.';
        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'MGU420214FG4';
        dmCOBAEM.LugarExpedicion := '44100';
        dmCOBAEM.EmisorRFC := 'MGU420214FG4';
        dmCOBAEM.EmisorNombre := 'MUNICIPIO DE GUADALAJARA';
        dmCOBAEM.EmisorRegimenFiscal := '603';
        dmCOBAEM.RegistroPatronal := '';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    21: begin
      dmInterva := TdmInterva.Create(Self);
      try
        dmInterva.FCertificado.Ruta := '.\Certificados\00001000000504513712.cer';
        dmInterva.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MGU420214FG4_20200717_100911.key';
        dmInterva.FCertificado.LlavePrivada.Clave := 'Despacho2015.';
        dmInterva.FCertificado.RFCAlQuePertenece := 'MGU420214FG4';
        dmInterva.LugarExpedicion := '44100';
        dmInterva.EmisorRFC := 'MGU420214FG4';
        dmInterva.EmisorNombre := 'MUNICIPIO DE GUADALAJARA';
        dmInterva.EmisorRegimenFiscal := '603';
        dmInterva.RegistroPatronal := '';
        dmInterva.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmInterva.Free;
      end;
    end;

  end;
  DirectoriosActualizar;
end;

procedure TdmDirectorios.actCrearPDFExecute(Sender: TObject);
begin
  ValidarDirectorios;
  CrearPDF(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar);
end;

procedure TdmDirectorios.actCrearXMLExecute(Sender: TObject);
begin
  ValidarDirectorios;
  {$IFDEF DEBUG}
    // Solo Genera XML
    dmCFDI.CrearXMLMasivo(DirINI, DirXML, frmDirectorios.cxslvInbox.InnerListView.Items);
  {$ELSE}
    // Genera XML y timbra
    dmCFDI.CrearXMLTimbrar(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, frmDirectorios.DetenerError,
    DirINI, DirINIPr, DirError, DirXML, DirXMLFD, frmDirectorios.cxslvInbox.InnerListView.Items);
  {$ENDIF}
  DirectoriosActualizar;
end;

procedure TdmDirectorios.actTimbrarExecute(Sender: TObject);
begin
  ValidarDirectorios;
  dmCFDI.TimbrarEcodex(DirINI, frmDirectorios.cxslvInbox.InnerListView.Items);
  DirectoriosActualizar;
end;

procedure TdmDirectorios.actFDConsultarCreditosExecute(Sender: TObject);
begin
  dmCFDI.FDConsultarCreditos;
end;

procedure TdmDirectorios.actFDObtenerExecute(Sender: TObject);
begin
//
end;

procedure TdmDirectorios.actFDObtenerPDFExecute(Sender: TObject);
begin
  ValidarDirectorios;
  FDObtenerPDF(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar);
end;

// Cancelar CFDI
//SELECT        CFDILog.IdCFDILog, CFDI.RECEPTOR_RFC AS RFCReceptor, CFDI.TOTAL_LIQUIDO AS Total, CFDILog.TFD2UUID AS UUID
//FROM            CFDILog INNER JOIN
//                         CFDI ON CFDILog.ID_CFDI = CFDI.ID_CFDI
//WHERE        (CFDILog.Cancelar = 1) AND (CFDILog.TFD2Estado = 'Vigente')
// Cancelar CFDCFDI
//SELECT        CFDI.ID, CFDILog.IdCFDILog, CFDI.frfcreceptor AS RFCReceptor, CFDI.fTotal AS Total, CFDILog.TFD2UUID AS UUID
//FROM            CFDILog INNER JOIN
//                        CFDCFDI AS CFDI ON CFDILog.ID_CFDI = CFDI.ID
//WHERE        (CFDILog.Cancelar = 1) AND (CFDILog.TFD2Estado = 'Vigente')
//ORDER BY CFDILog.IdCFDILog
procedure TdmDirectorios.CancelarMarcados;
var
  vCount: Integer;
  vCountTotal: Integer;
begin
  vCount := 0;
  adoqCancelarCount.Close;
  adoqCancelarCount.Open;
  vCountTotal:= adoqCancelarCountCUENTA.Value;
  adoqCancelarCount.Close;

  adoqCancelar.Close;
  adoqCancelar.Open;
  try
    while not adoqCancelar.Eof do
    begin
      dmCFDI.Cancelar(adoqCancelarRFCReceptor.AsString, adoqCancelarUUID.AsString, adoqCancelarTotal.AsExtended);
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqCancelar.Next;
    end;
  finally
    adoqCancelar.Close;
  end;
  ShowProgress(0, 0);
  ShowMessage('Cancelacion terminado');
end;

procedure TdmDirectorios.CrearPDF(pAnio, pMes: Integer; pFiltrar: Boolean);
var
  vCount: Integer;
  vCountTotal: Integer;
  vFileXML: string;
  vFilePDF: string;
begin
  vCount := 0;
  adoqryPDFCount.Close;
  if pFiltrar then
  begin
    adoqryPDFCount.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryPDFCount.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryPDFCount.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryPDFCount.Parameters.ParamByName('Anio2').Value:= pAnio;
  end;
  adoqryPDFCount.Open;
  vCountTotal:= adoqryPDFCountCUENTA.Value;
  adoqryPDFCount.Close;

  adoqryPDF.Close;
  if pFiltrar then
  begin
    adoqryPDF.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryPDF.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryPDF.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryPDF.Parameters.ParamByName('Anio2').Value:= pAnio;
  end;
  adoqryPDF.Open;
  try
    while not adoqryPDF.Eof do
    begin
      vFileXML := DirXMLFD + PathDelim + adoqryPDFXMLNombre.AsString;
      vFilePDF := DirPDF + PathDelim + ChangeFileExt(adoqryPDFXMLNombre.AsString, '.PDF');
      if dmCFDI.CrearPDF(vFileXML, vFilePDF) then
      begin
        adocUptLog.Parameters.ParamByName('IdCFDILog').Value := adoqryPDFIdCFDILog.Value;
        adocUptLog.Execute;
      end;
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqryPDF.Next;
    end;
  finally
    adoqryPDF.Close;
  end;
  ShowProgress(0, 0);
  ShowMessage('Obtenci�n de PDF terminado');
end;

constructor TdmDirectorios.CreateWModulo(AOwner: TComponent; Modulo: Integer);
begin
  FModulo:= Modulo;
  inherited Create(AOwner);
end;

procedure TdmDirectorios.DataModuleCreate(Sender: TObject);
begin
  FDirEXE := ExtractFileDir(Application.ExeName);
  FDirINI := DirEXE + PathDelim + cDirINI;
  FDirINIPr := DirEXE + PathDelim + cDirINIPr;
  FDirError := DirEXE + PathDelim + cDirError;
  FDirXML := DirEXE + PathDelim + cDirXML;
  FDirXMLFD := DirEXE + PathDelim + cDirXMLFD;
  FDirPDF := DirEXE + PathDelim + cDirPDF;
  ValidarDirectorios;
  frmDirectorios:= TfrmDirectorios.Create(Self);
  frmDirectorios.InboxDirectory:= DirINI;
  frmDirectorios.OutboxDirectory:= DirXML;
  frmDirectorios.ErrorDirectory:= DirError;
  frmDirectorios.ProcessDirectory:= DirXMLFD;
  frmDirectorios.actCrearINI := actCrearINI;
  frmDirectorios.actCrearXML := actCrearXML;
  frmDirectorios.actCrearPDF := actCrearPDF;
  frmDirectorios.actFDConsultarCreditos := actFDConsultarCreditos;
  frmDirectorios.actTimbrar := actTimbrar;
  frmDirectorios.actFDObtenerPDF := actFDOBtenerPDF;
  frmDirectorios.actFDObtener := actFDObtener;
  frmDirectorios.actCancelar := actCancelar;
  frmDirectorios.actCancelarMarcados := actCancelarMarcados;
  dmCFDI := TdmCFDI.Create(Self);
  dmCFDI.Bitacora := frmDirectorios.mBitacora;
  case FModulo of
    1: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CertificadoFirmadoPM.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\LlavePkcs8PM.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := '12345678a';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'CBE830914D33';
      dmCFDI.FDPass:= 'contRa$3na';

//      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD010_AAA010101AAA.cer';
//      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD010_AAA010101AAA.key';
//      dmCFDI.FCertificado.LlavePrivada.Clave := '12345678a';
//      dmCFDI.FCertificado.RFCAlQuePertenece := 'AAA010101AAA';
//      dmCFDI.PAC := pacFinkok;
//      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
//      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    3: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\SSS960912HW9_20180307_124415s.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\SSS960912HW9_20180307_124415.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := '96091200CSDNOM18';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'SSS960912HW9';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'SSS960912HW9';
      dmCFDI.FDPass:= 'v@AVJzGsS=';
      dmCFDI.FDPFXFile:= '.\Certificados\SSS960912HW9.pem';
      dmCFDI.FDPFXPass:= '96091200CSDNOM18';
    end;
    5: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_JMA880101MB2_20190222_090915s.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_JMA880101MB2_20190222_090915.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'jumapam88';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'JMA880101MB2';
      dmCFDI.PAC := pacFoliosDigitales;
      // Credenciales de los primeros 50000 timbres
//      dmCFDI.FDUser:= 'BRA140225GN1';
//      dmCFDI.FDPass:= '@2si6my%';
      // Credenciales del segundo paquete
      dmCFDI.FDUser:= 'JMA880101MB2';
      dmCFDI.FDPass:= '@2si6myFf%';
      dmCFDI.FDPFXFile:= '.\Certificados\JMA880101MB2.pem';
      dmCFDI.FDPFXPass:= 'jumapam88';
    end;
    6: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000404505437.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CDS_PLE530816HC1_20161208_102907.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'HBCrhr03';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'PLE530816HC1';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'PLE530816HC1';
      dmCFDI.FDPass:= 'XJGwkBMUt@';
    end;
    // BPS
    10: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000409583489.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CBE830914QZ0_20180219_175953.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'TESO3303';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'CBE830914QZ0';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'CBE830914QZ0';
      dmCFDI.FDPass:= 'sOeU$uBBm7c@';
      dmCFDI.FDPFXFile:= '.\Certificados\CBE830914QZ0.pem';
      dmCFDI.FDPFXPass:= 'TESO3303';
    end;
    11: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000307555908.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CAP980611AR5_20150709_135222.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'CAP980611AR5';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    12: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Pesca6819';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    13: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000405966542.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_AST840426RQ9_20170417_135654.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'teca2016';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    14: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_PODER_JUDICAL_PJE141120LY3_20181222_134517s.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_PODER_JUDICAL_PJE141120LY3_20181222_134517.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := '141120LY';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    20: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000504513712.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MGU420214FG4_20200717_100911.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Despacho2015.';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'MGU420214FG4';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'MGU420214FG4';
      dmCFDI.FDPass:= 'Sf4RhWCOn+';
//      dmCFDI.FDPFXFile:= '.\Certificados\MGU420214FG4.pem';
//      dmCFDI.FDPFXPass:= 'Despacho2015.';
    end;
    21: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\00001000000504513712.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MGU420214FG4_20200717_100911.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Despacho2015.';
      dmCFDI.FCertificado.RFCAlQuePertenece := 'MGU420214FG4';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'MGU420214FG4';
      dmCFDI.FDPass:= 'Sf4RhWCOn+';
      dmCFDI.FDPFXFile:= '.\Certificados\MGU420214FG4.pem';
      dmCFDI.FDPFXPass:= 'Despacho2015.';
    end;
  end;
end;

procedure TdmDirectorios.DataModuleDestroy(Sender: TObject);
begin
  frmDirectorios.Free;
  dmCFDI.Free;
end;

procedure TdmDirectorios.DirectoriosActualizar;
begin
  if Assigned(frmDirectorios) then
  begin
    frmDirectorios.cxslvInbox.UpdateContent;
    frmDirectorios.cxslvOutbox.UpdateContent;
    frmDirectorios.cxslvError.UpdateContent;
    frmDirectorios.cxslvProcess.UpdateContent;
  end;
end;

procedure TdmDirectorios.FDObtenerPDF(pAnio, pMes: Integer; pFiltrar: Boolean);
var
  vCount: Integer;
  vCountTotal: Integer;
  vFilePDF: string;
begin
  vCount := 0;
  adoqryPDFCount.Close;
  if pFiltrar then
  begin
    adoqryPDFCount.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryPDFCount.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryPDFCount.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryPDFCount.Parameters.ParamByName('Anio2').Value:= pAnio;
  end
  else
  begin
    adoqryPDFCount.Parameters.ParamByName('Mes1').Value:= 0;
    adoqryPDFCount.Parameters.ParamByName('Mes2').Value:= 0;
    adoqryPDFCount.Parameters.ParamByName('Anio1').Value:= 0;
    adoqryPDFCount.Parameters.ParamByName('Anio2').Value:= 0;
  end;
  adoqryPDFCount.Open;
  vCountTotal:= adoqryPDFCountCUENTA.Value;
  adoqryPDFCount.Close;

  adoqryPDF.Close;
  if pFiltrar then
  begin
    adoqryPDF.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryPDF.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryPDF.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryPDF.Parameters.ParamByName('Anio2').Value:= pAnio;
  end
  else
  begin
    adoqryPDF.Parameters.ParamByName('Mes1').Value:= 0;
    adoqryPDF.Parameters.ParamByName('Mes2').Value:= 0;
    adoqryPDF.Parameters.ParamByName('Anio1').Value:= 0;
    adoqryPDF.Parameters.ParamByName('Anio2').Value:= 0;
  end;
  adoqryPDF.Open;
  try
    while not adoqryPDF.Eof do
    begin
      vFilePDF := DirPDF + PathDelim + adoqryPDFTFD2Referencia.AsString + '.PDF';
      if dmCFDI.FDObtenerPDF(adoqryPDFTFD2UUID.AsString, vFilePDF) then
      begin
        adocUptLog.Parameters.ParamByName('IdCFDILog').Value := adoqryPDFIdCFDILog.Value;
        adocUptLog.Execute;
      end;
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqryPDF.Next;
    end;
  finally
    adoqryPDF.Close;
  end;
  ShowProgress(0, 0);
  ShowMessage('Obtenci�n de PDF terminado');
end;

procedure TdmDirectorios.ShowModule(pConteiner: TWinControl; pCation: TCaption);
begin
  if Assigned(frmDirectorios) then
  begin
    if Assigned(pConteiner) then
    begin
      frmDirectorios.Parent:= pConteiner;
      frmDirectorios.Align:= alClient;
//      frmDirectorios.PrintTitle:= pCation;
      frmDirectorios.Caption:= pCation;
//      frmDirectorios.View:= False;
      frmDirectorios.Show;
    end
    else
    begin
//      frmDirectorios.View:= True;
      frmDirectorios.ShowModal;
    end;
  end;
end;

procedure TdmDirectorios.ValidarDirectorios;
begin
//  frmMain.mBitacora.Lines.Clear;
  if not DirectoryExists(DirINI) then CreateDir(DirINI);
  if not DirectoryExists(DirINIPr) then CreateDir(DirINIPr);
  if not DirectoryExists(DirError) then CreateDir(DirError);
  if not DirectoryExists(DirXML) then CreateDir(DirXML);
  if not DirectoryExists(DirXMLFD) then CreateDir(DirXMLFD);
  if not DirectoryExists(DirPDF) then CreateDir(DirPDF);
end;

end.

