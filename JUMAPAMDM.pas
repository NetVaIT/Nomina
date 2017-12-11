unit JUMAPAMDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  FacturaTipos, dxmdaset, System.StrUtils;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepcion';
  cDeducciones = 'nomDeduccion';
  cOtrosPagos = 'nomOtrosPagos';
  cCFDI_ImporteMXN = '0.00';

type
  TdmJUMAPAM = class(TDataModule)
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryNomina: TADOQuery;
    dxmdPercepcionesTipo: TdxMemData;
    dxmdPercepcionesTipoClave: TWideStringField;
    dxmdPercepcionesTipoConcepto: TWideStringField;
    dxmdPercepcionesTipoExento: TBooleanField;
    dxmdPercepcionesTipoGravado: TBooleanField;
    dxmdPercepcionesTipoSAT: TWideStringField;
    adoqPercepcionesTipo: TADOQuery;
    dxmdDeduccionesTipo: TdxMemData;
    dxmdDeduccionesTipoClave: TWideStringField;
    dxmdDeduccionesTipoConcepto: TWideStringField;
    dxmdDeduccionesTipoSAT: TWideStringField;
    adoqDeduccionesTipo: TADOQuery;
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
    adoqryNominaHORAS_EXTRAS_DIAS: TFloatField;
    adoqryNominaTIEMPO_EXTRA_DOBLE: TFloatField;
    adoqryNominaTIEMPO_EXTRA_TRIPLE: TFloatField;
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
    adoqryNominanomReceptorNumEmpleado: TFloatField;
    adoqryNominanomReceptorDepartamento: TWideStringField;
    adoqryNominanomReceptorPuesto: TWideStringField;
    adoqryNominanomReceptorRiesgoPuesto: TStringField;
    adoqryNominanomReceptorPeriodicidadPago: TWideStringField;
    adoqryNominanomReceptorClaveEntFed: TWideStringField;
    adoqryNominanomPercepcionesTotalSueldos: TFloatField;
    adoqryNominanomPercepcionesTotalGravado: TFloatField;
    adoqryNominanomPercepcionesTotalExento: TFloatField;
    adoqryNominanomDeduccionesTotalOtrasDeducciones: TFloatField;
    adoqryNominanomDeduccionesTotalImpuestosRetenidos: TFloatField;
    adoqryNominaFloatField1: TFloatField;
    adoqryNominaFloatField2: TFloatField;
    adoqryNominaFloatField3: TFloatField;
    adoqryNominaFloatField4: TFloatField;
    adoqryNominaFloatField6: TFloatField;
    adoqryNominaFloatField7: TFloatField;
    adoqryNominaFloatField8: TFloatField;
    adoqryNominaFloatField9: TFloatField;
    adoqryNominaFloatField09A: TFloatField;
    adoqryNominaFloatField10E: TFloatField;
    adoqryNominaFloatField10G: TFloatField;
    adoqryNominaFloatField11: TFloatField;
    adoqryNominaFloatField12: TFloatField;
    adoqryNominaFloatField13: TFloatField;
    adoqryNominaFloatField14: TFloatField;
    adoqryNominaFloatField15: TFloatField;
    adoqryNominaFloatField16: TFloatField;
    adoqryNominaFloatField17E: TFloatField;
    adoqryNominaFloatField17G: TFloatField;
    adoqryNominaFloatField18E: TFloatField;
    adoqryNominaFloatField18G: TFloatField;
    adoqryNominaFloatField19E: TFloatField;
    adoqryNominaFloatField19G: TFloatField;
    adoqryNominaFloatField20: TFloatField;
    adoqryNominaFloatField20A: TFloatField;
    adoqryNominaFloatField20D: TFloatField;
    adoqryNominaFloatField21E: TFloatField;
    adoqryNominaFloatField21G: TFloatField;
    adoqryNominaFloatField22: TFloatField;
    adoqryNominaFloatField29: TFloatField;
    adoqryNominaFloatField30E: TFloatField;
    adoqryNominaFloatField30G: TFloatField;
    adoqryNominaFloatField30A: TFloatField;
    adoqryNominaFloatField33: TFloatField;
    adoqryNominaFloatField40: TFloatField;
    adoqryNominaFloatField41: TFloatField;
    adoqryNominaFloatField45: TFloatField;
    adoqryNominaFloatField46: TFloatField;
    adoqryNominaFloatField49A: TFloatField;
    adoqryNominaFloatField67D: TFloatField;
    adoqryNominaFloatField67E: TFloatField;
    adoqryNominaFloatField67F: TFloatField;
    adoqryNominaFloatField51: TFloatField;
    adoqryNominaFloatField52: TFloatField;
    adoqryNominaFloatField53: TFloatField;
    adoqryNominaFloatField53A: TFloatField;
    adoqryNominaFloatField53B: TFloatField;
    adoqryNominaFloatField53C: TFloatField;
    adoqryNominaFloatField60: TFloatField;
    adoqryNominaFloatField60C: TFloatField;
    adoqryNominaFloatField60D: TFloatField;
    adoqryNominaFloatField60F: TFloatField;
    adoqryNominaFloatField61: TFloatField;
    adoqryNominaFloatField64: TFloatField;
    adoqryNominaFloatField65: TFloatField;
    adoqryNominaFloatField67A: TFloatField;
    adoqryNominaFloatField67B: TFloatField;
    adoqryNominaFloatField69: TFloatField;
    adoqryNominaFloatField72: TFloatField;
    adoqryNominaFloatField73: TFloatField;
    adoqryNominaFloatField76: TFloatField;
    adoqryNominaFloatField77: TFloatField;
    adoqryNominaFloatField99: TFloatField;
    adoqryNominaFloatField51A: TFloatField;
    adoqryNominaFloatField999: TFloatField;
    adoqryNominaTOTAL_PERCEPCIONES: TFloatField;
    adoqryNominaTOTAL_DEDUCCIONES: TFloatField;
    adoqryNominaTOTAL_PAGADO: TFloatField;
    adoqryNominaPeriodoMes: TIntegerField;
    adoqryNominaPeriodoAnio: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CargarTipos;
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

{ TdmJUMAPAM }

function PreparaCadena(Origen, Justifica, Relleno: string; Longitud: integer): String;
var
  Falta : integer;
  Nueva : string;
begin
  if Length(Origen) < Longitud then
  begin
    Falta := Longitud - Length(Origen);
    if Justifica = 'I' then
      Nueva := Origen + DupeString(Relleno,Falta);
    if Justifica = 'D' then
      Nueva := DupeString(Relleno,Falta) + Origen;
  end
  else
    Nueva := Copy(Origen,1, Longitud);
  Result := Nueva;
end;


procedure TdmJUMAPAM.CargarTipos;
begin
  // Catalogo Percepciones
  adoqPercepcionesTipo.Close;
  adoqPercepcionesTipo.Open;
  try
    dxmdPercepcionesTipo.LoadFromDataSet(adoqPercepcionesTipo);
  finally
    adoqPercepcionesTipo.Close;
  end;
  // Catalogo Deducciones
  adoqDeduccionesTipo.Close;
  adoqDeduccionesTipo.Open;
  try
    dxmdDeduccionesTipo.LoadFromDataSet(adoqDeduccionesTipo);
  finally
    adoqDeduccionesTipo.Close;
  end;
end;

procedure TdmJUMAPAM.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
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
//  vMontoRecursoPropio: Extended;
  vHEDobles: Extended;

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
      ID := FloatToStr(adoqryNominanomReceptorNumEmpleado.Value) + '_' + FloatToStr(adoqryNominaID.Value);
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
        {$IFDEF DEBUG}

        {$ELSE}
          Ini.WriteString('nomEmisor', 'OrigenRecurso', 'IP');
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
        Ini.WriteString('nomReceptor', 'NumEmpleado', FloatToStr(adoqryNominanomReceptorNumEmpleado.Value));
        Ini.WriteString('nomReceptor', 'Departamento', Remplazar(adoqryNominanomReceptorDepartamento.AsString));
        Ini.WriteString('nomReceptor', 'Puesto', Remplazar(adoqryNominanomReceptorPuesto.AsString));
        Ini.WriteString('nomReceptor', 'RiesgoPuesto', adoqryNominanomReceptorRiesgoPuesto.AsString);
        Ini.WriteString('nomReceptor', 'PeriodicidadPago', adoqryNominanomReceptorPeriodicidadPago.AsString);
//        Ini.WriteString('nomReceptor', 'Banco', adoqryNominanomEmisorBanco.AsString);
//        Ini.WriteString('nomReceptor', 'CuentaBancaria', adoqryNominanomEmisorCuentaBancaria.AsString);
        Ini.WriteString('nomReceptor', 'SalarioBaseCotApor', '0.00');
        Ini.WriteString('nomReceptor', 'SalarioDiarioIntegrado', '0.00');
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
        vCampoIni := 50;
        vCampoFin := 79;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
          vClave := PreparaCadena(adoqryNomina.Fields[vCampoI].FieldName, 'D', '0', 3);
          if (vCampoV <> 0) then
          begin
            if dxmdPercepcionesTipo.Locate('Clave', vCampoN, []) then
            begin
              Inc(vCountPercepcion);
              vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
              Ini.WriteString(vPercepciones, 'TipoPercepcion', dxmdPercepcionesTipoSAT.Value);
              Ini.WriteString(vPercepciones, 'Clave', vClave);
              Ini.WriteString(vPercepciones, 'Concepto', Remplazar(dxmdPercepcionesTipoConcepto.AsString));
              vCampoGravado := dxmdPercepcionesTipoGravado.Value;
              vCampoExento := dxmdPercepcionesTipoExento.Value;
              if vCampoGravado then
                Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,vCampoV))
              else
                Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
              if vCampoExento then
                Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,vCampoV))
              else
                Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
              //ValorMercado=
              //PrecioAlOtorgarse=
              //HorasExtra1Dias=
              //HorasExtra1TipoHoras=
              //HorasExtra1HorasExtra=
              //HorasExtra1ImportePagado=
            end;
          end;
        end;
        if (adoqryNominaFloatField10G.Value <> 0) or (adoqryNominaFloatField10E.Value <> 0) then
        begin
          vHEDobles := adoqryNominaFloatField10G.Value + adoqryNominaFloatField10E.Value;
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '019');
          Ini.WriteString(vPercepciones, 'Clave', '010');
          Ini.WriteString(vPercepciones, 'Concepto', 'HORAS EXTRAS DOBLES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField10G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField10E.Value));
          Ini.WriteString(vPercepciones, 'HorasExtra1Dias', FloatToStr(adoqryNominaHORAS_EXTRAS_DIAS.Value));
          Ini.WriteString(vPercepciones, 'HorasExtra1TipoHoras', '01');
          Ini.WriteString(vPercepciones, 'HorasExtra1HorasExtra', FloatToStr(adoqryNominaTIEMPO_EXTRA_DOBLE.Value));
          Ini.WriteString(vPercepciones, 'HorasExtra1ImportePagado', FormatFloat(cCFDI_ImporteMXN, vHEDobles));
        end;
        if (adoqryNominaFloatField11.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '019');
          Ini.WriteString(vPercepciones, 'Clave', '011');
          Ini.WriteString(vPercepciones, 'Concepto', 'HORAS EXTRAS TRIPLE');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField11.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
          Ini.WriteString(vPercepciones, 'HorasExtra1Dias', FloatToStr(adoqryNominaHORAS_EXTRAS_DIAS.Value));
          Ini.WriteString(vPercepciones, 'HorasExtra1TipoHoras', '02');
          Ini.WriteString(vPercepciones, 'HorasExtra1HorasExtra', FloatToStr(adoqryNominaTIEMPO_EXTRA_TRIPLE.Value));
          Ini.WriteString(vPercepciones, 'HorasExtra1ImportePagado', FormatFloat(cCFDI_ImporteMXN, adoqryNominaFloatField11.Value));
        end;
        if (adoqryNominaFloatField17G.Value <> 0) or (adoqryNominaFloatField17E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', '017');
          Ini.WriteString(vPercepciones, 'Concepto', 'DIA FESTIVO TRABAJA');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField17G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField17E.Value));
        end;
        if (adoqryNominaFloatField18G.Value <> 0) or (adoqryNominaFloatField18E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '038');
          Ini.WriteString(vPercepciones, 'Clave', '018');
          Ini.WriteString(vPercepciones, 'Concepto', 'DESCANSO TRABAJADO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField18G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField18E.Value));
        end;
        if (adoqryNominaFloatField19G.Value <> 0) or (adoqryNominaFloatField19E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '020');
          Ini.WriteString(vPercepciones, 'Clave', '019');
          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA DOMINICAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField19G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField19E.Value));
        end;
        if (adoqryNominaFloatField21G.Value <> 0) or (adoqryNominaFloatField21E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '021');
          Ini.WriteString(vPercepciones, 'Clave', '021');
          Ini.WriteString(vPercepciones, 'Concepto', 'PRIMA VACACIONAL');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField21G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField21E.Value));
        end;
        if (adoqryNominaFloatField30G.Value <> 0) or (adoqryNominaFloatField30E.Value <> 0) then
        begin
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '002');
          Ini.WriteString(vPercepciones, 'Clave', '030');
          Ini.WriteString(vPercepciones, 'Concepto', 'AGUINALDO');
          Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField30G.Value));
          Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField30E.Value));
        end;


        //[nomDeducciones]
        if (adoqryNominanomDeduccionesTotalOtrasDeducciones.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalOtrasDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomDeduccionesTotalOtrasDeducciones.Value));
        if (adoqryNominanomDeduccionesTotalImpuestosRetenidos.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryNominanomDeduccionesTotalImpuestosRetenidos.Value));
//        //[nomDeducciones1]
        vCountDeduccion := 0;
        vCampoIni := 92;
        vCampoFin := 112;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
          vClave := PreparaCadena(adoqryNomina.Fields[vCampoI].FieldName, 'D', '0', 3);
          if (vCampoV <> 0) then
          begin
            if dxmdDeduccionesTipo.Locate('Clave', vCampoN, []) then
            begin
              Inc(vCountDeduccion);
              vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
              Ini.WriteString(vDeducciones, 'TipoDeduccion', dxmdDeduccionesTipoSAT.Value);
              Ini.WriteString(vDeducciones, 'Clave', vClave);
              Ini.WriteString(vDeducciones, 'Concepto', Remplazar(dxmdDeduccionesTipoConcepto.Value));
              Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,vCampoV));
            end;
          end;
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
//              Ini.WriteString(vDeducciones, 'Concepto', Remplazar((dxmdDeduccionesTipoConcepto.Value));
//              Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN,vCampoV));
//              Ini.WriteString(vDeducciones, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN,0));
//                //SaldoAFavor=
//                //Ao=
//                //RemanenteSalFav=
//            end;
//          end;
//        end;
        if (adoqryNominaFloatField51A.Value <> 0) then
        begin
          Inc(vCountOtrosPagos);
          vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
          Ini.WriteString(vOtrosPagos, 'TipoOtroPago', '002');
          Ini.WriteString(vOtrosPagos, 'Clave', '51A');
          Ini.WriteString(vOtrosPagos, 'Concepto', 'SUBSIDIO EL EMPLEO');
          Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField51A.Value));
          Ini.WriteString(vOtrosPagos, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN,adoqryNominaSubsidioAlEmpleo.Value));
        end;
        if (adoqryNominaFloatField999.Value <> 0) then
        begin
          Inc(vCountOtrosPagos);
          vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
          Ini.WriteString(vOtrosPagos, 'TipoOtroPago', '999');
          Ini.WriteString(vOtrosPagos, 'Clave', '999');
          Ini.WriteString(vOtrosPagos, 'Concepto', 'Pagos distintos a los listados');
          Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNominaFloatField999.Value));
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

procedure TdmJUMAPAM.DataModuleCreate(Sender: TObject);
begin
  CargarTipos;
end;

end.
