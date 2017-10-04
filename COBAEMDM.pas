unit COBAEMDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  FacturaTipos;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepcion';
  cDeducciones = 'nomDeduccion';
  cOtrosPagos = 'nomOtrosPagos';
//  cFormatFloat = '0.00####';
  cCFDI_ImporteMXN = '0.00';

type
  TdmCOBAEM = class(TDataModule)
    adoqryNomina11: TADOQuery;
    adoqryNomina11ID: TFloatField;
    adoqryNomina11CONOM: TWideStringField;
    adoqryNomina11FormaDePago: TStringField;
    adoqryNomina11SubTotal: TFloatField;
    adoqryNomina11Descuento: TFloatField;
    adoqryNomina11MotivoDescuento: TStringField;
    adoqryNomina11Total: TFloatField;
    adoqryNomina11MetodoDePago: TStringField;
    adoqryNomina11TipoDeComprobante: TStringField;
    adoqryNomina11LugarExpedicion: TStringField;
    adoqryNomina11EmisorRFC: TStringField;
    adoqryNomina11EmisorNombre: TStringField;
    adoqryNomina11EmisorRegimen: TStringField;
    adoqryNomina11ReceptorRFC: TWideStringField;
    adoqryNomina11ReceptorNombre: TWideStringField;
    adoqryNomina11ReceptorPais: TStringField;
    adoqryNomina11ConceptoValorUnitario: TFloatField;
    adoqryNomina11ConceptoImporte: TFloatField;
    adoqryNomina11ImpuestosISRRetenido: TFloatField;
    adoqryNomina11ComplementoNominaRegistroPatronal: TStringField;
    adoqryNomina11ComplementoNominaNumEmpleado: TWideStringField;
    adoqryNomina11ComplementoNominaCURP: TWideStringField;
    adoqryNomina11ComplementoNominaTipoRegimen: TStringField;
    adoqryNomina11ComplementoNominaFechaPago: TDateTimeField;
    adoqryNomina11ComplementoNominaPagoDesde: TDateTimeField;
    adoqryNomina11ComplementoNominaPagoHasta: TDateTimeField;
    adoqryNomina11ComplementoNominaNumDiasPagados: TIntegerField;
    adoqryNomina11PTotalGravado: TFloatField;
    adoqryNomina11PTotalExento: TFloatField;
    adoqryNomina11DTotalGravado: TIntegerField;
    adoqryNomina11DTotalExento: TFloatField;
    adoqryNomina11P02: TFloatField;
    adoqryNomina11P03: TFloatField;
    adoqryNomina11P04: TFloatField;
    adoqryNomina11P05: TFloatField;
    adoqryNomina11P06: TFloatField;
    adoqryNomina11P07: TFloatField;
    adoqryNomina11P08: TFloatField;
    adoqryNomina11P09: TFloatField;
    adoqryNomina11P10: TFloatField;
    adoqryNomina11P11: TFloatField;
    adoqryNomina11P12: TFloatField;
    adoqryNomina11P13: TFloatField;
    adoqryNomina11P14: TFloatField;
    adoqryNomina11P15: TFloatField;
    adoqryNomina11P16: TFloatField;
    adoqryNomina11P17: TFloatField;
    adoqryNomina11P18: TFloatField;
    adoqryNomina11P19: TFloatField;
    adoqryNomina11P20: TFloatField;
    adoqryNomina11P21: TFloatField;
    adoqryNomina11P22: TFloatField;
    adoqryNomina11P23: TFloatField;
    adoqryNomina11P24: TFloatField;
    adoqryNomina11D26: TFloatField;
    adoqryNomina11D27: TFloatField;
    adoqryNomina11D28: TFloatField;
    adoqryNomina11D29: TFloatField;
    adoqryNomina11P30: TFloatField;
    adoqryNomina11D32: TFloatField;
    adoqryNomina11D31: TFloatField;
    adoqryNomina11D33: TFloatField;
    adoqryNomina11D34: TFloatField;
    adoqryNomina11D35: TFloatField;
    adoqryNomina11D36: TFloatField;
    adoqryNomina11D37: TFloatField;
    adoqryNomina11D38: TFloatField;
    adoqryNomina11P40: TFloatField;
    adoqryNomina11P41: TFloatField;
    adoqryNomina11P42: TFloatField;
    adoqryNomina11P43: TFloatField;
    adoqryNomina11P44: TFloatField;
    adoqryNomina11P45: TFloatField;
    adoqryNomina11P46: TFloatField;
    adoqryNomina11P47: TFloatField;
    adoqryNomina11P48: TFloatField;
    adoqryNomina11P49: TFloatField;
    adoqryNomina11P50: TFloatField;
    adoqryNomina11P51: TFloatField;
    adoqryNomina11P52: TFloatField;
    adoqryNomina11P53: TFloatField;
    adoqryNomina11P54: TFloatField;
    adoqryNomina11P55: TFloatField;
    adoqryNomina11P56: TFloatField;
    adoqryNomina11P57: TFloatField;
    adoqryNomina11P58: TFloatField;
    adoqryNomina11P59: TFloatField;
    adoqryNomina11P60: TFloatField;
    adoqryNomina11P61: TFloatField;
    adoqryNomina11P62: TFloatField;
    adoqryNomina11P63: TFloatField;
    adoqryNomina11P64: TFloatField;
    adoqryNomina11P65: TFloatField;
    adoqryNomina11P66: TFloatField;
    adoqryNomina11P67: TFloatField;
    adoqryNomina11P68: TFloatField;
    adoqryNomina11D70: TFloatField;
    adoqryNomina11D71: TFloatField;
    adoqryNomina11D72: TFloatField;
    adoqryNomina11D73: TFloatField;
    adoqryNomina11D74: TFloatField;
    adoqryNomina11D75: TFloatField;
    adoqryNomina11D76: TFloatField;
    adoqryNomina11D77: TFloatField;
    adoqryNomina11D78: TFloatField;
    adoqryNomina11D79: TFloatField;
    adoqryNomina11D80: TFloatField;
    adoqryNomina11D81: TFloatField;
    adoqryNomina11D82: TFloatField;
    adoqryNomina11D83: TFloatField;
    adoqryNomina11D84: TFloatField;
    adoqryNomina11D85: TFloatField;
    adoqryNomina11D86: TFloatField;
    adoqryNomina11D87: TFloatField;
    adoqryNomina11D88: TFloatField;
    adoqryNomina11D89: TFloatField;
    adoqryNomina11D90: TFloatField;
    adoqryNomina11D91: TFloatField;
    adoqryNomina11D92: TFloatField;
    adoqryNomina11D93: TFloatField;
    adoqryNomina11D94: TFloatField;
    adoqryNomina11D95: TFloatField;
    adoqryNomina11D96: TFloatField;
    adoqryNomina11D97: TFloatField;
    adoqryNomina11D98: TFloatField;
    adoqryNomina11D99: TFloatField;
    adoqryNomina11TOTPER: TFloatField;
    adoqryNomina11TOTDED: TFloatField;
    adoqryNomina11TOTLIQ: TFloatField;
    adoqryNomina11PeriodoMes: TIntegerField;
    adoqryNomina11PeriodoAnio: TIntegerField;
    adoqryNomina11ComplementoNominaNumSeguridadSocial: TFloatField;
    adoqryNomina11ComplementoNominaDepartamento: TWideStringField;
    adoqryNomina11ComplementoNominaPuesto: TWideStringField;
    adoqryNomina11ComplementoNominaTipoContrato: TWideStringField;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryNomina11ComplementoNominaFechaInicioRelLaboral: TDateTimeField;
    adoqryNomina11P69: TFloatField;
    adoqryNomina: TADOQuery;
    adoqryNominaID: TFloatField;
    adoqryNominaFormaDePago: TStringField;
    adoqryNominaSubTotal: TFloatField;
    adoqryNominaDescuento: TFloatField;
    adoqryNominaTipoCambio: TIntegerField;
    adoqryNominaMoneda: TStringField;
    adoqryNominaTotal: TFloatField;
    adoqryNominaMetodoDePago: TStringField;
    adoqryNominaTipoDeComprobante: TStringField;
    adoqryNominaLugarExpedicion: TStringField;
    adoqryNominaEmisorRFC: TStringField;
    adoqryNominaEmisorNombre: TStringField;
    adoqryNominaEmisorRegimen: TStringField;
    adoqryNominaReceptorRFC: TWideStringField;
    adoqryNominaReceptorNombre: TWideStringField;
    adoqryNominaConceptoValorUnitario: TFloatField;
    adoqryNominaConceptoImporte: TFloatField;
    adoqryNominaComplementoNominaTipoNomina: TWideStringField;
    adoqryNominaComplementoNominaFechaPago: TDateTimeField;
    adoqryNominaComplementoNominaFechaInicialPago: TDateTimeField;
    adoqryNominaComplementoNominaFechaFinalPago: TDateTimeField;
    adoqryNominaComplementoNominaNumDiasPagados: TFloatField;
    adoqryNominaSubsidioAlEmpleo: TFloatField;
    adoqryNominaComplementoNominaTotalPercepciones: TFloatField;
    adoqryNominaComplementoNominaTotalDeducciones: TFloatField;
    adoqryNominaComplementoNominaTotalOtrosPagos: TFloatField;
    adoqryNominanomEmisorCURP: TStringField;
    adoqryNominanomEmisorRegistroPatronal: TWideStringField;
    adoqryNominanomReceptorCURP: TWideStringField;
    adoqryNominanomReceptorNumSeguridadSocial: TWideStringField;
    adoqryNominanomReceptorFechaInicioRelLaboral: TDateTimeField;
    adoqryNominanomReceptorAntiguedad: TStringField;
    adoqryNominanomReceptorTipoContrato: TWideStringField;
    adoqryNominanomReceptorSindicalizado: TWideStringField;
    adoqryNominanomReceptorTipoJornada: TWideStringField;
    adoqryNominanomReceptorTipoRegimen: TWideStringField;
    adoqryNominanomReceptorNumEmpleado: TWideStringField;
    adoqryNominanomReceptorDepartamento: TWideStringField;
    adoqryNominanomReceptorPuesto: TWideStringField;
    adoqryNominanomReceptorRiesgoPuesto: TStringField;
    adoqryNominanomReceptorPeriodicidadPago: TWideStringField;
    adoqryNominanomReceptorSalarioBaseCotApor: TFloatField;
    adoqryNominanomReceptorSalarioDiarioIntegrado: TFloatField;
    adoqryNominanomReceptorClaveEntFed: TWideStringField;
    adoqryNominanomPercepcionesTotalSueldos: TFloatField;
    adoqryNominanomPercepcionesTotalGravado: TFloatField;
    adoqryNominanomPercepcionesTotalExento: TFloatField;
    adoqryNominanomDeduccionesTotalOtrasDeducciones: TFloatField;
    adoqryNominanomDeduccionesTotalImpuestosRetenidos: TFloatField;
    adoqryNominaP02: TFloatField;
    adoqryNominaP03: TFloatField;
    adoqryNominaP04: TFloatField;
    adoqryNominaP05: TFloatField;
    adoqryNominaP06: TFloatField;
    adoqryNominaP07: TFloatField;
    adoqryNominaP08: TFloatField;
    adoqryNominaP09: TFloatField;
    adoqryNominaP10: TFloatField;
    adoqryNominaP11: TFloatField;
    adoqryNominaP12: TFloatField;
    adoqryNominaP13: TFloatField;
    adoqryNominaP14: TFloatField;
    adoqryNominaP15: TFloatField;
    adoqryNominaP16: TFloatField;
    adoqryNominaP17: TFloatField;
    adoqryNominaP18: TFloatField;
    adoqryNominaP19: TFloatField;
    adoqryNominaP20: TFloatField;
    adoqryNominaP21: TFloatField;
    adoqryNominaP22: TFloatField;
    adoqryNominaP23: TFloatField;
    adoqryNominaP24: TFloatField;
    adoqryNominaP25: TFloatField;
    adoqryNominaD26: TFloatField;
    adoqryNominaD27: TFloatField;
    adoqryNominaD28: TFloatField;
    adoqryNominaD29: TFloatField;
    adoqryNominaP30: TFloatField;
    adoqryNominaD32: TFloatField;
    adoqryNominaD31: TFloatField;
    adoqryNominaD33: TFloatField;
    adoqryNominaD34: TFloatField;
    adoqryNominaD35: TFloatField;
    adoqryNominaD36: TFloatField;
    adoqryNominaD37: TFloatField;
    adoqryNominaD38: TFloatField;
    adoqryNominaP40: TFloatField;
    adoqryNominaP41: TFloatField;
    adoqryNominaP42: TFloatField;
    adoqryNominaP43: TFloatField;
    adoqryNominaP44: TFloatField;
    adoqryNominaP45: TFloatField;
    adoqryNominaP46: TFloatField;
    adoqryNominaP47: TFloatField;
    adoqryNominaP48: TFloatField;
    adoqryNominaP49: TFloatField;
    adoqryNominaP50: TFloatField;
    adoqryNominaP51: TFloatField;
    adoqryNominaP52: TFloatField;
    adoqryNominaP53: TFloatField;
    adoqryNominaP54: TFloatField;
    adoqryNominaP55: TFloatField;
    adoqryNominaP56: TFloatField;
    adoqryNominaP57: TFloatField;
    adoqryNominaP58: TFloatField;
    adoqryNominaP59: TFloatField;
    adoqryNominaP60: TFloatField;
    adoqryNominaP61: TFloatField;
    adoqryNominaP62E: TFloatField;
    adoqryNominaP62G: TFloatField;
    adoqryNominaP63E: TFloatField;
    adoqryNominaP63G: TFloatField;
    adoqryNominaP64: TFloatField;
    adoqryNominaP65: TFloatField;
    adoqryNominaP66: TFloatField;
    adoqryNominaP67: TFloatField;
    adoqryNominaP68: TFloatField;
    adoqryNominaP69: TFloatField;
    adoqryNominaD70: TFloatField;
    adoqryNominaD71: TFloatField;
    adoqryNominaD72: TFloatField;
    adoqryNominaD73: TFloatField;
    adoqryNominaD74: TFloatField;
    adoqryNominaD75: TFloatField;
    adoqryNominaD76: TFloatField;
    adoqryNominaD77: TFloatField;
    adoqryNominaD78: TFloatField;
    adoqryNominaD79: TFloatField;
    adoqryNominaD80: TFloatField;
    adoqryNominaD81: TFloatField;
    adoqryNominaD82: TFloatField;
    adoqryNominaD83: TFloatField;
    adoqryNominaD84: TFloatField;
    adoqryNominaD85: TFloatField;
    adoqryNominaD86: TFloatField;
    adoqryNominaD87: TFloatField;
    adoqryNominaD88: TFloatField;
    adoqryNominaD89: TFloatField;
    adoqryNominaD90: TFloatField;
    adoqryNominaD91: TFloatField;
    adoqryNominaD92: TFloatField;
    adoqryNominaD93: TFloatField;
    adoqryNominaD94: TFloatField;
    adoqryNominaD95: TFloatField;
    adoqryNominaD96: TFloatField;
    adoqryNominaD97: TFloatField;
    adoqryNominaD98: TFloatField;
    adoqryNominaD99: TFloatField;
    adoqryNominaTOTPER: TFloatField;
    adoqryNominaTOTDED: TFloatField;
    adoqryNominaTOTLIQ: TFloatField;
    adoqryNominaPeriodoMes: TIntegerField;
    adoqryNominaPeriodoAnio: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    FCertificado: TFECertificado;
    procedure CrearINI11(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
      pCDirXML: string);
    procedure CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
      pCDirXML: string);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils;

{$R *.dfm}

{ TdmCOBAEM }

procedure TdmCOBAEM.CrearINI11(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI, pCDirXML: string);
//var
//  Ini: TIniFile;
//  INIFileName: String;
//  XMLFileName: String;
//  vCountTotal, vCount: Integer;
//  vCountPercepcion: Integer;
//  vCountDeduccion: Integer;
//  vPercepcion: Integer;
//  ID: String;
//  vFechaPago: String;
//  vPagoDesde: String;
//  vPagoHasta: String;
//  vFechaInicioRelLaboral: string;
//  FDateSeparator: Char;
//  vPercepciones: string;
//  vDeducciones: string;
//  vP40, vP41, vP42: Double;
begin
//  FDateSeparator := FormatSettings.DateSeparator;
//  FormatSettings.DateSeparator:= '-';
//  vCount := 0;
//  adoqryNominaCount.Close;
//  if pFiltrar then
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
//  end;
//  adoqryNominaCount.Open;
//  vCountTotal:= adoqryNominaCountCUENTA.Value;
//  adoqryNominaCount.Close;
//
//  adoqryNomina.Close;
//  if pFiltrar then
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
//  end;
//  adoqryNomina.Open;
//  try
//
//    while not adoqryNomina.Eof do
//    begin
//      ID := adoqryNominaComplementoNominaNumEmpleado.Value + '_' + FloatToStr(adoqryNominaID.Value);
//      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaPago.Value);
//      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryNominaComplementoNominaPagoDesde.Value);
//      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryNominaComplementoNominaPagoHasta.Value);
////      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaInicioRelLaboral.Value);
//      INIFileName := '.' + PathDelim + pCDirINI + PathDelim + ID + '.INI';
//      XMLFileName := '.' + PathDelim + pCDirXML + PathDelim + ID + '.XML';
//      Ini := TIniFile.Create(INIFileName);
//      try
//        //[Parametros]
//        Ini.WriteString('Parametros', 'Certificado', FCertificado.Ruta);
//        Ini.WriteString('Parametros', 'LlavePrivada', FCertificado.LlavePrivada.Ruta);
//        Ini.WriteString('Parametros', 'XMLDestino', XMLFileName);
//        Ini.WriteString('Parametros', 'Bitacora', cBitacora);
//        Ini.WriteString('Parametros', 'PAC', 'ECODEX');
//        Ini.WriteString('Parametros', 'Mensajes', 'OFF');
//        //[ECODEX]
//        Ini.WriteString('ECODEX', 'Servicio', 'Prueba'); //Servicio=Prueba (cuando ya este en produccion debera usar "Produccion")
//        Ini.WriteString('ECODEX', 'RFC', adoqryNominaEmisorRFC.AsString);
//        Ini.WriteString('ECODEX', 'TransaccionID', FloatToStr(adoqryNominaID.Value));
//        //[Comprobante]
//        Ini.WriteString('Comprobante', 'Version', '3.2');
////        Ini.WriteString('Comprobante', 'Serie', '');
////        Ini.WriteString('Comprobante', 'Folio', '');
//        Ini.WriteString('Comprobante', 'FormaDePago', adoqryNominaFormaDePago.AsString);
//        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cFormatFloat,adoqryNominaSubTotal.Value));
//        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cFormatFloat,adoqryNominaDescuento.Value));
//        Ini.WriteString('Comprobante', 'MotivoDescuento', adoqryNominaMotivoDescuento.AsString);
//        Ini.WriteString('Comprobante', 'Total', FormatFloat(cFormatFloat,adoqryNominaTotal.Value));
//        Ini.WriteString('Comprobante', 'MetodoDePago', adoqryNominaMetodoDePago.AsString);
//        Ini.WriteString('Comprobante', 'TipoDeComprobante', adoqryNominaTipoDeComprobante.AsString);
//        Ini.WriteString('Comprobante', 'LugarExpedicion', adoqryNominaLugarExpedicion.AsString);
//        //[Emisor]
//        Ini.WriteString('Emisor', 'Rfc', adoqryNominaEmisorRFC.AsString);
//        Ini.WriteString('Emisor', 'Nombre', adoqryNominaEmisorNombre.AsString);
//        Ini.WriteString('Emisor', 'Regimen', adoqryNominaEmisorRegimen.AsString);
//        //[Receptor]
//        Ini.WriteString('Receptor', 'Rfc', adoqryNominaReceptorRFC.AsString);
//        Ini.WriteString('Receptor', 'Nombre', adoqryNominaReceptorNombre.AsString);
//        Ini.WriteString('Receptor', 'Pais', adoqryNominaReceptorPais.AsString);
//        //[Concepto1]
//        Ini.WriteString('Concepto1', 'Cantidad', '1');
//        Ini.WriteString('Concepto1', 'Unidad', 'Servicio');
//        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de Nomina');
//        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cFormatFloat,adoqryNominaConceptoValorUnitario.Value));
//        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cFormatFloat,adoqryNominaConceptoImporte.Value));
//        //[Impuestos]
//        if adoqryNominaImpuestosISRRetenido.Value <> 0 then
//        begin
//          Ini.WriteString('Impuestos', 'TotalImpuestosRetenidos', FormatFloat(cFormatFloat,adoqryNominaImpuestosISRRetenido.Value));
//          Ini.WriteString('Impuestos', 'ISRRetenido', FormatFloat(cFormatFloat,adoqryNominaImpuestosISRRetenido.Value));
//        end;
//        //[ComplementoNomina]
//        Ini.WriteString('ComplementoNomina', 'RegistroPatronal', adoqryNominaComplementoNominaRegistroPatronal.AsString);
//        Ini.WriteString('ComplementoNomina', 'NumEmpleado', adoqryNominaComplementoNominaNumEmpleado.Value);
//        Ini.WriteString('ComplementoNomina', 'CURP', adoqryNominaComplementoNominaCURP.Value);
//        Ini.WriteString('ComplementoNomina', 'TipoRegimen', adoqryNominaComplementoNominaTipoRegimen.AsString);
//        Ini.WriteString('ComplementoNomina', 'NumSeguridadSocial', adoqryNominaComplementoNominaNumSeguridadSocial.AsString); //FloatToStr(adoqryNominaComplementoNominaNumSeguridadSocial.Value));
//        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
//        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
//        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
//        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', adoqryNominaComplementoNominaNumDiasPagados.AsString);
//        Ini.WriteString('ComplementoNomina', 'Departamento', adoqryNominaComplementoNominaDepartamento.AsString);
////        Ini.WriteString('ComplementoNomina', 'CLABE', adoqryCFDICLABE.AsString);
////        Ini.WriteString('ComplementoNomina', 'Banco', adoqryCFDIBanco.AsString);
////        Ini.WriteString('ComplementoNomina', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
////        Ini.WriteString('ComplementoNomina', 'Antiguedad', adoqryCFDIAntiguedad.AsString);
//        Ini.WriteString('ComplementoNomina', 'Puesto', adoqryNominaComplementoNominaPuesto.AsString);
//        Ini.WriteString('ComplementoNomina', 'TipoContrato', adoqryNominaComplementoNominaTipoContrato.AsString);
////        Ini.WriteString('ComplementoNomina', 'TipoJornada', adoqryCFDITipoJornada.AsString);
//        Ini.WriteString('ComplementoNomina', 'PeriodicidadPago', 'quincenal');
////        Ini.WriteString('ComplementoNomina', 'SalarioBaseCotApor', adoqryCFDISalarioBaseCotApor.AsString);
////        Ini.WriteString('ComplementoNomina', 'RiesgoPuesto', adoqryCFDIRiesgoPuesto.AsString);
////        Ini.WriteString('ComplementoNomina', 'SalarioDiarioIntegrado', adoqryCFDISalarioDiarioIntegrado.AsString);
//        //[nomPercepciones]
//        vCountPercepcion := 0;
//        if (adoqryNominaPTotalGravado.Value <> 0) or (adoqryNominaPTotalExento.Value <> 0) then
//        begin
//          Ini.WriteString(cPercepciones, 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaPTotalGravado.Value));
//          Ini.WriteString(cPercepciones, 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaPTotalExento.Value));
//        end;
//        //[nomPercepciones1]
//        if (adoqryNominaP03.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P03');
//          Ini.WriteString(vPercepciones, 'Concepto', 'ACTUALIZACION PERSONAL ADMINISTRATIVO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP03.Value));
//        end;
//        if (adoqryNominaP04.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P04');
//          Ini.WriteString(vPercepciones, 'Concepto', 'CO.PE.A.');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP04.Value));
//        end;
//        if (adoqryNominaP05.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P05');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA TITULACION');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP05.Value));
//        end;
//        if (adoqryNominaP06.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
//          Ini.WriteString(vPercepciones, 'Clave', 'P06');
//          Ini.WriteString(vPercepciones, 'Concepto', 'NIVELACION SALARIAL');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP06.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP09.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P09');
//          Ini.WriteString(vPercepciones, 'Concepto', 'BONIFICACION DIAS ECONOMICOS');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP09.Value));
//        end;
//        if (adoqryNominaP10.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P10');
//          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIM. DESEMPEÑO PEROSNAL ADMTO.');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP10.Value));
//        end;
//        if (adoqryNominaP11.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P11');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA IMPRESIÓN DE TESIS');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP11.Value));
//        end;
//        if (adoqryNominaP12.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P12');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA ESTUDIOS');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP12.Value));
//        end;
//        if (adoqryNominaP13.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '010');
//          Ini.WriteString(vPercepciones, 'Clave', 'P13');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PUNTUALIDAD Y ASISTENCIA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP13.Value));
//        end;
//        if (adoqryNominaP14.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P14');
//          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTA NAVIDEÑA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP14.Value));
//        end;
//        if (adoqryNominaP15.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P15');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COEXA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP15.Value));
//        end;
//        if (adoqryNominaP16.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P16');
//          Ini.WriteString(vPercepciones, 'Concepto', 'I.M.E. (QNA. 15)');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP16.Value));
//        end;
//        if (adoqryNominaP17.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P17');
//          Ini.WriteString(vPercepciones, 'Concepto', 'DIA DEL DOCENTE y/o ADMINISTRATIVO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP17.Value));
//        end;
//        if (adoqryNominaP18.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '029');
//          Ini.WriteString(vPercepciones, 'Clave', 'P18');
//          Ini.WriteString(vPercepciones, 'Concepto', 'VALES DE DESPENSA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP18.Value));
//        end;
//        if (adoqryNominaP19.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P19');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ACTUACION Y PRODUCTIVIDAD');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP19.Value));
//        end;
//        if (adoqryNominaP21.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P21');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO A LA SUPERACION ACADEMICA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP21.Value));
//        end;
//        if (adoqryNominaP22.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P22');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA P/LA ADQUISICION DE LIBROS');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP22.Value));
//        end;
//        if (adoqryNominaP24.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P24');
//          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO POR TITULACION');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP24.Value));
//        end;
//        if (adoqryNominaP30.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
//          Ini.WriteString(vPercepciones, 'Clave', 'P30');
//          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO MIGRANTES');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP30.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP40.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P40');
//          Ini.WriteString(vPercepciones, 'Concepto', 'I.S.T.P. DEVUELTO A MIGRANTES');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP40.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP41.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P41');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO PARA COMPRA DE UTILES ESCOLARES');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP41.Value));
//        end;
//        if (adoqryNominaP42.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '017');
//          Ini.WriteString(vPercepciones, 'Clave', 'P42');
//          Ini.WriteString(vPercepciones, 'Concepto', 'SUBSIDIO PARA EL EMPLEO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP42.Value));
//        end;
//        if (adoqryNominaP43.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P43');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP43.Value));
//        end;
//        if (adoqryNominaP44.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P44');
//          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO ACADEMICO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP44.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP45.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P45');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APORTACION INST. SEG. DE RETIRO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP45.Value));
//        end;
//        if (adoqryNominaP46.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P46');
//          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO MEDICO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP46.Value));
//        end;
//        if (adoqryNominaP49.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P49');
//          Ini.WriteString(vPercepciones, 'Concepto', '12,24 O 36 % ADICIONAL (10,20 Y 25 AÑOS)');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP49.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP50.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P50');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COMPLEMENTO A LA ANUALIDAD');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP50.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP53.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P53');
//          Ini.WriteString(vPercepciones, 'Concepto', 'BONO DE PRODUCTIVIDAD');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP53.Value));
//        end;
//        if (adoqryNominaP54.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '037');
//          Ini.WriteString(vPercepciones, 'Clave', 'P54');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PAGO DE MARCHA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP54.Value));
//        end;
//        if (adoqryNominaP56.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P56');
//          Ini.WriteString(vPercepciones, 'Concepto', 'ETIMULO POR AÑOS DE SERVICIO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP56.Value));
//        end;
//        if (adoqryNominaP57.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '019');
//          Ini.WriteString(vPercepciones, 'Clave', 'P57');
//          Ini.WriteString(vPercepciones, 'Concepto', 'TIEMPO EXTRA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP57.Value));
//        end;
//        if (adoqryNominaP58.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '035');
//          Ini.WriteString(vPercepciones, 'Clave', 'P58');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA P/COMPRA DE LENTES');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP58.Value));
//        end;
//        if (adoqryNominaP59.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P59');
//          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTILLA MATERNAL');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP59.Value));
//        end;
//        if (adoqryNominaP60.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
//          Ini.WriteString(vPercepciones, 'Clave', 'P60');
//          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO TABULAR');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP60.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP61.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P61');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA DESPENSA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP61.Value));
//        end;
//        if (adoqryNominaP62.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
//          Ini.WriteString(vPercepciones, 'Clave', 'P62');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA VACACIONAL');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP62.Value));
//        end;
//        if (adoqryNominaP63.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
//          Ini.WriteString(vPercepciones, 'Clave', 'P63');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AGINALDO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP63.Value));
//        end;
//        if (adoqryNominaP64.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P64');
//          Ini.WriteString(vPercepciones, 'Concepto', 'MATERIAL DIDACTICO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP64.Value));
//        end;
//        if (adoqryNominaP65.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P65');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PENSION ALIMENTICIA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP65.Value));
//        end;
//        if (adoqryNominaP66.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P66');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP66.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP67.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '022');
//          Ini.WriteString(vPercepciones, 'Clave', 'P67');
//          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ANTIGÜEDAD');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP67.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        end;
//        if (adoqryNominaP68.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', 'P68');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA GUARDERIA');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP68.Value));
//        end;
//        // Normal
//        if (adoqryNominaP69.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
//          Ini.WriteString(vPercepciones, 'Clave', 'P69');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP69.Value));
//        end;
//
//        //Jubilacion
////        if (adoqryNominaP69G.Value <> 0) OR (adoqryNominaP69E.Value <> 0) then
////        begin
////          Inc(vCountPercepcion);
////          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
////          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
////          Ini.WriteString(vPercepciones, 'Clave', 'P69');
////          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
////          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP69G.Value));
////          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP69E.Value));
////        end;
//
//        // Ingresos mixtos
//        //'042' AS P042Clave, 'Percepciones' AS P042Concepto, N.TOTPER / 2 AS P042ImporteGravado, 0 AS P042ImporteExento,
//        //'041' AS P041Clave, 'Percepciones' AS P041Concepto, N.TOTPER / 2 * - 1 AS P041ImporteGravado, 0 AS P041ImporteExento,
//        vP42:= adoqryNominaTOTPER.Value/2;
//        vP41:= (adoqryNominaTOTPER.Value/2)*-1;
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '042');
//          Ini.WriteString(vPercepciones, 'Clave', '000');
//          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS MIXTOS');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,vP42));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
//          Ini.WriteString(vPercepciones, 'Clave', '000');
//          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS FEDERALES');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,vP41));
//          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
////        //[nomPercepciones41]
////        if (adoqryNominaP041ImporteGravado.Value <> 0) OR (adoqryNominaP041ImporteExento.Value <> 0) then
////        begin
////          Inc(vCountPercepcion);
////          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
////          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
////          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP041Clave.AsString);
////          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP041Concepto.AsString);
////          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP041ImporteGravado.Value));
////          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP041ImporteExento.Value));
////        end;
////        //[nomPercepciones42]
////        if (adoqryNominaP042ImporteGravado.Value <> 0) OR (adoqryNominaP042ImporteExento.Value <> 0) then
////        begin
////          Inc(vCountPercepcion);
////          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
////          Ini.WriteString(vPercepciones, 'TipoPercepcion', '042');
////          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP042Clave.AsString);
////          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP042Concepto.AsString);
////          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP042ImporteGravado.Value));
////          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP042ImporteExento.Value));
////        end;
//        //[nomDeducciones]
//        vCountDeduccion := 0;
//        if (adoqryNominaDTotalGravado.Value <> 0) or (adoqryNominaDTotalExento.Value <> 0) then
//        begin
//          Ini.WriteString('nomDeducciones', 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaDTotalGravado.Value));
//          Ini.WriteString('nomDeducciones', 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaDTotalExento.Value));
//        end;
//        //[nomDeducciones1]
//        if (adoqryNominaD26.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
//          Ini.WriteString(vDeducciones, 'Clave', 'D26');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE SALUD');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD26.Value));
//        end;
//        if (adoqryNominaD27.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
//          Ini.WriteString(vDeducciones, 'Clave', 'D27');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE INVALIDEZ Y VIDA');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD27.Value));
//        end;
//        if (adoqryNominaD28.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '005');
//          Ini.WriteString(vDeducciones, 'Clave', 'D28');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SERVICIOS SOCIALES Y CULTURALES(ISSSTE VIVIENDA)');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD28.Value));
//        end;
//        if (adoqryNominaD29.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
//          Ini.WriteString(vDeducciones, 'Clave', 'D29');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEG. D RET. Y CES. EN E. AV. Y .V');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD29.Value));
//        end;
//        if (adoqryNominaD32.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D32');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL METLIFE');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD32.Value));
//        end;
//        if (adoqryNominaD34.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D34');
//          Ini.WriteString(vDeducciones, 'Concepto', 'EDITORIAL (DIMAS EDICIONES)');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD34.Value));
//        end;
//        if (adoqryNominaD35.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D35');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD35.Value));
//        end;
//        if (adoqryNominaD36.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D36');
//          Ini.WriteString(vDeducciones, 'Concepto', 'E.T.E. S.A. DE C.V.');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD36.Value));
//        end;
//        if (adoqryNominaD37.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D37');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SIPRESTO');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD37.Value));
//        end;
//        if (adoqryNominaD70.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D70');
//          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA DE APOYO POR DECESO 1 %');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD70.Value));
//        end;
//        if (adoqryNominaD71.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D71');
//          Ini.WriteString(vDeducciones, 'Concepto', 'APOYO POR JUBILACION 1%');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD71.Value));
//        end;
//        if (adoqryNominaD72.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D72');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD72.Value));
//        end;
//        if (adoqryNominaD73.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D73');
//          Ini.WriteString(vDeducciones, 'Concepto', 'IMPULSORA PROMOBIEN (FAMSA)');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD73.Value));
//        end;
//        if (adoqryNominaD75.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D75');
//          Ini.WriteString(vDeducciones, 'Concepto', 'PREVISION DE SERVICIOS FUNERARIOS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD75.Value));
//        end;
//        if (adoqryNominaD78.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
//          Ini.WriteString(vDeducciones, 'Clave', 'D78');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEG. DE DAÑOS POR C. HIPOTECARIO');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD78.Value));
//        end;
//        if (adoqryNominaD79.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D79');
//          Ini.WriteString(vDeducciones, 'Concepto', 'DEUDORES DIVERSOS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD79.Value));
//        end;
//        if (adoqryNominaD80.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
//          Ini.WriteString(vDeducciones, 'Clave', 'D80');
//          Ini.WriteString(vDeducciones, 'Concepto', 'ISR');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD80.Value));
//        end;
//        if (adoqryNominaD83.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '020');
//          Ini.WriteString(vDeducciones, 'Clave', 'D83');
//          Ini.WriteString(vDeducciones, 'Concepto', 'INASISTENCIAS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD83.Value));
//        end;
//        if (adoqryNominaD84.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D84');
//          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTOS VARIOS');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD84.Value));
//        end;
//        if (adoqryNominaD85.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D85');
//          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO A CORTO PLAZO ISSSTE');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD85.Value));
//        end;
//        if (adoqryNominaD86.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
//          Ini.WriteString(vDeducciones, 'Clave', 'D86');
//          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINDICAL');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD86.Value));
//        end;
//        if (adoqryNominaD87.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '011');
//          Ini.WriteString(vDeducciones, 'Clave', 'D87');
//          Ini.WriteString(vDeducciones, 'Concepto', 'FONACOT');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD87.Value));
//        end;
//        if (adoqryNominaD88.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
//          Ini.WriteString(vDeducciones, 'Clave', 'D88');
//          Ini.WriteString(vDeducciones, 'Concepto', 'AHORRO SOLIDARIO');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD88.Value));
//        end;
//        if (adoqryNominaD89.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
//          Ini.WriteString(vDeducciones, 'Clave', 'D89');
//          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO HIPOTECARIO FOVISSSTE');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD89.Value));
//        end;
//        if (adoqryNominaD90.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '007');
//          Ini.WriteString(vDeducciones, 'Clave', 'D90');
//          Ini.WriteString(vDeducciones, 'Concepto', 'PENSION ALIMENTICIA');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD90.Value));
//        end;
//        if (adoqryNominaD91.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D91');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL INBURSA');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD91.Value));
//        end;
//        if (adoqryNominaD92.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D92');
//          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE RETIRO');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD92.Value));
//        end;
//        if (adoqryNominaD95.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
//          Ini.WriteString(vDeducciones, 'Clave', 'D95');
//          Ini.WriteString(vDeducciones, 'Concepto', 'IMPUESTO 10% (ISR MIGRANTES');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD95.Value));
//        end;
//        if (adoqryNominaD96.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
//          Ini.WriteString(vDeducciones, 'Clave', 'D96');
//          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINIDCAL STUCOBAEM');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD96.Value));
//        end;
//        if (adoqryNominaD99.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', 'D99');
//          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTO DEL SITCBEM');
//          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD99.Value));
//        end;
//      finally
//        Ini.Free;
//      end;
//      Inc(vCount);
//      ShowProgress(vCount,vCountTotal);
//      adoqryNomina.Next;
//    end;
//  finally
//    adoqryNomina.Close;
//    ShowProgress(0,0);
//    FormatSettings.DateSeparator := FDateSeparator;
//  end;
end;

procedure TdmCOBAEM.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
  pCDirXML: string);
var
  Ini: TIniFile;
  INIFileName: String;
  XMLFileName: String;
  vCountTotal, vCount: Integer;
  vCountPercepcion: Integer;
  vCountDeduccion: Integer;
  vPercepcion: Integer;
  ID: String;
  vFechaPago: String;
  vPagoDesde: String;
  vPagoHasta: String;
  vFechaInicioRelLaboral: string;
  FDateSeparator: Char;
  vPercepciones: string;
  vDeducciones: string;
//  vP40, vP41, vP42: Double;
  vCampoIni, vCampoFin, vCampoI: Integer;
  vCampoN, vClave: string;
  vCampoV: Double;
  vCampoGravado, vCampoExento: Boolean;
  vCountOtrosPagos: Integer;
  vOtrosPagos: string;
  vMontoRecursoPropio: Extended;

  function Remplazar(s: string): string;
  begin
    s := StringReplace(s,'"', '', [rfReplaceAll]);
    s := StringReplace(s,'.', '', [rfReplaceAll]);
    s := StringReplace(s,'(', '', [rfReplaceAll]);
    s := StringReplace(s,')', '', [rfReplaceAll]);
    s := StringReplace(s,'/', ' ', [rfReplaceAll]);
    s := StringReplace(s,'¥', 'Ñ', [rfReplaceAll]);
    s := StringReplace(s,'š', 'Ü', [rfReplaceAll]);
    Result := s;
  end;

begin
  FDateSeparator := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '-';
  vCount := 0;
  adoqryNominaCount.Close;
  if pFiltrar then
  begin
    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
  end
  else
  begin
    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= 0;
    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= 0;
    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= 0;
    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= 0;
  end;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;
  adoqryNomina.Close;
  if pFiltrar then
  begin
    adoqryNomina.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryNomina.Parameters.ParamByName('Anio2').Value:= pAnio;
    adoqryNomina.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryNomina.Parameters.ParamByName('Mes2').Value:= pMes;
  end
  else
  begin
    adoqryNomina.Parameters.ParamByName('Anio1').Value:= 0;
    adoqryNomina.Parameters.ParamByName('Anio2').Value:= 0;
    adoqryNomina.Parameters.ParamByName('Mes1').Value:= 0;
    adoqryNomina.Parameters.ParamByName('Mes2').Value:= 0;
  end;

  adoqryNomina.Open;
  try
    while not adoqryNomina.Eof do
    begin
      ID := adoqryNominanomReceptorNumEmpleado.Value + '_' + FloatToStr(adoqryNominaID.Value);
      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaPago.Value);
      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaInicialPago.Value);
      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaFinalPago.Value);
      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryNominanomReceptorFechaInicioRelLaboral.Value);
      INIFileName := '.' + PathDelim + pCDirINI + PathDelim + ID + '.INI';
      XMLFileName := '.' + PathDelim + pCDirXML + PathDelim + ID + '.XML';
      Ini := TIniFile.Create(INIFileName);
      try
        //[Parametros]
        Ini.WriteString('Parametros', 'Certificado', FCertificado.Ruta);
        Ini.WriteString('Parametros', 'LlavePrivada', FCertificado.LlavePrivada.Ruta);
        Ini.WriteString('Parametros', 'XMLDestino', XMLFileName);
        Ini.WriteString('Parametros', 'Bitacora', cBitacora);
        //[Comprobante]
        Ini.WriteString('Comprobante', 'Version', '3.2');
//        Ini.WriteString('Comprobante', 'Serie', '');
//        Ini.WriteString('Comprobante', 'Folio', '');
        Ini.WriteString('Comprobante', 'FormaDePago', adoqryNominaFormaDePago.AsString);
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cCFDI_ImporteMXN,adoqryNominaSubTotal.Value));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaDescuento.Value));
        Ini.WriteString('Comprobante', 'TipoCambio', '1');
        Ini.WriteString('Comprobante', 'Moneda', 'MXN');
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cCFDI_ImporteMXN,adoqryNominaTotal.Value));
        Ini.WriteString('Comprobante', 'MetodoDePago', adoqryNominaMetodoDePago.AsString);
        Ini.WriteString('Comprobante', 'TipoDeComprobante', adoqryNominaTipoDeComprobante.AsString);
        Ini.WriteString('Comprobante', 'LugarExpedicion', adoqryNominaLugarExpedicion.AsString);
        //[Emisor]
        {$IFDEF DEBUG}
          Ini.WriteString('Emisor', 'Rfc', 'ACO560518KW7');
        {$ELSE}
          Ini.WriteString('Emisor', 'Rfc', adoqryNominaEmisorRFC.AsString);
        {$ENDIF}
        Ini.WriteString('Emisor', 'Nombre', adoqryNominaEmisorNombre.AsString);
        Ini.WriteString('Emisor', 'Regimen', adoqryNominaEmisorRegimen.AsString);
        //[Receptor]
        {$IFDEF DEBUG}
          Ini.WriteString('Receptor', 'Rfc', 'TEST010203AL3');
        {$ELSE}
          Ini.WriteString('Receptor', 'Rfc', adoqryNominaReceptorRFC.AsString);
        {$ENDIF}
        Ini.WriteString('Receptor', 'Nombre', adoqryNominaReceptorNombre.AsString);
//        Ini.WriteString('Receptor', 'Pais', adoqryNominaReceptorPais.AsString);
        //[Concepto1]
        Ini.WriteString('Concepto1', 'Cantidad', '1');
        Ini.WriteString('Concepto1', 'Unidad', 'ACT');
        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de nómina');
        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cCFDI_ImporteMXN,adoqryNominaConceptoValorUnitario.Value));
        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaConceptoImporte.Value));
        //[Impuestos]
        // Ver si se va a colocar
//        if adoqryNominaImpuestosISRRetenido.Value <> 0 then
//        begin
//          Ini.WriteString('Impuestos', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryNominaImpuestosISRRetenido.Value));
//          Ini.WriteString('Impuestos', 'ISRRetenido', FormatFloat(cCFDI_ImporteMXN,adoqryNominaImpuestosISRRetenido.Value));
//        end;
        //[ComplementoNomina]
        Ini.WriteString('ComplementoNomina', 'TipoNomina', adoqryNominaComplementoNominaTipoNomina.AsString);
        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', adoqryNominaComplementoNominaNumDiasPagados.AsString);
        if (adoqryNominaComplementoNominaTotalPercepciones.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalPercepciones', FormatFloat(cCFDI_ImporteMXN,adoqryNominaComplementoNominaTotalPercepciones.Value));
        if (adoqryNominaComplementoNominaTotalDeducciones.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryNominaComplementoNominaTotalDeducciones.Value));
        if (adoqryNominaComplementoNominaTotalOtrosPagos.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalOtrosPagos', FormatFloat(cCFDI_ImporteMXN,adoqryNominaComplementoNominaTotalOtrosPagos.Value));
        //[nomEmisor]
//        Ini.WriteString('nomEmisor', 'CURP', adoqryNominanomEmisorCURP.AsString);
        Ini.WriteString('nomEmisor', 'RegistroPatronal', adoqryNominanomEmisorRegistroPatronal.AsString);
//        Ini.WriteString('nomEmisor', 'RfcPatronOrigen', adoqryNominanomEmisorRfcPatronOrigen.AsString);
        // Mixtos
        vMontoRecursoPropio:= adoqryNominaTOTPER.Value/2;
        {$IFDEF DEBUG}

        {$ELSE}
          Ini.WriteString('nomEmisor', 'OrigenRecurso', 'IM');
          Ini.WriteString('nomEmisor', 'MontoRecursoPropio', FormatFloat(cCFDI_ImporteMXN,vMontoRecursoPropio));
        {$ENDIF}
        //[nomReceptor]
        Ini.WriteString('nomReceptor', 'CURP', adoqryNominanomReceptorCURP.AsString);
        Ini.WriteString('nomReceptor', 'NumSeguridadSocial', adoqryNominanomReceptorNumSeguridadSocial.AsString);
        Ini.WriteString('nomReceptor', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
        Ini.WriteString('nomReceptor', 'Antigedad', adoqryNominanomReceptorAntiguedad.AsString);
        Ini.WriteString('nomReceptor', 'TipoContrato', adoqryNominanomReceptorTipoContrato.AsString);
        Ini.WriteString('nomReceptor', 'Sindicalizado', adoqryNominanomReceptorSindicalizado.AsString);
        Ini.WriteString('nomReceptor', 'TipoJornada', adoqryNominanomReceptorTipoJornada.AsString);
        Ini.WriteString('nomReceptor', 'TipoRegimen', adoqryNominanomReceptorTipoRegimen.AsString);
        Ini.WriteString('nomReceptor', 'NumEmpleado', adoqryNominanomReceptorNumEmpleado.Value);
        Ini.WriteString('nomReceptor', 'Departamento', Remplazar(adoqryNominanomReceptorDepartamento.AsString));
        Ini.WriteString('nomReceptor', 'Puesto', Remplazar(adoqryNominanomReceptorPuesto.AsString));
        Ini.WriteString('nomReceptor', 'RiesgoPuesto', adoqryNominanomReceptorRiesgoPuesto.AsString);
        Ini.WriteString('nomReceptor', 'PeriodicidadPago', adoqryNominanomReceptorPeriodicidadPago.AsString);
//        Ini.WriteString('nomReceptor', 'Banco', adoqryNominanomEmisorBanco.AsString);
//        Ini.WriteString('nomReceptor', 'CuentaBancaria', adoqryNominanomEmisorCuentaBancaria.AsString);
        Ini.WriteString('nomReceptor', 'SalarioBaseCotApor', adoqryNominanomReceptorSalarioBaseCotApor.AsString);
        Ini.WriteString('nomReceptor', 'SalarioDiarioIntegrado', adoqryNominanomReceptorSalarioDiarioIntegrado.AsString);
        Ini.WriteString('nomReceptor', 'ClaveEntFed', adoqryNominanomReceptorClaveEntFed.AsString);
        //[nomSubcontratacion1]
        //RfcLabora=XAXX010101000
        //PorcentajeTiempo=50.000
        //[nomPercepciones]
        if (adoqryNominanomPercepcionesTotalSueldos.Value <> 0)
        or (adoqryNominanomPercepcionesTotalGravado.Value <> 0)
        or (adoqryNominanomPercepcionesTotalExento.Value <> 0) then
        begin
          Ini.WriteString('nomPercepciones', 'TotalSueldos', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomPercepcionesTotalSueldos.Value));
//          Ini.WriteString('nomPercepciones', 'TotalSeparacionIndemnizacion', FormatFloat(cCFDI_ImporteMXN,adoqryNominaPTotalGravado.Value));
//          Ini.WriteString('nomPercepciones', 'TotalJubilacionPensionRetiro', FormatFloat(cCFDI_ImporteMXN,adoqryNominaPTotalGravado.Value));
          Ini.WriteString('nomPercepciones', 'TotalGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomPercepcionesTotalGravado.Value));
          Ini.WriteString('nomPercepciones', 'TotalExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomPercepcionesTotalExento.Value));
        end;
        //[nomPercepciones1]
        vCountPercepcion := 0;
//        vCampoIni := 34;
//        vCampoFin := 56;
//        for vCampoI := vCampoIni to vCampoFin do
//        begin
//          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
//          vClave := Copy(vCampoN, 2, Length(vCampoN));
//          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
//          if (vCampoV <> 0) then
//          begin
//            if dxmdPercepcionesTipo.Locate('Clave', vClave, []) then
//            begin
//              Inc(vCountPercepcion);
//              vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//              Ini.WriteString(vPercepciones, 'TipoPercepcion', dxmdPercepcionesTipoSAT.Value);
//              Ini.WriteString(vPercepciones, 'Clave', vClave);
//              Ini.WriteString(vPercepciones, 'Concepto', dxmdPercepcionesTipoConcepto.Value);
//              vCampoGravado := dxmdPercepcionesTipoGravado.Value;
//              vCampoExento := dxmdPercepcionesTipoExento.Value;
//              if vCampoGravado then
//                Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,vCampoV))
//              else
//                Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//              if vCampoExento then
//                Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,vCampoV))
//              else
//                Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//              //ValorMercado=
//              //PrecioAlOtorgarse=
//              //HorasExtra1Dias=
//              //HorasExtra1TipoHoras=
//              //HorasExtra1HorasExtra=
//              //HorasExtra1ImportePagado=
//            end;
//          end;
//        end;
        if (adoqryNominaP03.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P03');
          Ini.WriteString(vPercepciones, 'Concepto', 'ACTUALIZACION PERSONAL ADMINISTRATIVO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP03.Value));
        end;
        if (adoqryNominaP04.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P04');
          Ini.WriteString(vPercepciones, 'Concepto', 'COPEA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP04.Value));
        end;
        if (adoqryNominaP05.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P05');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA TITULACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP05.Value));
        end;
        if (adoqryNominaP06.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P06');
          Ini.WriteString(vPercepciones, 'Concepto', 'NIVELACION SALARIAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP06.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP09.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P09');
          Ini.WriteString(vPercepciones, 'Concepto', 'BONIFICACION DIAS ECONOMICOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP09.Value));
        end;
        if (adoqryNominaP10.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P10');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIM DESEMPEÑO PEROSNAL ADMTO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP10.Value));
        end;
        if (adoqryNominaP11.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P11');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA IMPRESIÓN DE TESIS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP11.Value));
        end;
        if (adoqryNominaP12.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P12');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA ESTUDIOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP12.Value));
        end;
        if (adoqryNominaP13.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '010');
          Ini.WriteString(vPercepciones, 'Clave', 'P13');
          Ini.WriteString(vPercepciones, 'Concepto', 'PUNTUALIDAD Y ASISTENCIA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP13.Value));
        end;
        if (adoqryNominaP14.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P14');
          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTA NAVIDEÑA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP14.Value));
        end;
        if (adoqryNominaP15.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P15');
          Ini.WriteString(vPercepciones, 'Concepto', 'COEXA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP15.Value));
        end;
        if (adoqryNominaP16.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P16');
          Ini.WriteString(vPercepciones, 'Concepto', 'IME - QNA 15');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP16.Value));
        end;
        if (adoqryNominaP17.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P17');
          Ini.WriteString(vPercepciones, 'Concepto', 'DIA DEL DOCENTE y o ADMINISTRATIVO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP17.Value));
        end;
        if (adoqryNominaP18.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '029');
          Ini.WriteString(vPercepciones, 'Clave', 'P18');
          Ini.WriteString(vPercepciones, 'Concepto', 'VALES DE DESPENSA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP18.Value));
        end;
        if (adoqryNominaP19.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P19');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ACTUACION Y PRODUCTIVIDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP19.Value));
        end;
        if (adoqryNominaP21.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P21');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO A LA SUPERACION ACADEMICA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP21.Value));
        end;
        if (adoqryNominaP22.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P22');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA LA ADQUISICION DE LIBROS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP22.Value));
        end;
        if (adoqryNominaP23.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P23');
          Ini.WriteString(vPercepciones, 'Concepto', 'DIA DEL EMPLEADO ADMINISTRATIVO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP23.Value));
        end;
        if (adoqryNominaP24.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P24');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO POR TITULACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP24.Value));
        end;
        if (adoqryNominaP25.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P25');
          Ini.WriteString(vPercepciones, 'Concepto', 'PROGRAMA EN LA DIFUCION POR INCENTIVO EDUCACION MEDIA SUPERIOR');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP25.Value));
        end;
        if (adoqryNominaP30.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P30');
          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO MIGRANTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP30.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP40.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P40');
          Ini.WriteString(vPercepciones, 'Concepto', 'ISTP DEVUELTO A MIGRANTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP40.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP41.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P41');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO PARA COMPRA DE UTILES ESCOLARES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP41.Value));
        end;
        if (adoqryNominaP43.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P43');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP43.Value));
        end;
        if (adoqryNominaP44.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P44');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO ACADEMICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP44.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP45.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P45');
          Ini.WriteString(vPercepciones, 'Concepto', 'APORTACION INST SEG DE RETIRO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP45.Value));
        end;
        if (adoqryNominaP46.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P46');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO MEDICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP46.Value));
        end;
        if (adoqryNominaP49.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P49');
          Ini.WriteString(vPercepciones, 'Concepto', '12,24 O 36 % ADICIONAL 10,20 Y 25 AÑOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP49.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP50.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P50');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPLEMENTO A LA ANUALIDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP50.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP53.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P53');
          Ini.WriteString(vPercepciones, 'Concepto', 'BONO DE PRODUCTIVIDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP53.Value));
        end;
        if (adoqryNominaP54.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '037');
          Ini.WriteString(vPercepciones, 'Clave', 'P54');
          Ini.WriteString(vPercepciones, 'Concepto', 'PAGO DE MARCHA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP54.Value));
        end;
        if (adoqryNominaP56.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P56');
          Ini.WriteString(vPercepciones, 'Concepto', 'ETIMULO POR AÑOS DE SERVICIO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP56.Value));
        end;
        if (adoqryNominaP57.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '019');
          Ini.WriteString(vPercepciones, 'Clave', 'P57');
          Ini.WriteString(vPercepciones, 'Concepto', 'TIEMPO EXTRA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP57.Value));
        end;
        if (adoqryNominaP58.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '035');
          Ini.WriteString(vPercepciones, 'Clave', 'P58');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA COMPRA DE LENTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP58.Value));
        end;
        if (adoqryNominaP59.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P59');
          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTILLA MATERNAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP59.Value));
        end;
        if (adoqryNominaP60.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P60');
          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO TABULAR');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP60.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP61.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P61');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA DESPENSA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP61.Value));
        end;
        if (adoqryNominaP62G.Value <> 0) OR (adoqryNominaP62E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
          Ini.WriteString(vPercepciones, 'Clave', 'P62');
          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA VACACIONAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP62G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP62E.Value));
        end;
        if (adoqryNominaP63G.Value <> 0) OR (adoqryNominaP63E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
          Ini.WriteString(vPercepciones, 'Clave', 'P63');
          Ini.WriteString(vPercepciones, 'Concepto', 'AGINALDO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP63G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP63E.Value));
        end;

//        if (adoqryNominaP62.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
//          Ini.WriteString(vPercepciones, 'Clave', 'P62');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA VACACIONAL');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP62.Value));
//        end;
//        if (adoqryNominaP63.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
//          Ini.WriteString(vPercepciones, 'Clave', 'P63');
//          Ini.WriteString(vPercepciones, 'Concepto', 'AGINALDO');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP63.Value));
//        end;
        if (adoqryNominaP64.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P64');
          Ini.WriteString(vPercepciones, 'Concepto', 'MATERIAL DIDACTICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP64.Value));
        end;
        if (adoqryNominaP65.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P65');
          Ini.WriteString(vPercepciones, 'Concepto', 'PENSION ALIMENTICIA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP65.Value));
        end;
        if (adoqryNominaP66.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P66');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP66.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP67.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P67');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ANTIGÜEDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP67.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP68.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P68');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA GUARDERIA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP68.Value));
        end;
        // Normal
        if (adoqryNominaP69.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P69');
          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP69.Value));
        end;
        //Jubilacion
//        if (adoqryNominaP69G.Value <> 0) OR (adoqryNominaP69E.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
//          Ini.WriteString(vPercepciones, 'Clave', 'P69');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP69G.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP69E.Value));
//        end;

      //[nomJubilacionPensionRetiro]
      //TotalUnaExhibicion=10000.00
      //TotalParcialidad=
      //MontoDiario=
      //IngresoAcumulable=8000.00
      //IngresoNoAcumulable=2000.00
      //
      //[nomSeparacionIndemnizacion]
      //TotalPagado=5000.00
      //NumAosServicio=9
      //UltimoSueldoMensOrd=4000.00
      //IngresoAcumulable=3000.00
      //IngresoNoAcumulable=1000.00

        //[nomDeducciones]
        if (adoqryNominanomDeduccionesTotalOtrasDeducciones.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalOtrasDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomDeduccionesTotalOtrasDeducciones.Value));
        if (adoqryNominanomDeduccionesTotalImpuestosRetenidos.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomDeduccionesTotalImpuestosRetenidos.Value));
//        //[nomDeducciones1]
        vCountDeduccion := 0;
//        vCampoIni := 57;
//        vCampoFin := 94;
//        for vCampoI := vCampoIni to vCampoFin do
//        begin
//          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
//          vClave := Copy(vCampoN, 2, Length(vCampoN));
//          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
//          if (vCampoV <> 0) then
//          begin
//            if dxmdDeduccionesTipo.Locate('Clave', vClave, []) then
//            begin
//              Inc(vCountDeduccion);
//              vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//              Ini.WriteString(vDeducciones, 'TipoDeduccion', dxmdDeduccionesTipoSAT.Value);
//              Ini.WriteString(vDeducciones, 'Clave', vClave);
//              Ini.WriteString(vDeducciones, 'Concepto', dxmdDeduccionesTipoConcepto.Value);
//              Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,vCampoV));
//            end;
//          end;
//        end;

        if (adoqryNominaD26.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
          Ini.WriteString(vDeducciones, 'Clave', 'D26');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE SALUD');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD26.Value));
        end;
        if (adoqryNominaD27.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
          Ini.WriteString(vDeducciones, 'Clave', 'D27');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE INVALIDEZ Y VIDA');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD27.Value));
        end;
        if (adoqryNominaD28.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '005');
          Ini.WriteString(vDeducciones, 'Clave', 'D28');
          Ini.WriteString(vDeducciones, 'Concepto', 'SERVICIOS SOCIALES Y CULTURALES ISSSTE VIVIENDA');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD28.Value));
        end;
        if (adoqryNominaD29.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
          Ini.WriteString(vDeducciones, 'Clave', 'D29');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEG D RET Y CES EN E AV Y V');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD29.Value));
        end;
        if (adoqryNominaD32.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D32');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL METLIFE');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD32.Value));
        end;
        if (adoqryNominaD34.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D34');
          Ini.WriteString(vDeducciones, 'Concepto', 'EDITORIAL DIMAS EDICIONES');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD34.Value));
        end;
        if (adoqryNominaD35.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D35');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD35.Value));
        end;
        if (adoqryNominaD36.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D36');
          Ini.WriteString(vDeducciones, 'Concepto', 'ETE SA DE CV');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD36.Value));
        end;
        if (adoqryNominaD37.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D37');
          Ini.WriteString(vDeducciones, 'Concepto', 'SIPRESTO');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD37.Value));
        end;
        if (adoqryNominaD70.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D70');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA DE APOYO POR DECESO 1%');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD70.Value));
        end;
        if (adoqryNominaD71.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D71');
          Ini.WriteString(vDeducciones, 'Concepto', 'APOYO POR JUBILACION 1%');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD71.Value));
        end;
        if (adoqryNominaD72.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D72');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD72.Value));
        end;
        if (adoqryNominaD73.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D73');
          Ini.WriteString(vDeducciones, 'Concepto', 'IMPULSORA PROMOBIEN FAMSA');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD73.Value));
        end;
        if (adoqryNominaD75.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D75');
          Ini.WriteString(vDeducciones, 'Concepto', 'PREVISION DE SERVICIOS FUNERARIOS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD75.Value));
        end;
        if (adoqryNominaD78.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
          Ini.WriteString(vDeducciones, 'Clave', 'D78');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEG DE DAÑOS POR C HIPOTECARIO');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD78.Value));
        end;
        if (adoqryNominaD79.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D79');
          Ini.WriteString(vDeducciones, 'Concepto', 'DEUDORES DIVERSOS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD79.Value));
        end;
        if (adoqryNominaD80.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
          Ini.WriteString(vDeducciones, 'Clave', 'D80');
          Ini.WriteString(vDeducciones, 'Concepto', 'ISR');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD80.Value));
        end;
        if (adoqryNominaD83.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '020');
          Ini.WriteString(vDeducciones, 'Clave', 'D83');
          Ini.WriteString(vDeducciones, 'Concepto', 'INASISTENCIAS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD83.Value));
        end;
        if (adoqryNominaD84.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D84');
          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTOS VARIOS');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD84.Value));
        end;
        if (adoqryNominaD85.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D85');
          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO A CORTO PLAZO ISSSTE');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD85.Value));
        end;
        if (adoqryNominaD86.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
          Ini.WriteString(vDeducciones, 'Clave', 'D86');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINDICAL');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD86.Value));
        end;
        if (adoqryNominaD87.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '011');
          Ini.WriteString(vDeducciones, 'Clave', 'D87');
          Ini.WriteString(vDeducciones, 'Concepto', 'FONACOT');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD87.Value));
        end;
        if (adoqryNominaD88.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
          Ini.WriteString(vDeducciones, 'Clave', 'D88');
          Ini.WriteString(vDeducciones, 'Concepto', 'AHORRO SOLIDARIO');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD88.Value));
        end;
        if (adoqryNominaD89.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
          Ini.WriteString(vDeducciones, 'Clave', 'D89');
          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO HIPOTECARIO FOVISSSTE');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD89.Value));
        end;
        if (adoqryNominaD90.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '007');
          Ini.WriteString(vDeducciones, 'Clave', 'D90');
          Ini.WriteString(vDeducciones, 'Concepto', 'PENSION ALIMENTICIA');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD90.Value));
        end;
        if (adoqryNominaD91.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D91');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL INBURSA');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD91.Value));
        end;
        if (adoqryNominaD92.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D92');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE RETIRO');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD92.Value));
        end;
        if (adoqryNominaD95.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
          Ini.WriteString(vDeducciones, 'Clave', 'D95');
          Ini.WriteString(vDeducciones, 'Concepto', 'IMPUESTO 10% ISR MIGRANTES');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD95.Value));
        end;
        if (adoqryNominaD96.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
          Ini.WriteString(vDeducciones, 'Clave', 'D96');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINIDCAL STUCOBAEM');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD96.Value));
        end;
        if (adoqryNominaD99.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D99');
          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTO DEL SITCBEM');
          Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaD99.Value));
        end;
        //[nomOtrosPagos1]
        vCountOtrosPagos := 0;
//        vCampoIni := 57;
//        vCampoFin := 94;
//        for vCampoI := vCampoIni to vCampoFin do
//        begin
//          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
//          vClave := Copy(vCampoN, 2, Length(vCampoN));
//          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
//          if (vCampoV <> 0) then
//          begin
//            if dxmdDeduccionesTipo.Locate('Clave', vClave, []) then
//            begin
//              Inc(vCountDeduccion);
//              vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//              Ini.WriteString(vDeducciones, 'TipoOtroPago', dxmdDeduccionesTipoSAT.Value);
//              Ini.WriteString(vDeducciones, 'Clave', vClave);
//              Ini.WriteString(vDeducciones, 'Concepto', dxmdDeduccionesTipoConcepto.Value);
//              Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,vCampoV));
//              Ini.WriteString(vDeducciones, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN,0));
//                //SaldoAFavor=
//                //Ao=
//                //RemanenteSalFav=
//            end;
//          end;
//        end;
        if (adoqryNominaP42.Value <> 0) then
        begin
          Inc(vCountOtrosPagos);
          vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
          Ini.WriteString(vOtrosPagos, 'TipoOtroPago', '002');
          Ini.WriteString(vOtrosPagos, 'Clave', 'P42');
          Ini.WriteString(vOtrosPagos, 'Concepto', 'SUBSIDIO PARA EL EMPLEO');
          Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaP42.Value));
          Ini.WriteString(vOtrosPagos, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaSubsidioAlEmpleo.Value));
        end;

        //[nomIncapacidades1]
        //DiasIncapacidad=1
        //TipoIncapacidad=01
        //ImporteMonetario=0.00

      finally
        Ini.Free;
      end;
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqryNomina.Next;
    end;
  finally
    adoqryNomina.Close;
    ShowProgress(0,0);
    FormatSettings.DateSeparator := FDateSeparator;
  end;
end;

end.
