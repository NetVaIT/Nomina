unit XMLtoPDFNominaDmod;

interface

uses
  System.SysUtils, System.Classes, Xml.xmldom, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Xmlxform;

const
  cXTRN11 = 'cfdv32_N11.xtr';
  cXTRN12 = 'cfdv33_N12.xtr';

type
  TdmXMLtoPDFNomina = class(TDataModule)
    XMLtN11: TXMLTransform;
    XMLtpN11: TXMLTransformProvider;
    cdsN11: TClientDataSet;
    dsN11: TDataSource;
    dbpN11: TppDBPipeline;
    cdsN12: TClientDataSet;
    dsN12: TDataSource;
    dbpN12: TppDBPipeline;
    cdsN11Version: TStringField;
    cdsN11RegistroPatronal: TStringField;
    cdsN11NumEmpleado: TStringField;
    cdsN11CURP: TStringField;
    cdsN11TipoRegimen: TIntegerField;
    cdsN11NumSeguridadSocial: TStringField;
    cdsN11FechaPago: TDateField;
    cdsN11FechaInicialPago: TDateField;
    cdsN11FechaFinalPago: TDateField;
    cdsN11NumDiasPagados: TBCDField;
    cdsN11Departamento: TStringField;
    cdsN11CLABE: TIntegerField;
    cdsN11Banco: TIntegerField;
    cdsN11FechaInicioRelLaboral: TDateField;
    cdsN11Antiguedad: TIntegerField;
    cdsN11Puesto: TStringField;
    cdsN11TipoContrato: TStringField;
    cdsN11TipoJornada: TStringField;
    cdsN11PeriodicidadPago: TStringField;
    cdsN11SalarioBaseCotApor: TBCDField;
    cdsN11RiesgoPuesto: TIntegerField;
    cdsN11SalarioDiarioIntegrado: TBCDField;
    cdsN11Percepciones_TotalGravado: TBCDField;
    cdsN11Percepciones_TotalExento: TBCDField;
    cdsN11Deducciones_TotalGravado: TBCDField;
    cdsN11Deducciones_TotalExento: TBCDField;
    cdsN11Percepcion: TDataSetField;
    cdsN11Deduccion: TDataSetField;
    cdsN11Incapacidad: TDataSetField;
    cdsN11HorasExtra: TDataSetField;
    cdsN11Percepciones: TClientDataSet;
    dsN11Percepciones: TDataSource;
    dbpN11Percepciones: TppDBPipeline;
    cdsN11Deducciones: TClientDataSet;
    dsN11Deducciones: TDataSource;
    dbpN11Deducciones: TppDBPipeline;
    cdsN11Incapacidades: TClientDataSet;
    dsN11Incapacidades: TDataSource;
    dbpN11Incapacidades: TppDBPipeline;
    cdsN11HorasExtras: TClientDataSet;
    dsN11HorasExtras: TDataSource;
    dbpN11HorasExtras: TppDBPipeline;
    cdsN11PercepcionesTipoPercepcion: TIntegerField;
    cdsN11PercepcionesClave: TStringField;
    cdsN11PercepcionesConcepto: TStringField;
    cdsN11PercepcionesImporteGravado: TBCDField;
    cdsN11PercepcionesImporteExento: TBCDField;
    cdsN11DeduccionesTipoDeduccion: TIntegerField;
    cdsN11DeduccionesClave: TStringField;
    cdsN11DeduccionesConcepto: TStringField;
    cdsN11DeduccionesImporteGravado: TBCDField;
    cdsN11DeduccionesImporteExento: TBCDField;
    cdsN11IncapacidadesDiasIncapacidad: TBCDField;
    cdsN11IncapacidadesTipoIncapacidad: TIntegerField;
    cdsN11IncapacidadesDescuento: TBCDField;
    cdsN11HorasExtrasDias: TIntegerField;
    cdsN11HorasExtrasTipoHoras: TStringField;
    cdsN11HorasExtrasHorasExtra: TIntegerField;
    cdsN11HorasExtrasImportePagado: TBCDField;
    cdsN12Percepciones: TClientDataSet;
    dsN12Percepciones: TDataSource;
    dbpN12Percepciones: TppDBPipeline;
    cdsN12Deducciones: TClientDataSet;
    dsN12Deducciones: TDataSource;
    dbpN12Deducciones: TppDBPipeline;
    cdsN12OtroPagos: TClientDataSet;
    dsN12OtroPagos: TDataSource;
    dbpN12OtroPagos: TppDBPipeline;
    cdsN12Incapacidades: TClientDataSet;
    dsN12Incapacidades: TDataSource;
    dbpN12Incapacidades: TppDBPipeline;
    cdsN12SubContrataciones: TClientDataSet;
    dsN12SubContrataciones: TDataSource;
    dbpN12SubContrataciones: TppDBPipeline;
    cdsCFDI: TClientDataSet;
    dsCFDI: TDataSource;
    dppCFDI: TppDBPipeline;
    cdsCFDIVersion: TStringField;
    cdsCFDIComplemento: TDataSetField;
    cdsN12Version: TStringField;
    cdsN12TipoNomina: TStringField;
    cdsN12FechaPago: TDateField;
    cdsN12FechaInicialPago: TDateField;
    cdsN12FechaFinalPago: TDateField;
    cdsN12NumDiasPagados: TBCDField;
    cdsN12TotalPercepciones: TBCDField;
    cdsN12TotalDeducciones: TBCDField;
    cdsN12TotalOtrosPagos: TBCDField;
    cdsN12Emisor_Curp: TStringField;
    cdsN12RegistroPatronal: TStringField;
    cdsN12RfcPatronOrigen: TStringField;
    cdsN12OrigenRecurso: TStringField;
    cdsN12MontoRecursoPropio: TBCDField;
    cdsN12Receptor_Curp: TStringField;
    cdsN12NumSeguridadSocial: TStringField;
    cdsN12FechaInicioRelLaboral: TDateField;
    cdsN12Antigüedad: TStringField;
    cdsN12TipoContrato: TStringField;
    cdsN12Sindicalizado: TStringField;
    cdsN12TipoJornada: TStringField;
    cdsN12TipoRegimen: TStringField;
    cdsN12NumEmpleado: TStringField;
    cdsN12Departamento: TStringField;
    cdsN12Puesto: TStringField;
    cdsN12RiesgoPuesto: TStringField;
    cdsN12PeriodicidadPago: TStringField;
    cdsN12Banco: TStringField;
    cdsN12CuentaBancaria: TIntegerField;
    cdsN12SalarioBaseCotApor: TBCDField;
    cdsN12SalarioDiarioIntegrado: TBCDField;
    cdsN12ClaveEntFed: TStringField;
    cdsN12TotalSueldos: TBCDField;
    cdsN12TotalSeparacionIndemnizacion: TBCDField;
    cdsN12TotalJubilacionPensionRetiro: TBCDField;
    cdsN12TotalGravado: TBCDField;
    cdsN12TotalExento: TBCDField;
    cdsN12TotalUnaExhibicion: TBCDField;
    cdsN12TotalParcialidad: TBCDField;
    cdsN12MontoDiario: TBCDField;
    cdsN12IngresoAcumulable1: TBCDField;
    cdsN12IngresoNoAcumulable1: TBCDField;
    cdsN12TotalPagado: TBCDField;
    cdsN12NumAñosServicio: TIntegerField;
    cdsN12UltimoSueldoMensOrd: TBCDField;
    cdsN12IngresoAcumulable2: TBCDField;
    cdsN12IngresoNoAcumulable2: TBCDField;
    cdsN12TotalOtrasDeducciones: TBCDField;
    cdsN12TotalImpuestosRetenidos: TBCDField;
    cdsN12SubContratacion: TDataSetField;
    cdsN12Percepcion: TDataSetField;
    cdsN12Deduccion: TDataSetField;
    cdsN12OtroPago: TDataSetField;
    cdsN12Incapacidad: TDataSetField;
    XMLtN12: TXMLTransform;
    XMLtpN12: TXMLTransformProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FXMLDataFile: TFileName;
    procedure SetXMLDataFile(const Value: TFileName);
  public
    { Public declarations }
    property XMLDataFile: TFileName read FXMLDataFile write SetXMLDataFile;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses XMLtoPDFDmod;

{$R *.dfm}

{ TdmXMLtoPDFNomina }

procedure TdmXMLtoPDFNomina.DataModuleCreate(Sender: TObject);
begin
  XMLtN11.TransformationFile := cXTRDir + cXTRN11;
  XMLtN12.TransformationFile := cXTRDir + cXTRN12;
end;

procedure TdmXMLtoPDFNomina.SetXMLDataFile(const Value: TFileName);
begin
  FXMLDataFile := Value;
  XMLtN11.SourceXMLFile:= Value;
  cdsN11.XMLData := XMLtN11.Data;
  XMLtN12.SourceXMLFile:= Value;
  cdsCFDI.XMLData := XMLtN12.Data;
end;

end.
