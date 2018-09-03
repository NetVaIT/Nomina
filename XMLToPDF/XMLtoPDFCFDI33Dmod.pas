unit XMLtoPDFCFDI33Dmod;

interface

uses
  System.SysUtils, System.Classes, ppComm, ppRelatv, ppDB, ppDBPipe, Data.DB,
  Datasnap.DBClient, Xml.xmldom, Xmlxform, Datasnap.Provider;

const
  cCBB33  = 'https://verificacfdi.facturaelectronica.sat.gob.mx/default.aspx?id=%s&re=%s&rr=%s&tt=%s&fe=%s';
  cXTR33 = 'cfdv33_TFD11.xtr';

type
  TdmXMLtoPDFCFDI33 = class(TDataModule)
    cdsCFDI33: TClientDataSet;
    dsCFDI33: TDataSource;
    dbpCFDI33: TppDBPipeline;
    XMLtCFDI: TXMLTransform;
    XMLtpCFDI: TXMLTransformProvider;
    cdsTFD11: TClientDataSet;
    dsTFD11: TDataSource;
    dbpTFD11: TppDBPipeline;
    cdsCFDI33Relacionados: TClientDataSet;
    dsCFDI33Relacionados: TDataSource;
    dbpCFDI33Relacionados: TppDBPipeline;
    cdsCFDI33Conceptos: TClientDataSet;
    dsCFDI33Conceptos: TDataSource;
    dbpCFDI33Conceptos: TppDBPipeline;
    cdsCFDI33Retenciones: TClientDataSet;
    dsCFDI33Retenciones: TDataSource;
    dbpCFDI33Retenciones: TppDBPipeline;
    cdsCFDI33Traslados: TClientDataSet;
    dsCFDI33Traslados: TDataSource;
    dbpCFDI33Traslados: TppDBPipeline;
    cdsCFDI33Version: TStringField;
    cdsCFDI33Serie: TStringField;
    cdsCFDI33Folio: TStringField;
    cdsCFDI33Fecha: TStringField;
    cdsCFDI33Sello: TStringField;
    cdsCFDI33FormaPago: TStringField;
    cdsCFDI33NoCertificado: TStringField;
    cdsCFDI33Certificado: TStringField;
    cdsCFDI33CondicionesDePago: TStringField;
    cdsCFDI33SubTotal: TBCDField;
    cdsCFDI33Descuento: TBCDField;
    cdsCFDI33Moneda: TStringField;
    cdsCFDI33TipoCambio: TBCDField;
    cdsCFDI33Total: TBCDField;
    cdsCFDI33TipoDeComprobante: TStringField;
    cdsCFDI33MetodoPago: TStringField;
    cdsCFDI33LugarExpedicion: TStringField;
    cdsCFDI33Confirmacion: TStringField;
    cdsCFDI33TipoRelacion: TStringField;
    cdsCFDI33Emisor_Rfc: TStringField;
    cdsCFDI33Emisor_Nombre: TStringField;
    cdsCFDI33RegimenFiscal: TStringField;
    cdsCFDI33Receptor_Rfc: TStringField;
    cdsCFDI33Receptor_Nombre: TStringField;
    cdsCFDI33ResidenciaFiscal: TStringField;
    cdsCFDI33NumRegIdTrib: TStringField;
    cdsCFDI33UsoCFDI: TStringField;
    cdsCFDI33CfdiRelacionado: TDataSetField;
    cdsCFDI33Concepto: TDataSetField;
    cdsCFDI33Traslado: TDataSetField;
    cdsCFDI33Retencion: TDataSetField;
    cdsCFDI33RelacionadosUUID: TStringField;
    cdsCFDI33ConceptosClaveProdServ: TStringField;
    cdsCFDI33ConceptosNoIdentificacion: TStringField;
    cdsCFDI33ConceptosCantidad: TBCDField;
    cdsCFDI33ConceptosClaveUnidad: TStringField;
    cdsCFDI33ConceptosUnidad: TStringField;
    cdsCFDI33ConceptosDescripcion: TStringField;
    cdsCFDI33ConceptosValorUnitario: TBCDField;
    cdsCFDI33ConceptosImporte: TBCDField;
    cdsCFDI33ConceptosDescuento: TBCDField;
    cdsCFDI33ConceptosNumero: TStringField;
    cdsCFDI33ConceptosTraslado: TDataSetField;
    cdsCFDI33ConceptosRetencion: TDataSetField;
    cdsCFDI33ConceptosInformacionAduanera: TDataSetField;
    cdsCFDI33ConceptosParte: TDataSetField;
    cdsCFDI33RetencionesBase: TBCDField;
    cdsCFDI33RetencionesImpuesto: TStringField;
    cdsCFDI33RetencionesTipoFactor: TStringField;
    cdsCFDI33RetencionesTasaOCuota: TBCDField;
    cdsCFDI33RetencionesImporte: TBCDField;
    cdsCFDI33TrasladosBase: TBCDField;
    cdsCFDI33TrasladosImpuesto: TStringField;
    cdsCFDI33TrasladosTipoFactor: TStringField;
    cdsCFDI33TrasladosTasaOCuota: TBCDField;
    cdsCFDI33TrasladosImporte: TBCDField;
    cdsCFDI33Complemento: TDataSetField;
    cdsTFD11Version: TStringField;
    cdsTFD11UUID: TStringField;
    cdsTFD11FechaTimbrado: TStringField;
    cdsTFD11RfcProvCertif: TStringField;
    cdsTFD11Leyenda: TStringField;
    cdsTFD11SelloCFD: TStringField;
    cdsTFD11NoCertificadoSAT: TStringField;
    cdsTFD11SelloSAT: TStringField;
    cdsCFDI33ImporteConLetra: TStringField;
    cdsCFDI33CadenaOriginal: TStringField;
    cdsCFDI33CadenaOriginalTimbre: TStringField;
    cdsCFDI33CCB: TStringField;
    procedure cdsCFDI33CalcFields(DataSet: TDataSet);
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

{ TdmXMLtoPDFCFDI33 }

procedure TdmXMLtoPDFCFDI33.cdsCFDI33CalcFields(DataSet: TDataSet);
var
  vTotal: Double;
  Centavos : String;
  Sello8: string;
begin
  vTotal:= StrToFloat(FormatFloat('0.00',cdsCFDI33total.Value));
//  cdsXMLImporteConLetra.AsString:= NumToLetter(vTotal, nlcPesos);
  Centavos := FormatFloat('.00',Frac(vTotal));
  Delete(Centavos,1,1);
  cdsCFDI33ImporteConLetra.AsString := xIntToLletras(Trunc(vTotal)) + ' PESOS ' + Centavos + '/100 M. N. ';
  { TODO -oJHC : Se agrega un TRY porque con la factura ZIN332 mando un AV sin razon, habra que cambiar esto. }
  try
  cdsCFDI33CadenaOriginal.AsString:= CadenaOriginal;
  except on E: Exception do
  end;
  try
  cdsCFDI33CadenaOriginalTimbre.AsString:= CadenaOriginalTimbre;
  except on E: Exception do
  end;
  Sello8 := Copy(cdsCFDI33Sello.AsString, Length(cdsCFDI33Sello.AsString)-7, Length(cdsCFDI33Sello.AsString));
  cdsCFDI33CCB.AsString:= Format(cCBB33, [cdsTFD11UUID.AsString, cdsCFDI33Emisor_rfc.AsString, cdsCFDI33Receptor_rfc.AsString, cdsCFDI33total.AsString, Sello8]);
end;

procedure TdmXMLtoPDFCFDI33.DataModuleCreate(Sender: TObject);
begin
  XMLtCFDI.TransformationFile := cXTRDir + cXTR33;
end;

procedure TdmXMLtoPDFCFDI33.SetXMLDataFile(const Value: TFileName);
begin
  FXMLDataFile := Value;
  XMLtCFDI.SourceXMLFile:= Value;
  cdsCFDI33.XMLData := XMLtCFDI.Data;
end;

end.
