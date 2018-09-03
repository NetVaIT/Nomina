unit XMLtoPDFCFDI32Dmod;

interface

uses
  System.SysUtils, System.Classes, Xml.xmldom, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Xmlxform;

const
  cCBB32 = '?re=%s&rr=%s&tt=%s&id=%s';
  cXTR32 = 'cfdv32_TFD10.xtr';

type
  TdmXMLtoPDFCFDI32 = class(TDataModule)
    XMLtCFDI: TXMLTransform;
    XMLtpCFDI: TXMLTransformProvider;
    cdsCFDI32: TClientDataSet;
    dsCFDI32: TDataSource;
    dbpCFDI32: TppDBPipeline;
    cdsCFDI32Conceptos: TClientDataSet;
    dsCFDI32Conceptos: TDataSource;
    dbpCFDI32Conceptos: TppDBPipeline;
    cdsCFDI32Retenciones: TClientDataSet;
    dsCFDI32Retenciones: TDataSource;
    dbpCFDI32Retenciones: TppDBPipeline;
    cdsCFDI32Traslados: TClientDataSet;
    dsCFDI32Traslados: TDataSource;
    dbpCFDI32Traslados: TppDBPipeline;
    cdsCFDI32InfoAduanera: TClientDataSet;
    dsCFDI32InfoAduanera: TDataSource;
    dbpCFDI32InfoAduanera: TppDBPipeline;
    cdsCFDI32Parte: TClientDataSet;
    dsCFDI32Parte: TDataSource;
    dbpCFDI32Parte: TppDBPipeline;
    cdsCFDI32version1: TStringField;
    cdsCFDI32serie: TStringField;
    cdsCFDI32folio: TStringField;
    cdsCFDI32fecha: TDateField;
    cdsCFDI32sello: TStringField;
    cdsCFDI32formaDePago: TStringField;
    cdsCFDI32noCertificado: TStringField;
    cdsCFDI32certificado: TStringField;
    cdsCFDI32condicionesDePago: TStringField;
    cdsCFDI32subTotal: TBCDField;
    cdsCFDI32descuento: TBCDField;
    cdsCFDI32motivoDescuento: TStringField;
    cdsCFDI32TipoCambio: TStringField;
    cdsCFDI32Moneda: TStringField;
    cdsCFDI32total: TBCDField;
    cdsCFDI32tipoDeComprobante: TStringField;
    cdsCFDI32metodoDePago: TStringField;
    cdsCFDI32LugarExpedicion: TStringField;
    cdsCFDI32NumCtaPago: TStringField;
    cdsCFDI32FolioFiscalOrig: TStringField;
    cdsCFDI32SerieFolioFiscalOrig: TStringField;
    cdsCFDI32FechaFolioFiscalOrig: TStringField;
    cdsCFDI32MontoFolioFiscalOrig: TBCDField;
    cdsCFDI32Emisor_rfc: TStringField;
    cdsCFDI32Emisor_nombre: TStringField;
    cdsCFDI32DomicilioFiscal_calle: TStringField;
    cdsCFDI32DomicilioFiscal_noExterior: TStringField;
    cdsCFDI32DomicilioFiscal_noInterior: TStringField;
    cdsCFDI32DomicilioFiscal_colonia: TStringField;
    cdsCFDI32DomicilioFiscal_localidad: TStringField;
    cdsCFDI32DomicilioFiscal_referencia: TStringField;
    cdsCFDI32DomicilioFiscal_municipio: TStringField;
    cdsCFDI32DomicilioFiscal_estado: TStringField;
    cdsCFDI32DomicilioFiscal_pais: TStringField;
    cdsCFDI32DomicilioFiscal_codigoPostal: TStringField;
    cdsCFDI32ExpedidoEn_calle: TStringField;
    cdsCFDI32ExpedidoEn_noExterior: TStringField;
    cdsCFDI32ExpedidoEn_noInterior: TStringField;
    cdsCFDI32ExpedidoEn_colonia: TStringField;
    cdsCFDI32ExpedidoEn_localidad: TStringField;
    cdsCFDI32ExpedidoEn_referencia: TStringField;
    cdsCFDI32ExpedidoEn_municipio: TStringField;
    cdsCFDI32ExpedidoEn_estado: TStringField;
    cdsCFDI32ExpedidoEn_pais: TStringField;
    cdsCFDI32ExpedidoEn_codigoPostal: TStringField;
    cdsCFDI32Receptor_rfc: TStringField;
    cdsCFDI32Receptor_nombre: TStringField;
    cdsCFDI32Domicilio_calle: TStringField;
    cdsCFDI32Domicilio_noExterior: TStringField;
    cdsCFDI32Domicilio_noInterior: TStringField;
    cdsCFDI32Domicilio_colonia: TStringField;
    cdsCFDI32Domicilio_localidad: TStringField;
    cdsCFDI32Domicilio_referencia: TStringField;
    cdsCFDI32Domicilio_municipio: TStringField;
    cdsCFDI32Domicilio_estado: TStringField;
    cdsCFDI32Domicilio_pais: TStringField;
    cdsCFDI32Domicilio_codigoPostal: TStringField;
    cdsCFDI32totalImpuestosRetenidos: TBCDField;
    cdsCFDI32totalImpuestosTrasladados: TBCDField;
    cdsCFDI32version2: TStringField;
    cdsCFDI32UUID: TStringField;
    cdsCFDI32FechaTimbrado: TStringField;
    cdsCFDI32selloCFD: TStringField;
    cdsCFDI32noCertificadoSAT: TStringField;
    cdsCFDI32selloSAT: TStringField;
    cdsCFDI32RegimenFiscal: TDataSetField;
    cdsCFDI32Concepto: TDataSetField;
    cdsCFDI32Retencion: TDataSetField;
    cdsCFDI32Traslado: TDataSetField;
    cdsCFDI32Conceptoscantidad: TBCDField;
    cdsCFDI32Conceptosunidad: TStringField;
    cdsCFDI32ConceptosnoIdentificacion: TStringField;
    cdsCFDI32Conceptosdescripcion: TStringField;
    cdsCFDI32ConceptosvalorUnitario: TBCDField;
    cdsCFDI32Conceptosimporte: TBCDField;
    cdsCFDI32Conceptosnumero: TStringField;
    cdsCFDI32ConceptosInformacionAduanera: TDataSetField;
    cdsCFDI32ConceptosParte: TDataSetField;
    cdsCFDI32Retencionesimpuesto: TStringField;
    cdsCFDI32Retencionesimporte: TBCDField;
    cdsCFDI32Trasladosimpuesto: TStringField;
    cdsCFDI32Trasladostasa: TBCDField;
    cdsCFDI32Trasladosimporte: TBCDField;
    cdsCFDI32InfoAduaneranumero: TStringField;
    cdsCFDI32InfoAduanerafecha: TDateField;
    cdsCFDI32InfoAduaneraaduana: TStringField;
    cdsCFDI32ImporteConLetra: TStringField;
    cdsCFDI32CadenaOriginal: TStringField;
    cdsCFDI32CadenaOriginalTimbre: TStringField;
    cdsCFDI32CCB: TStringField;
    procedure cdsCFDI32CalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FXMLDataFile: TFileName;
    FCadenaOriginalTimbre: string;
    FCadenaOriginal: string;
    procedure SetXMLDataFile(const Value: TFileName);
  public
    { Public declarations }
    property XMLDataFile: TFileName read FXMLDataFile write SetXMLDataFile;
    property CadenaOriginal: string read FCadenaOriginal write FCadenaOriginal;
    property CadenaOriginalTimbre: string read FCadenaOriginalTimbre write FCadenaOriginalTimbre;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils, XMLtoPDFDmod;

{$R *.dfm}

{ TdmXMLtoPDFCFDI32 }

procedure TdmXMLtoPDFCFDI32.cdsCFDI32CalcFields(DataSet: TDataSet);
var
  vTotal: Double;
  Centavos : String;
begin
  vTotal:= StrToFloat(FormatFloat('0.00',cdsCFDI32total.Value));
//  cdsXMLImporteConLetra.AsString:= NumToLetter(vTotal, nlcPesos);
  Centavos := FormatFloat('.00',Frac(vTotal));
  Delete(Centavos,1,1);
  cdsCFDI32ImporteConLetra.AsString := xIntToLletras(Trunc(vTotal)) + ' PESOS ' + Centavos + '/100 M. N. ';
  { TODO -oJHC : Se agrega un TRY porque con la factura ZIN332 mando un AV sin razon, habra que cambiar esto. }
  try
  cdsCFDI32CadenaOriginal.AsString:= CadenaOriginal;
  except on E: Exception do
  end;
  try
  cdsCFDI32CadenaOriginalTimbre.AsString:= CadenaOriginalTimbre;
  except on E: Exception do
  end;
  cdsCFDI32CCB.AsString:= Format(cCBB32, [cdsCFDI32Emisor_rfc.AsString, cdsCFDI32Receptor_rfc.AsString, cdsCFDI32total.AsString, cdsCFDI32UUID.AsString]);
end;

procedure TdmXMLtoPDFCFDI32.DataModuleCreate(Sender: TObject);
begin
  XMLtCFDI.TransformationFile := cXTRDir + cXTR32;
end;

procedure TdmXMLtoPDFCFDI32.SetXMLDataFile(const Value: TFileName);
begin
  FXMLDataFile := Value;
  XMLtCFDI.SourceXMLFile:= Value;
  cdsCFDI32.XMLData := XMLtCFDI.Data;
end;

end.
