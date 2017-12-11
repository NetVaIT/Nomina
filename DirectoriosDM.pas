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
    procedure FDObtenerPDF(pMes: Integer);
    procedure CrearPDF(pAnio, pMes: Integer; pFiltrar: Boolean);
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

uses _Utils, MainFrm, COBAEMDM, IntervaDM, SMRTVDM, IVEMDM, COMPESCADM,
  COFEEEMDM, JUMAPAMDM, CECTIDM;

{$R *.dfm}

{ TdmCOBAEM }

procedure TdmDirectorios.actCancelarExecute(Sender: TObject);
begin
  ValidarDirectorios;
  dmCFDI.Cancelar(frmDirectorios.UUID);
  DirectoriosActualizar;
end;

procedure TdmDirectorios.actCrearINIExecute(Sender: TObject);
var
  dmInterva: TdmInterva;
  dmCOBAEM: TdmCOBAEM;
  dmSMRTV: TdmSMRTV;
  dmIVEM: TdmIVEM;
  dmCOMPESCA: TdmCOMPESCA;
  dmCOFEEEM: TdmCOFEEEM;
  dmCECTI : TdmCECTI;
  dmJUMAPAM: TdmJUMAPAM;
begin
  ValidarDirectorios;
  case FModulo of
//    1: begin
//      dmCOBAEM := TdmCOBAEM.Create(Self);
//      try
//        dmCOBAEM.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
//        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
//        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'DELEGA12';
//        dmCOBAEM.FCertificado.RFCAlQuePertenece := 'ACO560518KW7';
//        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
//      finally
//        dmCOBAEM.Free;
//      end;
//    end;
//    1: begin
//      dmSMRTV := TdmSMRTV.Create(Self);
//      try
//        dmSMRTV.FCertificado.Ruta := '.\Certificados\CSD010_AAA010101AAA.cer';
//        dmSMRTV.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD010_AAA010101AAA.key';
//        dmSMRTV.FCertificado.LlavePrivada.Clave := '12345678a';
//        dmSMRTV.FCertificado.RFCAlQuePertenece := 'AAA010101AAA';
//        dmSMRTV.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
//      finally
//        dmSMRTV.Free;
//      end;
//    end;
    1: begin
      dmJUMAPAM := TdmJUMAPAM.Create(Self);
      try
        dmJUMAPAM.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
        dmJUMAPAM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
        dmJUMAPAM.FCertificado.LlavePrivada.Clave := 'DELEGA12';
        dmJUMAPAM.FCertificado.RFCAlQuePertenece := 'ACO560518KW7';
        dmJUMAPAM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmJUMAPAM.Free;
      end;
    end;

    2: begin
      dmCOBAEM := TdmCOBAEM.Create(Self);
      try
        dmCOBAEM.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
        dmCOBAEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
        dmCOBAEM.FCertificado.LlavePrivada.Clave := 'DELEGA12';
        dmCOBAEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOBAEM.Free;
      end;
    end;
    3: begin
      dmInterva := TdmInterva.Create(Self);
      try
        dmInterva.FCertificado.Ruta := '.\Certificados\CSD_MORELIA_ICT920525GC6_20140311_115055s.cer';
        dmInterva.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_ICT920525GC6_20140311_115055.key';
        dmInterva.FCertificado.LlavePrivada.Clave := 'Icatmi1992';
        dmInterva.CrearINI(cDirINI, cDirXML);
      finally
        dmInterva.Free;
      end;
    end;
    4: begin
      dmSMRTV := TdmSMRTV.Create(Self);
      try
        dmSMRTV.FCertificado.Ruta := '.\Certificados\CSD_DA_SMR8407159IA_20160711_125940.cer';
        dmSMRTV.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_DA_SMR8407159IA_20160711_125940.key';
        dmSMRTV.FCertificado.LlavePrivada.Clave := 'taniabustos2015';
        dmSMRTV.FCertificado.RFCAlQuePertenece := 'SMR8407159IA';
        dmSMRTV.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmSMRTV.Free;
      end;
    end;
    5: begin
      dmIVEM := TdmIVEM.Create(Self);
      try
        dmIVEM.FCertificado.Ruta := '.\Certificados\ive961202li8.cer';
        dmIVEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_IVE961202LI8_20160413_093734.key';
        dmIVEM.FCertificado.LlavePrivada.Clave := 'Nimsey76';
        dmIVEM.FCertificado.RFCAlQuePertenece := 'IVE961202LI8';
        dmIVEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmIVEM.Free;
      end;
    end;
    6: begin
      dmCOMPESCA := TdmCOMPESCA.Create(Self);
      try
        dmCOMPESCA.FCertificado.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.cer';
        dmCOMPESCA.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.key';
        dmCOMPESCA.FCertificado.LlavePrivada.Clave := 'Pesca6819';
        dmCOMPESCA.FCertificado.RFCAlQuePertenece := 'CPE980406816';
        dmCOMPESCA.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOMPESCA.Free;
      end;
    end;
    7: begin
      dmCOFEEEM := TdmCOFEEEM.Create(Self);
      try
        dmCOFEEEM.FCertificado.Ruta := '.\Certificados\CSD_CFE0211159J7_00001000000401858885.cer';
        dmCOFEEEM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CFE0211159J7_20160331_105213.key';
        dmCOFEEEM.FCertificado.LlavePrivada.Clave := 'nancyangelicavallejogarcia161114cofeeem050578';
        dmCOFEEEM.FCertificado.RFCAlQuePertenece := 'CFE0211159J7';
        dmCOFEEEM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCOFEEEM.Free;
      end;
    end;
    8: begin
      dmCECTI := TdmCECTI.Create(Self);
      try
        dmCECTI.FCertificado.Ruta := '.\Certificados\CSD_MATRIZ_CEC0403304L5_20170612_182503s.cer';
        dmCECTI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MATRIZ_CEC0403304L5_20170612_182503.key';
        dmCECTI.FCertificado.LlavePrivada.Clave := 'CECTI123';
        dmCECTI.FCertificado.RFCAlQuePertenece := 'CEC0403304L5';
        dmCECTI.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
      finally
        dmCECTI.Free;
      end;
    end;
//    9: begin
//      dmJUMAPAM := TdmJUMAPAM.Create(Self);
//      try
//        dmJUMAPAM.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
//        dmJUMAPAM.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
//        dmJUMAPAM.FCertificado.LlavePrivada.Clave := 'DELEGA12';
//        dmJUMAPAM.FCertificado.RFCAlQuePertenece := 'ACO560518KW7';
//        dmJUMAPAM.CrearINI(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar, cDirINI, cDirXML);
//      finally
//        dmJUMAPAM.Free;
//      end;
//    end;

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
    dmCFDI.CrearXMLTimbrar(frmDirectorios.Anio, frmDirectorios.Mes, frmDirectorios.Filtrar,
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
  FDObtenerPDF(frmDirectorios.Mes);
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
  adoqryPDF.Parameters.ParamByName('Mes').Value:= pMes;
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
  ShowMessage('Obtención de PDF terminado');
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
  dmCFDI := TdmCFDI.Create(Self);
  dmCFDI.Bitacora := frmDirectorios.mBitacora;
  case FModulo of
    1: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'DELEGA12';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'DEMO830914QZ0';
      dmCFDI.FDPass:= 'aN%zoEPXw@';

//      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD010_AAA010101AAA.cer';
//      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD010_AAA010101AAA.key';
//      dmCFDI.FCertificado.LlavePrivada.Clave := '12345678a';
//      dmCFDI.FCertificado.RFCAlQuePertenece := 'AAA010101AAA';
//      dmCFDI.PAC := pacFinkok;
//      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
//      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    2: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\cbe830914qz0.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_CBE830914QZ0_20140226_145218.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'DELEGA12';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'CBE830914QZ0';
      dmCFDI.FDPass:= 'sOeU$uBBm7c@';
    end;
    3: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_MORELIA_ICT920525GC6_20140311_115055s.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_ICT920525GC6_20140311_115055.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Icatmi1992';
      dmCFDI.PAC := pacFoliosDigitales;
      dmCFDI.FDUser:= 'ICT920525GC6';
      dmCFDI.FDPass:= 'WNdYitbArcbH7#';
    end;
    4: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_DA_SMR8407159IA_20160711_125940.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_DA_SMR8407159IA_20160711_125940.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'taniabustos2015';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    5: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\ive961202li8.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MORELIA_IVE961202LI8_20160413_093734.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Nimsey76';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    6: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_Matriz_CPE980406816_20170223_165621.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'Pesca6819';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    7: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_CFE0211159J7_00001000000401858885.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_CFE0211159J7_20160331_105213.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'nancyangelicavallejogarcia161114cofeeem050578';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
    end;
    8: begin
      dmCFDI.FCertificado.Ruta := '.\Certificados\CSD_MATRIZ_CEC0403304L5_20170612_182503s.cer';
      dmCFDI.FCertificado.LlavePrivada.Ruta := '.\Certificados\CSD_MATRIZ_CEC0403304L5_20170612_182503.key';
      dmCFDI.FCertificado.LlavePrivada.Clave := 'CECTI123';
      dmCFDI.PAC := pacFinkok;
      dmCFDI.FDUser:= 'bps.finkok@gmail.com';
      dmCFDI.FDPass:= 'BPS@sociados1';
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

procedure TdmDirectorios.FDObtenerPDF(pMes: Integer);
var
  vCount: Integer;
  vCountTotal: Integer;
  vFilePDF: string;
begin
  vCount := 0;
  adoqryPDFCount.Close;
  adoqryPDFCount.Parameters.ParamByName('Mes').Value:= pMes;
  adoqryPDFCount.Open;
  vCountTotal:= adoqryPDFCountCUENTA.Value;
  adoqryPDFCount.Close;

  adoqryPDF.Close;
  adoqryPDF.Parameters.ParamByName('Mes').Value:= pMes;
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
  ShowMessage('Obtención de PDF terminado');
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

