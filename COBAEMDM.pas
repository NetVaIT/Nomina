unit COBAEMDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  FacturaTipos;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepciones';
  cDeducciones = 'nomDeducciones';
  cFormatFloat = '0.00####';

type
  TdmCOBAEM = class(TDataModule)
    adoqryNomina: TADOQuery;
    adoqryNominaID: TFloatField;
    adoqryNominaCONOM: TWideStringField;
    adoqryNominaFormaDePago: TStringField;
    adoqryNominaSubTotal: TFloatField;
    adoqryNominaDescuento: TFloatField;
    adoqryNominaMotivoDescuento: TStringField;
    adoqryNominaTotal: TFloatField;
    adoqryNominaMetodoDePago: TStringField;
    adoqryNominaTipoDeComprobante: TStringField;
    adoqryNominaLugarExpedicion: TStringField;
    adoqryNominaEmisorRFC: TStringField;
    adoqryNominaEmisorNombre: TStringField;
    adoqryNominaEmisorRegimen: TStringField;
    adoqryNominaReceptorRFC: TWideStringField;
    adoqryNominaReceptorNombre: TWideStringField;
    adoqryNominaReceptorPais: TStringField;
    adoqryNominaConceptoValorUnitario: TFloatField;
    adoqryNominaConceptoImporte: TFloatField;
    adoqryNominaImpuestosISRRetenido: TFloatField;
    adoqryNominaComplementoNominaRegistroPatronal: TStringField;
    adoqryNominaComplementoNominaNumEmpleado: TWideStringField;
    adoqryNominaComplementoNominaCURP: TWideStringField;
    adoqryNominaComplementoNominaTipoRegimen: TStringField;
    adoqryNominaComplementoNominaFechaPago: TDateTimeField;
    adoqryNominaComplementoNominaPagoDesde: TDateTimeField;
    adoqryNominaComplementoNominaPagoHasta: TDateTimeField;
    adoqryNominaComplementoNominaNumDiasPagados: TIntegerField;
    adoqryNominaPTotalGravado: TFloatField;
    adoqryNominaPTotalExento: TFloatField;
    adoqryNominaDTotalGravado: TIntegerField;
    adoqryNominaDTotalExento: TFloatField;
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
    adoqryNominaP62: TFloatField;
    adoqryNominaP63: TFloatField;
    adoqryNominaP64: TFloatField;
    adoqryNominaP65: TFloatField;
    adoqryNominaP66: TFloatField;
    adoqryNominaP67: TFloatField;
    adoqryNominaP68: TFloatField;
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
    adoqryNominaComplementoNominaNumSeguridadSocial: TFloatField;
    adoqryNominaComplementoNominaDepartamento: TWideStringField;
    adoqryNominaComplementoNominaPuesto: TWideStringField;
    adoqryNominaComplementoNominaTipoContrato: TWideStringField;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryNominaComplementoNominaFechaInicioRelLaboral: TDateTimeField;
    adoqryNominaP69: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    FCertificado: TFECertificado;
    procedure CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
      pCDirXML: string);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils;

{$R *.dfm}

{ TdmCOBAEM }

procedure TdmCOBAEM.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI, pCDirXML: string);
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
  vP40, vP41, vP42: Double;
begin
  FDateSeparator := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '-';
  vCount := 0;
  adoqryNominaCount.Close;
  if pFiltrar then
  begin
    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
  end;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;

  adoqryNomina.Close;
  if pFiltrar then
  begin
    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
  end;
  adoqryNomina.Open;
  try

    while not adoqryNomina.Eof do
    begin
      ID := adoqryNominaComplementoNominaNumEmpleado.Value + '_' + FloatToStr(adoqryNominaID.Value);
      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaPago.Value);
      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryNominaComplementoNominaPagoDesde.Value);
      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryNominaComplementoNominaPagoHasta.Value);
//      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryNominaComplementoNominaFechaInicioRelLaboral.Value);
      INIFileName := '.' + PathDelim + pCDirINI + PathDelim + ID + '.INI';
      XMLFileName := '.' + PathDelim + pCDirXML + PathDelim + ID + '.XML';
      Ini := TIniFile.Create(INIFileName);
      try
        //[Parametros]
        Ini.WriteString('Parametros', 'Certificado', FCertificado.Ruta);
        Ini.WriteString('Parametros', 'LlavePrivada', FCertificado.LlavePrivada.Ruta);
        Ini.WriteString('Parametros', 'XMLDestino', XMLFileName);
        Ini.WriteString('Parametros', 'Bitacora', cBitacora);
        Ini.WriteString('Parametros', 'PAC', 'ECODEX');
        Ini.WriteString('Parametros', 'Mensajes', 'OFF');
        //[ECODEX]
        Ini.WriteString('ECODEX', 'Servicio', 'Prueba'); //Servicio=Prueba (cuando ya este en produccion debera usar "Produccion")
        Ini.WriteString('ECODEX', 'RFC', adoqryNominaEmisorRFC.AsString);
        Ini.WriteString('ECODEX', 'TransaccionID', FloatToStr(adoqryNominaID.Value));
        //[Comprobante]
        Ini.WriteString('Comprobante', 'Version', '3.2');
//        Ini.WriteString('Comprobante', 'Serie', '');
//        Ini.WriteString('Comprobante', 'Folio', '');
        Ini.WriteString('Comprobante', 'FormaDePago', adoqryNominaFormaDePago.AsString);
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cFormatFloat,adoqryNominaSubTotal.Value));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cFormatFloat,adoqryNominaDescuento.Value));
        Ini.WriteString('Comprobante', 'MotivoDescuento', adoqryNominaMotivoDescuento.AsString);
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cFormatFloat,adoqryNominaTotal.Value));
        Ini.WriteString('Comprobante', 'MetodoDePago', adoqryNominaMetodoDePago.AsString);
        Ini.WriteString('Comprobante', 'TipoDeComprobante', adoqryNominaTipoDeComprobante.AsString);
        Ini.WriteString('Comprobante', 'LugarExpedicion', adoqryNominaLugarExpedicion.AsString);
        //[Emisor]
        Ini.WriteString('Emisor', 'Rfc', adoqryNominaEmisorRFC.AsString);
        Ini.WriteString('Emisor', 'Nombre', adoqryNominaEmisorNombre.AsString);
        Ini.WriteString('Emisor', 'Regimen', adoqryNominaEmisorRegimen.AsString);
        //[Receptor]
        Ini.WriteString('Receptor', 'Rfc', adoqryNominaReceptorRFC.AsString);
        Ini.WriteString('Receptor', 'Nombre', adoqryNominaReceptorNombre.AsString);
        Ini.WriteString('Receptor', 'Pais', adoqryNominaReceptorPais.AsString);
        //[Concepto1]
        Ini.WriteString('Concepto1', 'Cantidad', '1');
        Ini.WriteString('Concepto1', 'Unidad', 'Servicio');
        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de Nomina');
        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cFormatFloat,adoqryNominaConceptoValorUnitario.Value));
        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cFormatFloat,adoqryNominaConceptoImporte.Value));
        //[Impuestos]
        if adoqryNominaImpuestosISRRetenido.Value <> 0 then
        begin
          Ini.WriteString('Impuestos', 'TotalImpuestosRetenidos', FormatFloat(cFormatFloat,adoqryNominaImpuestosISRRetenido.Value));
          Ini.WriteString('Impuestos', 'ISRRetenido', FormatFloat(cFormatFloat,adoqryNominaImpuestosISRRetenido.Value));
        end;
        //[ComplementoNomina]
        Ini.WriteString('ComplementoNomina', 'RegistroPatronal', adoqryNominaComplementoNominaRegistroPatronal.AsString);
        Ini.WriteString('ComplementoNomina', 'NumEmpleado', adoqryNominaComplementoNominaNumEmpleado.Value);
        Ini.WriteString('ComplementoNomina', 'CURP', adoqryNominaComplementoNominaCURP.Value);
        Ini.WriteString('ComplementoNomina', 'TipoRegimen', adoqryNominaComplementoNominaTipoRegimen.AsString);
        Ini.WriteString('ComplementoNomina', 'NumSeguridadSocial', adoqryNominaComplementoNominaNumSeguridadSocial.AsString); //FloatToStr(adoqryNominaComplementoNominaNumSeguridadSocial.Value));
        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', adoqryNominaComplementoNominaNumDiasPagados.AsString);
        Ini.WriteString('ComplementoNomina', 'Departamento', adoqryNominaComplementoNominaDepartamento.AsString);
//        Ini.WriteString('ComplementoNomina', 'CLABE', adoqryCFDICLABE.AsString);
//        Ini.WriteString('ComplementoNomina', 'Banco', adoqryCFDIBanco.AsString);
//        Ini.WriteString('ComplementoNomina', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
//        Ini.WriteString('ComplementoNomina', 'Antiguedad', adoqryCFDIAntiguedad.AsString);
        Ini.WriteString('ComplementoNomina', 'Puesto', adoqryNominaComplementoNominaPuesto.AsString);
        Ini.WriteString('ComplementoNomina', 'TipoContrato', adoqryNominaComplementoNominaTipoContrato.AsString);
//        Ini.WriteString('ComplementoNomina', 'TipoJornada', adoqryCFDITipoJornada.AsString);
        Ini.WriteString('ComplementoNomina', 'PeriodicidadPago', 'quincenal');
//        Ini.WriteString('ComplementoNomina', 'SalarioBaseCotApor', adoqryCFDISalarioBaseCotApor.AsString);
//        Ini.WriteString('ComplementoNomina', 'RiesgoPuesto', adoqryCFDIRiesgoPuesto.AsString);
//        Ini.WriteString('ComplementoNomina', 'SalarioDiarioIntegrado', adoqryCFDISalarioDiarioIntegrado.AsString);
        //[nomPercepciones]
        vCountPercepcion := 0;
        if (adoqryNominaPTotalGravado.Value <> 0) or (adoqryNominaPTotalExento.Value <> 0) then
        begin
          Ini.WriteString(cPercepciones, 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaPTotalGravado.Value));
          Ini.WriteString(cPercepciones, 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaPTotalExento.Value));
        end;
        //[nomPercepciones1]
        if (adoqryNominaP03.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P03');
          Ini.WriteString(vPercepciones, 'Concepto', 'ACTUALIZACION PERSONAL ADMINISTRATIVO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP03.Value));
        end;
        if (adoqryNominaP04.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P04');
          Ini.WriteString(vPercepciones, 'Concepto', 'CO.PE.A.');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP04.Value));
        end;
        if (adoqryNominaP05.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P05');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA PARA TITULACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP05.Value));
        end;
        if (adoqryNominaP06.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P06');
          Ini.WriteString(vPercepciones, 'Concepto', 'NIVELACION SALARIAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP06.Value));
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
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP09.Value));
        end;
        if (adoqryNominaP10.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P10');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIM. DESEMPEÑO PEROSNAL ADMTO.');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP10.Value));
        end;
        if (adoqryNominaP11.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P11');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA IMPRESIÓN DE TESIS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP11.Value));
        end;
        if (adoqryNominaP12.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P12');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYOS PARA ESTUDIOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP12.Value));
        end;
        if (adoqryNominaP13.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '010');
          Ini.WriteString(vPercepciones, 'Clave', 'P13');
          Ini.WriteString(vPercepciones, 'Concepto', 'PUNTUALIDAD Y ASISTENCIA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP13.Value));
        end;
        if (adoqryNominaP14.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P14');
          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTA NAVIDEÑA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP14.Value));
        end;
        if (adoqryNominaP15.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P15');
          Ini.WriteString(vPercepciones, 'Concepto', 'COEXA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP15.Value));
        end;
        if (adoqryNominaP16.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P16');
          Ini.WriteString(vPercepciones, 'Concepto', 'I.M.E. (QNA. 15)');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP16.Value));
        end;
        if (adoqryNominaP17.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P17');
          Ini.WriteString(vPercepciones, 'Concepto', 'DIA DEL DOCENTE y/o ADMINISTRATIVO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP17.Value));
        end;
        if (adoqryNominaP18.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '029');
          Ini.WriteString(vPercepciones, 'Clave', 'P18');
          Ini.WriteString(vPercepciones, 'Concepto', 'VALES DE DESPENSA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP18.Value));
        end;
        if (adoqryNominaP19.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P19');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ACTUACION Y PRODUCTIVIDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP19.Value));
        end;
        if (adoqryNominaP21.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P21');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO A LA SUPERACION ACADEMICA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP21.Value));
        end;
        if (adoqryNominaP22.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P22');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA P/LA ADQUISICION DE LIBROS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP22.Value));
        end;
        if (adoqryNominaP24.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P24');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO POR TITULACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP24.Value));
        end;
        if (adoqryNominaP30.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P30');
          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO MIGRANTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP30.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP40.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P40');
          Ini.WriteString(vPercepciones, 'Concepto', 'I.S.T.P. DEVUELTO A MIGRANTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP40.Value));
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
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP41.Value));
        end;
        if (adoqryNominaP42.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '017');
          Ini.WriteString(vPercepciones, 'Clave', 'P42');
          Ini.WriteString(vPercepciones, 'Concepto', 'SUBSIDIO PARA EL EMPLEO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP42.Value));
        end;
        if (adoqryNominaP43.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P43');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP43.Value));
        end;
        if (adoqryNominaP44.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P44');
          Ini.WriteString(vPercepciones, 'Concepto', 'ESTIMULO ACADEMICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP44.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP45.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P45');
          Ini.WriteString(vPercepciones, 'Concepto', 'APORTACION INST. SEG. DE RETIRO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP45.Value));
        end;
        if (adoqryNominaP46.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P46');
          Ini.WriteString(vPercepciones, 'Concepto', 'APOYO MEDICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP46.Value));
        end;
        if (adoqryNominaP49.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P49');
          Ini.WriteString(vPercepciones, 'Concepto', '12,24 O 36 % ADICIONAL (10,20 Y 25 AÑOS)');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP49.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP50.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P50');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPLEMENTO A LA ANUALIDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP50.Value));
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
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP53.Value));
        end;
        if (adoqryNominaP54.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '037');
          Ini.WriteString(vPercepciones, 'Clave', 'P54');
          Ini.WriteString(vPercepciones, 'Concepto', 'PAGO DE MARCHA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP54.Value));
        end;
        if (adoqryNominaP56.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P56');
          Ini.WriteString(vPercepciones, 'Concepto', 'ETIMULO POR AÑOS DE SERVICIO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP56.Value));
        end;
        if (adoqryNominaP57.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '019');
          Ini.WriteString(vPercepciones, 'Clave', 'P57');
          Ini.WriteString(vPercepciones, 'Concepto', 'TIEMPO EXTRA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP57.Value));
        end;
        if (adoqryNominaP58.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '035');
          Ini.WriteString(vPercepciones, 'Clave', 'P58');
          Ini.WriteString(vPercepciones, 'Concepto', 'AYUDA P/COMPRA DE LENTES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP58.Value));
        end;
        if (adoqryNominaP59.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P59');
          Ini.WriteString(vPercepciones, 'Concepto', 'CANASTILLA MATERNAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP59.Value));
        end;
        if (adoqryNominaP60.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
          Ini.WriteString(vPercepciones, 'Clave', 'P60');
          Ini.WriteString(vPercepciones, 'Concepto', 'SUELDO TABULAR');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP60.Value));
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
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP61.Value));
        end;
        if (adoqryNominaP62.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
          Ini.WriteString(vPercepciones, 'Clave', 'P62');
          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA VACACIONAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP62.Value));
        end;
        if (adoqryNominaP63.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
          Ini.WriteString(vPercepciones, 'Clave', 'P63');
          Ini.WriteString(vPercepciones, 'Concepto', 'AGINALDO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP63.Value));
        end;
        if (adoqryNominaP64.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P64');
          Ini.WriteString(vPercepciones, 'Concepto', 'MATERIAL DIDACTICO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP64.Value));
        end;
        if (adoqryNominaP65.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P65');
          Ini.WriteString(vPercepciones, 'Concepto', 'PENSION ALIMENTICIA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP65.Value));
        end;
        if (adoqryNominaP66.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', 'P66');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION VARIABLE');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP66.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryNominaP67.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '022');
          Ini.WriteString(vPercepciones, 'Clave', 'P67');
          Ini.WriteString(vPercepciones, 'Concepto', 'COMPENSACION POR ANTIGÜEDAD');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP67.Value));
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
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP68.Value));
        end;
        // Normal
        if (adoqryNominaP69.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
          Ini.WriteString(vPercepciones, 'Clave', 'P69');
          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP69.Value));
        end;

        //Jubilacion
//        if (adoqryNominaP69G.Value <> 0) OR (adoqryNominaP69E.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
//          Ini.WriteString(vPercepciones, 'Clave', 'P69');
//          Ini.WriteString(vPercepciones, 'Concepto', 'PAGOS POR SEPARACION');
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP69G.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP69E.Value));
//        end;

        // Ingresos mixtos
        //'042' AS P042Clave, 'Percepciones' AS P042Concepto, N.TOTPER / 2 AS P042ImporteGravado, 0 AS P042ImporteExento,
        //'041' AS P041Clave, 'Percepciones' AS P041Concepto, N.TOTPER / 2 * - 1 AS P041ImporteGravado, 0 AS P041ImporteExento,
        vP42:= adoqryNominaTOTPER.Value/2;
        vP41:= (adoqryNominaTOTPER.Value/2)*-1;
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '042');
          Ini.WriteString(vPercepciones, 'Clave', '000');
          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS MIXTOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,vP42));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
          Ini.WriteString(vPercepciones, 'Clave', '000');
          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS FEDERALES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,vP41));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
//        //[nomPercepciones41]
//        if (adoqryNominaP041ImporteGravado.Value <> 0) OR (adoqryNominaP041ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP041Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP041Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP041ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP041ImporteExento.Value));
//        end;
//        //[nomPercepciones42]
//        if (adoqryNominaP042ImporteGravado.Value <> 0) OR (adoqryNominaP042ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '042');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP042Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP042Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,adoqryNominaP042ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaP042ImporteExento.Value));
//        end;
        //[nomDeducciones]
        vCountDeduccion := 0;
        if (adoqryNominaDTotalGravado.Value <> 0) or (adoqryNominaDTotalExento.Value <> 0) then
        begin
          Ini.WriteString('nomDeducciones', 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaDTotalGravado.Value));
          Ini.WriteString('nomDeducciones', 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaDTotalExento.Value));
        end;
        //[nomDeducciones1]
        if (adoqryNominaD26.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
          Ini.WriteString(vDeducciones, 'Clave', 'D26');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE SALUD');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD26.Value));
        end;
        if (adoqryNominaD27.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
          Ini.WriteString(vDeducciones, 'Clave', 'D27');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE INVALIDEZ Y VIDA');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD27.Value));
        end;
        if (adoqryNominaD28.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '005');
          Ini.WriteString(vDeducciones, 'Clave', 'D28');
          Ini.WriteString(vDeducciones, 'Concepto', 'SERVICIOS SOCIALES Y CULTURALES(ISSSTE VIVIENDA)');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD28.Value));
        end;
        if (adoqryNominaD29.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
          Ini.WriteString(vDeducciones, 'Clave', 'D29');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEG. D RET. Y CES. EN E. AV. Y .V');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD29.Value));
        end;
        if (adoqryNominaD32.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D32');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL METLIFE');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD32.Value));
        end;
        if (adoqryNominaD34.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D34');
          Ini.WriteString(vDeducciones, 'Concepto', 'EDITORIAL (DIMAS EDICIONES)');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD34.Value));
        end;
        if (adoqryNominaD35.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D35');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD35.Value));
        end;
        if (adoqryNominaD36.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D36');
          Ini.WriteString(vDeducciones, 'Concepto', 'E.T.E. S.A. DE C.V.');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD36.Value));
        end;
        if (adoqryNominaD37.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D37');
          Ini.WriteString(vDeducciones, 'Concepto', 'SIPRESTO');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD37.Value));
        end;
        if (adoqryNominaD70.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D70');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA DE APOYO POR DECESO 1 %');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD70.Value));
        end;
        if (adoqryNominaD71.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D71');
          Ini.WriteString(vDeducciones, 'Concepto', 'APOYO POR JUBILACION 1%');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD71.Value));
        end;
        if (adoqryNominaD72.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D72');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE AUTOS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD72.Value));
        end;
        if (adoqryNominaD73.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D73');
          Ini.WriteString(vDeducciones, 'Concepto', 'IMPULSORA PROMOBIEN (FAMSA)');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD73.Value));
        end;
        if (adoqryNominaD75.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D75');
          Ini.WriteString(vDeducciones, 'Concepto', 'PREVISION DE SERVICIOS FUNERARIOS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD75.Value));
        end;
        if (adoqryNominaD78.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
          Ini.WriteString(vDeducciones, 'Clave', 'D78');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEG. DE DAÑOS POR C. HIPOTECARIO');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD78.Value));
        end;
        if (adoqryNominaD79.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D79');
          Ini.WriteString(vDeducciones, 'Concepto', 'DEUDORES DIVERSOS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD79.Value));
        end;
        if (adoqryNominaD80.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
          Ini.WriteString(vDeducciones, 'Clave', 'D80');
          Ini.WriteString(vDeducciones, 'Concepto', 'ISR');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD80.Value));
        end;
        if (adoqryNominaD83.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '020');
          Ini.WriteString(vDeducciones, 'Clave', 'D83');
          Ini.WriteString(vDeducciones, 'Concepto', 'INASISTENCIAS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD83.Value));
        end;
        if (adoqryNominaD84.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D84');
          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTOS VARIOS');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD84.Value));
        end;
        if (adoqryNominaD85.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D85');
          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO A CORTO PLAZO ISSSTE');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD85.Value));
        end;
        if (adoqryNominaD86.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
          Ini.WriteString(vDeducciones, 'Clave', 'D86');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINDICAL');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD86.Value));
        end;
        if (adoqryNominaD87.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '011');
          Ini.WriteString(vDeducciones, 'Clave', 'D87');
          Ini.WriteString(vDeducciones, 'Concepto', 'FONACOT');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD87.Value));
        end;
        if (adoqryNominaD88.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
          Ini.WriteString(vDeducciones, 'Clave', 'D88');
          Ini.WriteString(vDeducciones, 'Concepto', 'AHORRO SOLIDARIO');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD88.Value));
        end;
        if (adoqryNominaD89.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
          Ini.WriteString(vDeducciones, 'Clave', 'D89');
          Ini.WriteString(vDeducciones, 'Concepto', 'PRESTAMO HIPOTECARIO FOVISSSTE');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD89.Value));
        end;
        if (adoqryNominaD90.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '007');
          Ini.WriteString(vDeducciones, 'Clave', 'D90');
          Ini.WriteString(vDeducciones, 'Concepto', 'PENSION ALIMENTICIA');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD90.Value));
        end;
        if (adoqryNominaD91.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D91');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO INDIVIDUAL INBURSA');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD91.Value));
        end;
        if (adoqryNominaD92.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D92');
          Ini.WriteString(vDeducciones, 'Concepto', 'SEGURO DE RETIRO');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD92.Value));
        end;
        if (adoqryNominaD95.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
          Ini.WriteString(vDeducciones, 'Clave', 'D95');
          Ini.WriteString(vDeducciones, 'Concepto', 'IMPUESTO 10% (ISR MIGRANTES');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD95.Value));
        end;
        if (adoqryNominaD96.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
          Ini.WriteString(vDeducciones, 'Clave', 'D96');
          Ini.WriteString(vDeducciones, 'Concepto', 'CUOTA SINIDCAL STUCOBAEM');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD96.Value));
        end;
        if (adoqryNominaD99.Value <> 0) then
        begin
          Inc(vCountDeduccion);
          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
          Ini.WriteString(vDeducciones, 'Clave', 'D99');
          Ini.WriteString(vDeducciones, 'Concepto', 'DESCUENTO DEL SITCBEM');
          Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,adoqryNominaD99.Value));
        end;
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

//        //[nomPercepciones1]
//        if (adoqryNominaP001ImporteGravado.Value <> 0) OR (adoqryNominaP001ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '001');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP001Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP001Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP001ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP001ImporteExento.Value));
//        end;
//        //[nomPercepciones2]
//        if (adoqryNominaP002ImporteGravado.Value <> 0) OR (adoqryNominaP002ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP002Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP002Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP002ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP002ImporteExento.Value));
//        end;
////        //[nomPercepciones4]
////        if (adoqryNominaP004ImporteGravado.Value <> 0) OR (adoqryNominaP004ImporteExento.Value <> 0) then
////        begin
////          Inc(vCountPercepcion);
////          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
////          Ini.WriteString(vPercepciones, 'TipoPercepcion', '004');
////          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP004Clave.AsString);
////          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP004Concepto.AsString);
////          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP004ImporteGravado.Value));
////          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP004ImporteExento.Value));
////        end;
//        //[nomPercepciones10]
//        if (adoqryNominaP010ImporteGravado.Value <> 0) OR (adoqryNominaP010ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '010');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP010Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP010Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP010ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP010ImporteExento.Value));
//        end;
//        //[nomPercepciones17]
//        if (adoqryNominaP017ImporteGravado.Value <> 0) OR (adoqryNominaP017ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '017');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP017Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP017Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP017ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP017ImporteExento.Value));
//        end;
//        //[nomPercepciones21]
//        if (adoqryNominaP021ImporteGravado.Value <> 0) OR (adoqryNominaP021ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP021Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP021Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP021ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP021ImporteExento.Value));
//        end;
//        //[nomPercepciones22]
//        if (adoqryNominaP022ImporteGravado.Value <> 0) OR (adoqryNominaP022ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '022');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP022Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP022Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP022ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP022ImporteExento.Value));
//        end;
//        //[nomPercepciones23]
//        if (adoqryNominaP023ImporteGravado.Value <> 0) OR (adoqryNominaP023ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '023');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP023Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP023Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP023ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP023ImporteExento.Value));
//        end;
//        //[nomPercepciones29]
//        if (adoqryNominaP029ImporteGravado.Value <> 0) OR (adoqryNominaP029ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '029');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP029Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP029Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP029ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP029ImporteExento.Value));
//        end;
//        //[nomPercepciones35]
//        if (adoqryNominaP035ImporteGravado.Value <> 0) OR (adoqryNominaP035ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '035');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP035Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP035Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP035ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP035ImporteExento.Value));
//        end;
//        //[nomPercepciones37]
//        if (adoqryNominaP037ImporteGravado.Value <> 0) OR (adoqryNominaP037ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '037');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP037Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP037Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP037ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP037ImporteExento.Value));
//        end;
//        //[nomPercepciones38]
//        if (adoqryNominaP038ImporteGravado.Value <> 0) OR (adoqryNominaP038ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP038Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP038Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP038ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP038ImporteExento.Value));
//        end;
//        //[nomPercepciones41]
//        if (adoqryNominaP041ImporteGravado.Value <> 0) OR (adoqryNominaP041ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP041Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP041Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP041ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP041ImporteExento.Value));
//        end;
//        //[nomPercepciones38]
//        if (adoqryNominaP042ImporteGravado.Value <> 0) OR (adoqryNominaP042ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountPercepcion);
//          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
//          Ini.WriteString(vPercepciones, 'TipoPercepcion', '042');
//          Ini.WriteString(vPercepciones, 'Clave', adoqryNominaP042Clave.AsString);
//          Ini.WriteString(vPercepciones, 'Concepto', adoqryNominaP042Concepto.AsString);
//          Ini.WriteString(vPercepciones, 'ImporteGravado', FloatToStr(adoqryNominaP042ImporteGravado.Value));
//          Ini.WriteString(vPercepciones, 'ImporteExento', FloatToStr(adoqryNominaP042ImporteExento.Value));
//        end;
//        //[nomDeducciones]
//        vCountDeduccion := 0;
//        if (adoqryNominaDTotalGravado.Value <> 0) or (adoqryNominaDTotalExento.Value <> 0) then
//        begin
//          Ini.WriteString('nomDeducciones', 'TotalGravado', FloatToStr(adoqryNominaDTotalGravado.Value));
//          Ini.WriteString('nomDeducciones', 'TotalExento', FloatToStr(adoqryNominaDTotalExento.Value));
//        end;
//        //[nomDeducciones1]
//        if (adoqryNominaD001ImporteGravado.Value <> 0) or (adoqryNominaD001ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '001');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD001Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD001Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD001ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD001ImporteExento.Value));
//        end;
//        //[nomDeducciones2]
//        if (adoqryNominaD002ImporteGravado.Value <> 0) or (adoqryNominaD002ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '002');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD002Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD002Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD002ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD002ImporteExento.Value));
//        end;
//        //[nomDeducciones3]
//        if (adoqryNominaD003ImporteGravado.Value <> 0) or (adoqryNominaD003ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '003');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD003Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD003Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD003ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD003ImporteExento.Value));
//        end;
//        //[nomDeducciones4]
//        if (adoqryNominaD004ImporteGravado.Value <> 0) or (adoqryNominaD004ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '004');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD004Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD004Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD004ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD004ImporteExento.Value));
//        end;
//        //[nomDeducciones5]
//        if (adoqryNominaD005ImporteGravado.Value <> 0) or (adoqryNominaD005ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '005');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD005Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD005Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD005ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD005ImporteExento.Value));
//        end;
//        //[nomDeducciones7]
//        if (adoqryNominaD007ImporteGravado.Value <> 0) or (adoqryNominaD007ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '007');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD007Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD007Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD007ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD007ImporteExento.Value));
//        end;
//        //[nomDeducciones10]
//        if (adoqryNominaD010ImporteGravado.Value <> 0) or (adoqryNominaD010ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '010');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD010Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD010Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD010ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD010ImporteExento.Value));
//        end;
//        //[nomDeducciones11]
//        if (adoqryNominaD011ImporteGravado.Value <> 0) or (adoqryNominaD011ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '011');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD011Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD011Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD011ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD011ImporteExento.Value));
//        end;
//        //[nomDeducciones19]
//        if (adoqryNominaD019ImporteGravado.Value <> 0) or (adoqryNominaD019ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '019');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD019Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD019Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD019ImporteGravado.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD019ImporteExento.Value));
//        end;
//        //[nomDeducciones20]
//        if (adoqryNominaD020ImporteGravado.Value <> 0) or (adoqryNominaD020ImporteExento.Value <> 0) then
//        begin
//          Inc(vCountDeduccion);
//          vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
//          Ini.WriteString(vDeducciones, 'TipoDeduccion', '020');
//          Ini.WriteString(vDeducciones, 'Clave', adoqryNominaD020Clave.AsString);
//          Ini.WriteString(vDeducciones, 'Concepto', adoqryNominaD020Concepto.AsString);
//          Ini.WriteString(vDeducciones, 'ImporteGravado', FloatToStr(adoqryNominaD020ImporteExento.Value));
//          Ini.WriteString(vDeducciones, 'ImporteExento', FloatToStr(adoqryNominaD020ImporteExento.Value));
//        end;
//procedure TdmCOBAEM.CrearINI2;
//var
//  Ini: TIniFile;
//  INIFileName: String;
//  XMLFileName: String;
//  vCount: Integer;
//  NoEmpleado: String;
//  vFechaPago: String;
//  vPagoDesde: String;
//  vPagoHasta: String;
//  vPercepcionTotalGravado: Double;
//  vPercepcionTotalExento: Double;
//  vDeduccionesTotalGravado: Double;
//  vDeduccionesTotalExento: Double;
//  FDateSeparator: Char;
//begin
//  FDateSeparator := FormatSettings.DateSeparator;
//  FormatSettings.DateSeparator:= '-';
//  vCount := 0;
//  adoqryPDS2015.Open;
//  try
//    while not adoqryPDS2015.Eof do
//    begin
//      NoEmpleado := adoqryPDS2015CLAVE_PLZ.Value + '_' + adoqryPDS2015NUMERO_PLZ.Value;
//      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryPDS2015FechaPago.Value);
//      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryPDS2015PagoDesde.Value);
//      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryPDS2015PagoHasta.Value);
//      INIFileName := '.' + PathDelim + cDirINI + PathDelim + NoEmpleado + '_' + FloatToStr(adoqryPDS2015ID.Value) + '.INI';
//      XMLFileName := '.' + PathDelim + cDirXML + PathDelim + NoEmpleado + '_' + FloatToStr(adoqryPDS2015ID.Value) + '.XML';
//      Ini := TIniFile.Create(INIFileName);
//      try
//        //[Parametros]
//        Ini.WriteString('Parametros', 'Certificado', cCertificado);
//        Ini.WriteString('Parametros', 'LlavePrivada', cLlave);
//        Ini.WriteString('Parametros', 'XMLDestino', XMLFileName);
//        Ini.WriteString('Parametros', 'Bitacora', cBitacora);
////        Ini.WriteString('Parametros', 'PAC', 'ECODEX');
////        Ini.WriteString('Parametros', 'Mensajes', 'OFF');
//        //[ECODEX]
////        Ini.WriteString('ECODEX', 'Servicio', 'Prueba'); //Servicio=Prueba (cuando ya este en produccion debera usar "Produccion")
////        Ini.WriteString('ECODEX', 'RFC', 'AAA010101AAA');
////        Ini.WriteString('ECODEX', 'TransaccionID', FloatToStr(adoqryPDS2015ID.Value));
//        //[Comprobante]
//        Ini.WriteString('Comprobante', 'Version', '3.2');
////        Ini.WriteString('Comprobante', 'Serie', '');
////        Ini.WriteString('Comprobante', 'Folio', '');
//        Ini.WriteString('Comprobante', 'FormaDePago', 'Pago en una sola exhibición');
//        Ini.WriteString('Comprobante', 'SubTotal', FloatToStr(adoqryPDS2015TOTPER.Value));
//        Ini.WriteString('Comprobante', 'Descuento', FloatToStr(adoqryPDS2015D26.Value));
//        Ini.WriteString('Comprobante', 'MotivoDescuento', 'Deducciones nomina');
//        Ini.WriteString('Comprobante', 'Total', FloatToStr(adoqryPDS2015TOTLIQ.Value));
//        Ini.WriteString('Comprobante', 'MetodoDePago', '01,02');
//        Ini.WriteString('Comprobante', 'TipoDeComprobante', 'egreso');
//        Ini.WriteString('Comprobante', 'LugarExpedicion', 'Morelia, Michoacán');
//        //[Emisor]
//        Ini.WriteString('Emisor', 'Rfc', 'AAA010101AAA');
//        Ini.WriteString('Emisor', 'Regimen', 'Regimen General de Ley');
//        //[Receptor]
//        Ini.WriteString('Receptor', 'Rfc', adoqryPDS2015FILIACION.Value);
//        Ini.WriteString('Receptor', 'Nombre', adoqryPDS2015NOMBRE.Value);
//        Ini.WriteString('Receptor', 'Pais', 'México');
//        //[Concepto1]
//        Ini.WriteString('Concepto1', 'Cantidad', '1');
//        Ini.WriteString('Concepto1', 'Unidad', 'Servicio');
//        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de Nomina');
//        Ini.WriteString('Concepto1', 'ValorUnitario', FloatToStr(adoqryPDS2015TOTPER.Value));
//        Ini.WriteString('Concepto1', 'Importe', FloatToStr(adoqryPDS2015TOTPER.Value));
//        //[Impuestos]
//        if adoqryPDS2015D80.Value <> 0 then
//        begin
//          Ini.WriteString('Impuestos', 'TotalImpuestosRetenidos', FloatToStr(adoqryPDS2015D80.Value));
//          Ini.WriteString('Impuestos', 'ISRRetenido', FloatToStr(adoqryPDS2015D80.Value));
//        end;
//        //[ComplementoNomina]
//        Ini.WriteString('ComplementoNomina', 'RegistroPatronal', cRegistroPatronal);
//        Ini.WriteString('ComplementoNomina', 'NumEmpleado', NoEmpleado);
//
//        Ini.WriteString('ComplementoNomina', 'CURP', 'OABJ121212HJCVRN00');
//
//        Ini.WriteString('ComplementoNomina', 'TipoRegimen', adoqryPDS2015TIPONOMINA.Value);
//        Ini.WriteString('ComplementoNomina', 'NumSeguridadSocial', '');
//
//        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
//        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
//        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
//        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', '15');
//
//        Ini.WriteString('ComplementoNomina', 'PeriodicidadPago', 'quincenal');
//        vPercepcionTotalGravado := adoqryPDS2015P60.Value +adoqryPDS2015P18.Value;
//        vPercepcionTotalExento := adoqryPDS2015P18.Value + adoqryPDS2015P13.Value;
//        //[nomPercepciones]
//        if (vPercepcionTotalGravado <> 0) or (vPercepcionTotalExento <> 0) then
//        begin
//          Ini.WriteString('nomPercepciones', 'TotalGravado', FloatToStr(vPercepcionTotalGravado));
//          Ini.WriteString('nomPercepciones', 'TotalExento', FloatToStr(vPercepcionTotalExento));
//        end;
//        //[nomPercepciones1]
//        if adoqryPDS2015P60.Value <> 0 then
//        begin
//          Ini.WriteString('nomPercepciones1', 'TipoPercepcion', '001');
//          Ini.WriteString('nomPercepciones1', 'Clave', 'P60');
//          Ini.WriteString('nomPercepciones1', 'Concepto', 'Sueldo');
//          Ini.WriteString('nomPercepciones1', 'ImporteGravado', FloatToStr(adoqryPDS2015P60.Value));
//          Ini.WriteString('nomPercepciones1', 'ImporteExento', '0.00');
//        end;
//        //[nomPercepciones7]
//        if adoqryPDS2015P18.Value <> 0 then
//        begin
//          Ini.WriteString('nomPercepciones7', 'TipoPercepcion', '007');
//          Ini.WriteString('nomPercepciones7', 'Clave', 'P18');
//          Ini.WriteString('nomPercepciones7', 'Concepto', 'Vales de despensa');
//          Ini.WriteString('nomPercepciones7', 'ImporteGravado', '0.00');
//          Ini.WriteString('nomPercepciones7', 'ImporteExento', FloatToStr(adoqryPDS2015P18.Value));
//        end;
//        //[nomPercepciones10]
//        if adoqryPDS2015P13.Value <> 0 then
//        begin
//          Ini.WriteString('nomPercepciones10', 'TipoPercepcion', '010');
//          Ini.WriteString('nomPercepciones10', 'Clave', 'P13');
//          Ini.WriteString('nomPercepciones10', 'Concepto', 'Puntualidad y asistencia');
//          Ini.WriteString('nomPercepciones10', 'ImporteGravado', '0.00');
//          Ini.WriteString('nomPercepciones10', 'ImporteExento', FloatToStr(adoqryPDS2015P13.Value));
//        end;
//        //[nomPercepciones22]
//        if adoqryPDS2015P67.Value <> 0 then
//        begin
//          Ini.WriteString('nomPercepciones22', 'TipoPercepcion', '022');
//          Ini.WriteString('nomPercepciones22', 'Clave', 'P67');
//          Ini.WriteString('nomPercepciones22', 'Concepto', 'Prima de antigüedad');
//          Ini.WriteString('nomPercepciones22', 'ImporteGravado', FloatToStr(adoqryPDS2015P67.Value));
//          Ini.WriteString('nomPercepciones22', 'ImporteExento', '0.00');
//        end;
//        vDeduccionesTotalGravado := 0;
//        vDeduccionesTotalExento := adoqryPDS2015D26.Value + adoqryPDS2015D80.Value;
//        //[nomDeducciones]
//        if (vPercepcionTotalGravado <> 0) or (vPercepcionTotalExento <> 0) then
//        begin
//          Ini.WriteString('nomDeducciones', 'TotalGravado', FloatToStr(vDeduccionesTotalGravado));
//          Ini.WriteString('nomDeducciones', 'TotalExento', FloatToStr(vDeduccionesTotalExento));
//        end;
//        //[nomDeducciones1]
//        if adoqryPDS2015D26.Value <> 0 then
//        begin
//          Ini.WriteString('nomDeducciones1', 'TipoDeduccion', '001');
//          Ini.WriteString('nomDeducciones1', 'Clave', 'D26');
//          Ini.WriteString('nomDeducciones1', 'Concepto', 'Seguro de Salud');
//          Ini.WriteString('nomDeducciones1', 'ImporteGravado', '0.00');
//          Ini.WriteString('nomDeducciones1', 'ImporteExento', FloatToStr(adoqryPDS2015D26.Value));
//        end;
//        //[nomDeducciones2]
//        if adoqryPDS2015D80.Value <> 0 then
//        begin
//          Ini.WriteString('nomDeducciones2', 'TipoDeduccion', '002');
//          Ini.WriteString('nomDeducciones2', 'Clave', 'D80');
//          Ini.WriteString('nomDeducciones2', 'Concepto', 'ISR');
//          Ini.WriteString('nomDeducciones2', 'ImporteGravado', '0.00');
//          Ini.WriteString('nomDeducciones2', 'ImporteExento', FloatToStr(adoqryPDS2015D80.Value));
//        end;
//      finally
//       Ini.Free;
//      end;
//      Inc(vCount);
//      ShowProgress(vCount,10);
//      adoqryPDS2015.Next;
//    end;
//  finally
//    adoqryPDS2015.Close;
//    FormatSettings.DateSeparator := FDateSeparator;
//  end;
//end;

end.
