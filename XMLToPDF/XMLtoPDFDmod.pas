unit XMLtoPDFDmod;

interface

uses
  SysUtils, Classes, xmldom, DB, DBClient, Xmlxform, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, Provider, ppBands, ppCache, ppEndUsr,
  ppMemo, ppStrtch, ppVar, ppCtrls, jpeg, ppPrnabl, ppParameter, ppModule,
  raCodMod, ppSubRpt, ADODB, Dialogs, Forms, ppDesignLayer, MidasLib,
  ppBarCode2D;

const
  fePDF = '.PDF';
  fePNG = '.PNG';
  cCBB  = '?re=%s&rr=%s&tt=%s&id=%s';

type
  TNLCurrency = (nlcPesos, nlcDolares);

  TdmodXMLtoPDF = class(TDataModule)
    XMLTransform: TXMLTransform;
    cdsCFDI: TClientDataSet;
    XMLTransformProvider: TXMLTransformProvider;
    ppReport: TppReport;
    ppDBPipelineDatosFactura: TppDBPipeline;
    dsCFDI: TDataSource;
    ppDBPipelineDatosDetalleFactura: TppDBPipeline;
    dsConcepto: TDataSource;
    ppDBPipelineDatosRetencion: TppDBPipeline;
    dsRetencion: TDataSource;
    ppDBPipelineDatosTraslado: TppDBPipeline;
    dsTraslado: TDataSource;
    ppDesigner: TppDesigner;
    cdsCFDIImporteConLetra: TStringField;
    cdsCFDICadenaOriginal: TStringField;
    adosp_GetTipoDocumento: TADOStoredProc;
    cdsConcepto: TClientDataSet;
    dsInfoAduanera: TDataSource;
    ppDBPipelineInfoAduanera: TppDBPipeline;
    cdsRetencion: TClientDataSet;
    cdsTraslado: TClientDataSet;
    cdsInfoAduanera: TClientDataSet;
    OpenDialogXML: TOpenDialog;
    cdsRegimenFiscal: TClientDataSet;
    dsRegimenFiscal: TDataSource;
    ppDBPipelineRegimenFiscal: TppDBPipeline;
    cdsConceptocantidad: TBCDField;
    cdsConceptounidad: TStringField;
    cdsConceptonoIdentificacion: TStringField;
    cdsConceptodescripcion: TStringField;
    cdsConceptovalorUnitario: TBCDField;
    cdsConceptoimporte: TBCDField;
    cdsConceptonumero: TStringField;
    cdsConceptoInformacionAduanera: TDataSetField;
    cdsConceptoParte: TDataSetField;
    cdsRetencionimpuesto: TStringField;
    cdsRetencionimporte: TBCDField;
    cdsTrasladoimpuesto: TStringField;
    cdsTrasladotasa: TBCDField;
    cdsTrasladoimporte: TBCDField;
    cdsInfoAduaneranumero: TStringField;
    cdsInfoAduanerafecha: TDateField;
    cdsInfoAduaneraaduana: TStringField;
    cdsRegimenFiscalRegimen: TStringField;
    cdsCFDICadenaOriginalTimbre: TStringField;
    cdsN11Percepcion: TClientDataSet;
    cdsN11Deduccion: TClientDataSet;
    dsN11Percepcion: TDataSource;
    dsN11Deduccion: TDataSource;
    cdsN11PercepcionTipoPercepcion: TIntegerField;
    cdsN11PercepcionClave: TStringField;
    cdsN11PercepcionConcepto: TStringField;
    cdsN11PercepcionImporteGravado: TBCDField;
    cdsN11PercepcionImporteExento: TBCDField;
    cdsN11DeduccionTipoDeduccion: TIntegerField;
    cdsN11DeduccionClave: TStringField;
    cdsN11DeduccionConcepto: TStringField;
    cdsN11DeduccionImporteGravado: TBCDField;
    cdsN11DeduccionImporteExento: TBCDField;
    ppdbpN11Percepcion: TppDBPipeline;
    ppdbpN11Deduccion: TppDBPipeline;
    cdsN11Incapacidad: TClientDataSet;
    dsN11Incapacidad: TDataSource;
    ppdbpN11Incapacidad: TppDBPipeline;
    cdsN11HorasExtra: TClientDataSet;
    dsN11HorasExtra: TDataSource;
    ppdbpN11HorasExtra: TppDBPipeline;
    cdsN11IncapacidadDiasIncapacidad: TBCDField;
    cdsN11IncapacidadTipoIncapacidad: TIntegerField;
    cdsN11IncapacidadDescuento: TBCDField;
    cdsN11HorasExtraDias: TIntegerField;
    cdsN11HorasExtraTipoHoras: TStringField;
    cdsN11HorasExtraHorasExtra: TIntegerField;
    cdsN11HorasExtraImportePagado: TBCDField;
    cdsCFDICCB: TStringField;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cdsCFDIversion1: TStringField;
    cdsCFDIserie: TStringField;
    cdsCFDIfolio: TStringField;
    cdsCFDIfecha: TStringField;
    cdsCFDIsello: TStringField;
    cdsCFDIformaDePago: TStringField;
    cdsCFDInoCertificado: TStringField;
    cdsCFDIcertificado: TStringField;
    cdsCFDIcondicionesDePago: TStringField;
    cdsCFDIsubTotal: TBCDField;
    cdsCFDIdescuento: TBCDField;
    cdsCFDImotivoDescuento: TStringField;
    cdsCFDITipoCambio: TStringField;
    cdsCFDIMoneda: TStringField;
    cdsCFDItotal: TBCDField;
    cdsCFDItipoDeComprobante: TStringField;
    cdsCFDImetodoDePago: TStringField;
    cdsCFDILugarExpedicion: TStringField;
    cdsCFDINumCtaPago: TStringField;
    cdsCFDIFolioFiscalOrig: TStringField;
    cdsCFDISerieFolioFiscalOrig: TStringField;
    cdsCFDIFechaFolioFiscalOrig: TStringField;
    cdsCFDIMontoFolioFiscalOrig: TBCDField;
    cdsCFDIEmisor_rfc: TStringField;
    cdsCFDIEmisor_nombre: TStringField;
    cdsCFDIDomicilioFiscal_calle: TStringField;
    cdsCFDIDomicilioFiscal_noExterior: TStringField;
    cdsCFDIDomicilioFiscal_noInterior: TStringField;
    cdsCFDIDomicilioFiscal_colonia: TStringField;
    cdsCFDIDomicilioFiscal_localidad: TStringField;
    cdsCFDIDomicilioFiscal_referencia: TStringField;
    cdsCFDIDomicilioFiscal_municipio: TStringField;
    cdsCFDIDomicilioFiscal_estado: TStringField;
    cdsCFDIDomicilioFiscal_pais: TStringField;
    cdsCFDIDomicilioFiscal_codigoPostal: TStringField;
    cdsCFDIExpedidoEn_calle: TStringField;
    cdsCFDIExpedidoEn_noExterior: TStringField;
    cdsCFDIExpedidoEn_noInterior: TStringField;
    cdsCFDIExpedidoEn_colonia: TStringField;
    cdsCFDIExpedidoEn_localidad: TStringField;
    cdsCFDIExpedidoEn_referencia: TStringField;
    cdsCFDIExpedidoEn_municipio: TStringField;
    cdsCFDIExpedidoEn_estado: TStringField;
    cdsCFDIExpedidoEn_pais: TStringField;
    cdsCFDIExpedidoEn_codigoPostal: TStringField;
    cdsCFDIReceptor_rfc: TStringField;
    cdsCFDIReceptor_nombre: TStringField;
    cdsCFDIDomicilio_calle: TStringField;
    cdsCFDIDomicilio_noExterior: TStringField;
    cdsCFDIDomicilio_noInterior: TStringField;
    cdsCFDIDomicilio_colonia: TStringField;
    cdsCFDIDomicilio_localidad: TStringField;
    cdsCFDIDomicilio_referencia: TStringField;
    cdsCFDIDomicilio_municipio: TStringField;
    cdsCFDIDomicilio_estado: TStringField;
    cdsCFDIDomicilio_pais: TStringField;
    cdsCFDIDomicilio_codigoPostal: TStringField;
    cdsCFDItotalImpuestosRetenidos: TBCDField;
    cdsCFDItotalImpuestosTrasladados: TBCDField;
    cdsCFDIversion2: TStringField;
    cdsCFDIUUID: TStringField;
    cdsCFDIFechaTimbrado: TStringField;
    cdsCFDIselloCFD: TStringField;
    cdsCFDInoCertificadoSAT: TStringField;
    cdsCFDIselloSAT: TStringField;
    cdsCFDIVersion: TStringField;
    cdsCFDIRegistroPatronal: TStringField;
    cdsCFDINumEmpleado: TStringField;
    cdsCFDICURP: TStringField;
    cdsCFDITipoRegimen: TIntegerField;
    cdsCFDINumSeguridadSocial: TStringField;
    cdsCFDIFechaPago: TDateField;
    cdsCFDIFechaInicialPago: TDateField;
    cdsCFDIFechaFinalPago: TDateField;
    cdsCFDINumDiasPagados: TBCDField;
    cdsCFDIDepartamento: TStringField;
    cdsCFDICLABE: TIntegerField;
    cdsCFDIBanco: TIntegerField;
    cdsCFDIFechaInicioRelLaboral: TDateField;
    cdsCFDIAntiguedad: TIntegerField;
    cdsCFDIPuesto: TStringField;
    cdsCFDITipoContrato: TStringField;
    cdsCFDITipoJornada: TStringField;
    cdsCFDIPeriodicidadPago: TStringField;
    cdsCFDISalarioBaseCotApor: TBCDField;
    cdsCFDIRiesgoPuesto: TIntegerField;
    cdsCFDISalarioDiarioIntegrado: TBCDField;
    cdsCFDIPercepciones_TotalGravado: TBCDField;
    cdsCFDIPercepciones_TotalExento: TBCDField;
    cdsCFDIDeducciones_TotalGravado: TBCDField;
    cdsCFDIDeducciones_TotalExento: TBCDField;
    cdsCFDIRegimenFiscal: TDataSetField;
    cdsCFDIConcepto: TDataSetField;
    cdsCFDIRetencion: TDataSetField;
    cdsCFDITraslado: TDataSetField;
    cdsCFDIPercepcion: TDataSetField;
    cdsCFDIDeduccion: TDataSetField;
    cdsCFDIIncapacidad: TDataSetField;
    cdsCFDIHorasExtra: TDataSetField;
    procedure cdsCFDICalcFields(DataSet: TDataSet);
    procedure ppReportFileDeviceCreate(Sender: TObject);
    procedure ppImageCBBPrint(Sender: TObject);
  private
    { Private declarations }
    FFileXTR: string;
    FFileRTM: string;
    FCadenaOriginal: string;
    FFileIMG: string;
    FCadenaOriginalTimbre: string;
    procedure SetFileRTM(const Value: string);
    procedure SetFileXTR(const Value: string);
    procedure SetFileIMG(const Value: string);
  public
    { Public declarations }
    procedure GeneratePDFFile(pFileNameXML, pFileNamePDF: TFileName); overload;
    function GeneratePDFFile(pXMLFileName: TFileName): TFileName; overload;
    procedure PrintPDFFile(pXMLFileName: TFileName);
    procedure ModifyDocument;
    property FileRTM: string read FFileRTM write SetFileRTM;
    property FileXTR: string read FFileXTR write SetFileXTR;
    property FileIMG: string read FFileIMG write SetFileIMG;
    property CadenaOriginal: string read FCadenaOriginal write FCadenaOriginal;
    property CadenaOriginalTimbre: string read FCadenaOriginalTimbre write FCadenaOriginalTimbre;
  end;

implementation

uses _Utils;

{$R *.dfm}

//function NumToLetter(Value: Double; pCurrency: TNLCurrency): String;
//begin
//  Result:= '';
//end;
//
//function GetCadenaOriginal22(pXMLFileName: string): string;
//begin
//  Result:= '';
//end;

{ TdmodXMLtoPDF }

procedure TdmodXMLtoPDF.cdsCFDICalcFields(DataSet: TDataSet);
var
  vTotal: Double;
  Centavos : String;
begin
  vTotal:= StrToFloat(FormatFloat('0.00',cdsCFDItotal.Value));
//  cdsXMLImporteConLetra.AsString:= NumToLetter(vTotal, nlcPesos);
  Centavos := FormatFloat('.00',Frac(vTotal));
  Delete(Centavos,1,1);
  cdsCFDIImporteConLetra.AsString := xIntToLletras(Trunc(vTotal)) + ' PESOS ' + Centavos + '/100 M. N. ';
  { TODO -oJHC : Se agrega un TRY porque con la factura ZIN332 mando un AV sin razon, habra que cambiar esto. }
  try
  cdsCFDICadenaOriginal.AsString:= CadenaOriginal;
  except on E: Exception do
  end;
  try
  cdsCFDICadenaOriginalTimbre.AsString:= CadenaOriginalTimbre;
  except on E: Exception do
  end;
  cdsCFDICCB.AsString:= Format(cCBB, [cdsCFDIEmisor_rfc.AsString, cdsCFDIReceptor_rfc.AsString, cdsCFDItotal.AsString, cdsCFDIUUID.AsString]);
end;

function TdmodXMLtoPDF.GeneratePDFFile(pXMLFileName: TFileName): TFileName;
begin
  Result:= ChangeFileExt(pXMLFileName, fePDF);
  GeneratePDFFile(pXMLFileName, Result);
end;

procedure TdmodXMLtoPDF.GeneratePDFFile(pFileNameXML, pFileNamePDF: TFileName);
begin
  if FileExists(pFileNameXML) then
  begin
    //Configura el XML
    XMLTransform.SourceXMLFile:= pFileNameXML;
    cdsCFDI.XMLData:= XMLTransform.Data;
    // Configura el reporte
    ppReport.ShowPrintDialog := False;
    ppReport.ShowCancelDialog := False;
    ppReport.DeviceType:= 'PDF';
    ppReport.PDFSettings.OpenPDFFile := False;
    ppReport.TextFileName:= pFileNamePDF;
    ppReport.Print;
  end
//  else
//    raise Exception.Create(smNotExistFile);
end;

procedure TdmodXMLtoPDF.ModifyDocument;
var
  vXMLFileName: TFileName;
begin
  if OpenDialogXML.Execute then
  begin
    //Configura el XML
    vXMLFileName:= OpenDialogXML.FileName;
//    FCadenaOriginal:= GetCadenaOriginal22(vXMLFileName);
    XMLTransform.SourceXMLFile:= vXMLFileName;
    cdsCFDI.XMLData:= XMLTransform.Data;
    // Configura el reporte
//    ppReport.Parameters['RAP'].Value := True;
    ppDesigner.Menu.Items[4].Visible := False;
    ppDesigner.ShowModal;
  end;
end;

procedure TdmodXMLtoPDF.ppImageCBBPrint(Sender: TObject);
begin
//  ppImageCBB.Picture.LoadFromFile(FileIMG);
end;

procedure TdmodXMLtoPDF.ppReportFileDeviceCreate(Sender: TObject);
begin
//  If ppReport.FindComponent('') then
//    ppImageCBB.OnPrint:= ppImageCBBPrint
end;

procedure TdmodXMLtoPDF.PrintPDFFile(pXMLFileName: TFileName);
var
  vPDFFileName: TFileName;
begin
  if FileExists(pXMLFileName) then
  begin
    //Configura el XML
    vPDFFileName:= ChangeFileExt(pXMLFileName, fePDF);
//    FCadenaOriginal:= GetCadenaOriginal22(pXMLFileName);
    XMLTransform.SourceXMLFile:= pXMLFileName;
    cdsCFDI.XMLData:= XMLTransform.Data;
    // Configura el reporte
    ppReport.ShowPrintDialog:= False;
    ppReport.ShowCancelDialog:= False;
    ppReport.AllowPrintToArchive:= False;
    ppReport.DeviceType:= 'printer';
//    ppReport.PrinterSetup.Copies:= 1;
    ppReport.PrinterSetup.DocumentName:= ExtractFileName(vPDFFileName);
    ppReport.Print;
  end
//  else
//    raise Exception.Create(smNotExistFile);
end;

procedure TdmodXMLtoPDF.SetFileIMG(const Value: string);
begin
  FFileIMG := Value;
end;

procedure TdmodXMLtoPDF.SetFileRTM(const Value: string);
begin
  FFileRTM := Value;
  ppReport.Template.FileName := Value;
  ppReport.Template.LoadFromFile;
end;

procedure TdmodXMLtoPDF.SetFileXTR(const Value: string);
begin
  FFileXTR := Value;
  XMLTransform.TransformationFile := Value;
end;

end.
