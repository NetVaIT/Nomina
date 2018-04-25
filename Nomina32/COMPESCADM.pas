unit COMPESCADM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  FacturaTipos, dxmdaset;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepcion';
  cDeducciones = 'nomDeduccion';
  cOtrosPagos = 'nomOtrosPagos';
  cFormatFloat = '0.00####';
  cCFDI_ImporteMXN = '0.00';

type
  TdmCOMPESCA = class(TDataModule)
    adoqryNomina: TADOQuery;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    dxmdPercepcionesTipo: TdxMemData;
    adoqPercepcionesTipo: TADOQuery;
    dxmdDeduccionesTipo: TdxMemData;
    adoqDeduccionesTipo: TADOQuery;
    dxmdPercepcionesTipoClave: TWideStringField;
    dxmdPercepcionesTipoConcepto: TWideStringField;
    dxmdPercepcionesTipoExento: TBooleanField;
    dxmdPercepcionesTipoGravado: TBooleanField;
    dxmdPercepcionesTipoSAT: TWideStringField;
    dxmdDeduccionesTipoClave: TWideStringField;
    dxmdDeduccionesTipoConcepto: TWideStringField;
    dxmdDeduccionesTipoExento: TBooleanField;
    dxmdDeduccionesTipoGravado: TBooleanField;
    dxmdDeduccionesTipoSAT: TWideStringField;
    adoqryNominaID: TFloatField;
    adoqryNominaFormaDePago: TStringField;
    adoqryNominaSubTotal: TFloatField;
    adoqryNominaDescuento: TFloatField;
    adoqryNominaMotivoDescuento: TStringField;
    adoqryNominaTotal: TFloatField;
    adoqryNominaMetodoDePago: TWideStringField;
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
    adoqryNominaComplementoNominaTipoRegimen: TFloatField;
    adoqryNominaComplementoNominaNumSeguridadSocial: TWideStringField;
    adoqryNominaComplementoNominaFechaPago: TDateTimeField;
    adoqryNominaComplementoNominaPagoDesde: TDateTimeField;
    adoqryNominaComplementoNominaPagoHasta: TDateTimeField;
    adoqryNominaComplementoNominaNumDiasPagados: TFloatField;
    adoqryNominaComplementoNominaPuesto: TWideStringField;
    adoqryNominaComplementoNominaTipoContrato: TWideStringField;
    adoqryNominaComplementoNominaPeriodicidad: TWideStringField;
    adoqryNominaPTotalGravado: TFloatField;
    adoqryNominaPTotalExento: TFloatField;
    adoqryNominaDTotalGravado: TFloatField;
    adoqryNominaDTotalExento: TFloatField;
    adoqryNominaC101: TFloatField;
    adoqryNominaC102: TFloatField;
    adoqryNominaC105: TFloatField;
    adoqryNominaC106: TFloatField;
    adoqryNominaC114: TFloatField;
    adoqryNominaC115: TFloatField;
    adoqryNominaC116: TFloatField;
    adoqryNominaC119: TFloatField;
    adoqryNominaC122: TFloatField;
    adoqryNominaC127: TFloatField;
    adoqryNominaC1SE: TFloatField;
    adoqryNominaC1AJ: TFloatField;
    adoqryNominaC128: TFloatField;
    adoqryNominaC17D: TFloatField;
    adoqryNominaC1AD: TFloatField;
    adoqryNominaC1AF: TFloatField;
    adoqryNominaC1CH: TFloatField;
    adoqryNominaC1CU: TFloatField;
    adoqryNominaC1DF: TFloatField;
    adoqryNominaC1LC: TFloatField;
    adoqryNominaC1CP: TFloatField;
    adoqryNominaC1PL: TFloatField;
    adoqryNominaC1TI: TFloatField;
    adoqryNominaC1SC: TFloatField;
    adoqryNominaC1VP: TFloatField;
    adoqryNominaC1PE: TFloatField;
    adoqryNominaC251: TFloatField;
    adoqryNominaC252: TFloatField;
    adoqryNominaC253: TFloatField;
    adoqryNominaC256: TFloatField;
    adoqryNominaC258: TFloatField;
    adoqryNominaC259: TFloatField;
    adoqryNominaC262: TFloatField;
    adoqryNominaC263: TFloatField;
    adoqryNominaC264: TFloatField;
    adoqryNominaC265: TFloatField;
    adoqryNominaC268: TFloatField;
    adoqryNominaC271: TFloatField;
    adoqryNominaC272: TFloatField;
    adoqryNominaC273: TFloatField;
    adoqryNominaC274: TFloatField;
    adoqryNominaC275: TFloatField;
    adoqryNominaC280: TFloatField;
    adoqryNominaC290: TFloatField;
    adoqryNominaC291: TFloatField;
    adoqryNominaC2S1: TFloatField;
    adoqryNominaC2S2: TFloatField;
    adoqryNominaC2S3: TFloatField;
    adoqryNominaC2S4: TFloatField;
    adoqryNominaC2U1: TFloatField;
    adoqryNominaC2U2: TFloatField;
    adoqryNominaC2V1: TFloatField;
    adoqryNominaC2V7: TFloatField;
    adoqryNominaC2Y2: TFloatField;
    adoqryNominaC2Y5: TFloatField;
    adoqryNominaC2Y6: TFloatField;
    adoqryNominaC2Z5: TFloatField;
    adoqryNominaC2Z8: TFloatField;
    adoqryNominaTOTPER: TFloatField;
    adoqryNominaTOTDED: TFloatField;
    adoqryNominaTOTLIQ: TFloatField;
    adoqryNominaPeriodoMes: TIntegerField;
    adoqryNominaPeriodoAnio: TIntegerField;
    adoqryNomina12: TADOQuery;
    adoqryNomina12ID: TFloatField;
    adoqryNomina12FormaDePago: TStringField;
    adoqryNomina12SubTotal: TFloatField;
    adoqryNomina12Descuento: TFloatField;
    adoqryNomina12TipoCambio: TIntegerField;
    adoqryNomina12Moneda: TStringField;
    adoqryNomina12Total: TFloatField;
    adoqryNomina12MetodoDePago: TStringField;
    adoqryNomina12TipoDeComprobante: TStringField;
    adoqryNomina12LugarExpedicion: TStringField;
    adoqryNomina12EmisorRFC: TStringField;
    adoqryNomina12EmisorNombre: TStringField;
    adoqryNomina12EmisorRegimen: TStringField;
    adoqryNomina12ReceptorRFC: TWideStringField;
    adoqryNomina12ReceptorNombre: TWideStringField;
    adoqryNomina12ConceptoValorUnitario: TFloatField;
    adoqryNomina12ConceptoImporte: TFloatField;
    adoqryNomina12ComplementoNominaTipoNomina: TWideStringField;
    adoqryNomina12ComplementoNominaFechaPago: TDateTimeField;
    adoqryNomina12ComplementoNominaFechaInicialPago: TDateTimeField;
    adoqryNomina12ComplementoNominaFechaFinalPago: TDateTimeField;
    adoqryNomina12ComplementoNominaNumDiasPagados: TFloatField;
    adoqryNomina12SubsidioAlEmpleo: TIntegerField;
    adoqryNomina12ComplementoNominaTotalPercepciones: TFloatField;
    adoqryNomina12ComplementoNominaTotalDeducciones: TFloatField;
    adoqryNomina12ComplementoNominaTotalOtrosPagos: TIntegerField;
    adoqryNomina12nomEmisorCURP: TStringField;
    adoqryNomina12nomEmisorRegistroPatronal: TStringField;
    adoqryNomina12nomReceptorCURP: TWideStringField;
    adoqryNomina12nomReceptorNumSeguridadSocial: TWideStringField;
    adoqryNomina12nomReceptorFechaInicioRelLaboral: TDateTimeField;
    adoqryNomina12nomReceptorAntiguedad: TStringField;
    adoqryNomina12nomReceptorTipoContrato: TWideStringField;
    adoqryNomina12nomReceptorSindicalizado: TWideStringField;
    adoqryNomina12nomReceptorTipoJornada: TWideStringField;
    adoqryNomina12nomReceptorNumEmpleado: TWideStringField;
    adoqryNomina12nomReceptorDepartamento: TWideStringField;
    adoqryNomina12nomReceptorPuesto: TWideStringField;
    adoqryNomina12nomReceptorRiesgoPuesto: TStringField;
    adoqryNomina12nomReceptorPeriodicidadPago: TWideStringField;
    adoqryNomina12nomReceptorSalarioBaseCotApor: TFloatField;
    adoqryNomina12nomReceptorSalarioDiarioIntegrado: TFloatField;
    adoqryNomina12nomReceptorClaveEntFed: TWideStringField;
    adoqryNomina12nomPercepcionesTotalSueldos: TFloatField;
    adoqryNomina12nomPercepcionesTotalGravado: TFloatField;
    adoqryNomina12nomPercepcionesTotalExento: TFloatField;
    adoqryNomina12nomDeduccionesTotalOtrasDeducciones: TFloatField;
    adoqryNomina12nomDeduccionesTotalImpuestosRetenidos: TFloatField;
    adoqryNomina12C101: TFloatField;
    adoqryNomina12C102: TFloatField;
    adoqryNomina12C105: TFloatField;
    adoqryNomina12C106: TFloatField;
    adoqryNomina12C114: TFloatField;
    adoqryNomina12C115: TFloatField;
    adoqryNomina12C116: TFloatField;
    adoqryNomina12C119: TFloatField;
    adoqryNomina12C122: TFloatField;
    adoqryNomina12C127: TFloatField;
    adoqryNomina12C1SE: TFloatField;
    adoqryNomina12C1AJ: TFloatField;
    adoqryNomina12C128: TFloatField;
    adoqryNomina12C17D: TFloatField;
    adoqryNomina12C1AD: TFloatField;
    adoqryNomina12C1AF: TFloatField;
    adoqryNomina12C1CH: TFloatField;
    adoqryNomina12C1CU: TFloatField;
    adoqryNomina12C1DF: TFloatField;
    adoqryNomina12C1LC: TFloatField;
    adoqryNomina12C1CP: TFloatField;
    adoqryNomina12C1PL: TFloatField;
    adoqryNomina12C1TI: TFloatField;
    adoqryNomina12C1SC: TFloatField;
    adoqryNomina12C1VP: TFloatField;
    adoqryNomina12C1PE: TFloatField;
    adoqryNomina12C251: TFloatField;
    adoqryNomina12C252: TFloatField;
    adoqryNomina12C253: TFloatField;
    adoqryNomina12C256: TFloatField;
    adoqryNomina12C258: TFloatField;
    adoqryNomina12C259: TFloatField;
    adoqryNomina12C262: TFloatField;
    adoqryNomina12C263: TFloatField;
    adoqryNomina12C264: TFloatField;
    adoqryNomina12C265: TFloatField;
    adoqryNomina12C268: TFloatField;
    adoqryNomina12C271: TFloatField;
    adoqryNomina12C272: TFloatField;
    adoqryNomina12C273: TFloatField;
    adoqryNomina12C274: TFloatField;
    adoqryNomina12C275: TFloatField;
    adoqryNomina12C280: TFloatField;
    adoqryNomina12C290: TFloatField;
    adoqryNomina12C291: TFloatField;
    adoqryNomina12C2S1: TFloatField;
    adoqryNomina12C2S2: TFloatField;
    adoqryNomina12C2S3: TFloatField;
    adoqryNomina12C2S4: TFloatField;
    adoqryNomina12C2U1: TFloatField;
    adoqryNomina12C2U2: TFloatField;
    adoqryNomina12C2V1: TFloatField;
    adoqryNomina12C2V7: TFloatField;
    adoqryNomina12C2Y2: TFloatField;
    adoqryNomina12C2Y5: TFloatField;
    adoqryNomina12C2Y6: TFloatField;
    adoqryNomina12C2Z5: TFloatField;
    adoqryNomina12C2Z8: TFloatField;
    adoqryNomina12TOTPER: TFloatField;
    adoqryNomina12TOTDED: TFloatField;
    adoqryNomina12TOTLIQ: TFloatField;
    adoqryNomina12PeriodoMes: TIntegerField;
    adoqryNomina12PeriodoAnio: TIntegerField;
    adoqryNomina12nomReceptorTipoRegimen: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CargarTipos;
    procedure CrearINI_11(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
      pCDirXML: string);
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

{ TdmRTV }

procedure TdmCOMPESCA.CargarTipos;
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

procedure TdmCOMPESCA.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean;
  pCDirINI, pCDirXML: string);
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
    Result := s;
  end;

begin
  FDateSeparator := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '-';
  vCount := 0;
  adoqryNominaCount.Close;
//  if pFiltrar then
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
//  end
//  else
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= 0;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= 0;
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= 0;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= 0;
//  end;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;
  adoqryNomina12.Close;
//  if pFiltrar then
//  begin
//    adoqryNomina12.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNomina12.Parameters.ParamByName('Anio2').Value:= pAnio;
//    adoqryNomina12.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNomina12.Parameters.ParamByName('Mes2').Value:= pMes;
//  end
//  else
//  begin
//    adoqryNomina12.Parameters.ParamByName('Anio1').Value:= 0;
//    adoqryNomina12.Parameters.ParamByName('Anio2').Value:= 0;
//    adoqryNomina12.Parameters.ParamByName('Mes1').Value:= 0;
//    adoqryNomina12.Parameters.ParamByName('Mes2').Value:= 0;
//  end;
  adoqryNomina12.Open;
  try
    while not adoqryNomina12.Eof do
    begin
      ID := adoqryNomina12nomReceptorNumEmpleado.Value + '_' + FloatToStr(adoqryNomina12ID.Value);
      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryNomina12ComplementoNominaFechaPago.Value);
      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryNomina12ComplementoNominaFechaInicialPago.Value);
      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryNomina12ComplementoNominaFechaFinalPago.Value);
      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryNomina12nomReceptorFechaInicioRelLaboral.Value);
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
        Ini.WriteString('Comprobante', 'FormaDePago', adoqryNomina12FormaDePago.AsString);
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12SubTotal.Value));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12Descuento.Value));
        Ini.WriteString('Comprobante', 'TipoCambio', adoqryNomina12TipoCambio.AsString);
        Ini.WriteString('Comprobante', 'Moneda', adoqryNomina12Moneda.AsString);
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12Total.Value));
        Ini.WriteString('Comprobante', 'MetodoDePago', adoqryNomina12MetodoDePago.AsString);
        Ini.WriteString('Comprobante', 'TipoDeComprobante', adoqryNomina12TipoDeComprobante.AsString);
        Ini.WriteString('Comprobante', 'LugarExpedicion', adoqryNomina12LugarExpedicion.AsString);
        //[Emisor]
        {$IFDEF DEBUG}
          Ini.WriteString('Emisor', 'Rfc', FCertificado.RFCAlQuePertenece);
        {$ELSE}
          Ini.WriteString('Emisor', 'Rfc', adoqryNomina12EmisorRFC.AsString);
        {$ENDIF}
        Ini.WriteString('Emisor', 'Nombre', adoqryNomina12EmisorNombre.AsString);
        Ini.WriteString('Emisor', 'Regimen', adoqryNomina12EmisorRegimen.AsString);
        //[Receptor]
        {$IFDEF DEBUG}
          Ini.WriteString('Receptor', 'Rfc', 'TUCA2107035N9');
        {$ELSE}
          Ini.WriteString('Receptor', 'Rfc', adoqryNomina12ReceptorRFC.AsString);
        {$ENDIF}
        Ini.WriteString('Receptor', 'Nombre', adoqryNomina12ReceptorNombre.AsString);
        //[Concepto1]
        Ini.WriteString('Concepto1', 'Cantidad', '1');
        Ini.WriteString('Concepto1', 'Unidad', 'ACT');
        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de nómina');
        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12ConceptoValorUnitario.Value));
        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12ConceptoImporte.Value));
        //[ComplementoNomina]
        Ini.WriteString('ComplementoNomina', 'TipoNomina', adoqryNomina12ComplementoNominaTipoNomina.AsString);
        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', adoqryNomina12ComplementoNominaNumDiasPagados.AsString);
        if (adoqryNomina12ComplementoNominaTotalPercepciones.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalPercepciones', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12ComplementoNominaTotalPercepciones.Value));
        if (adoqryNomina12ComplementoNominaTotalDeducciones.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12ComplementoNominaTotalDeducciones.Value));
        if (adoqryNomina12ComplementoNominaTotalOtrosPagos.Value <> 0) then
          Ini.WriteString('ComplementoNomina', 'TotalOtrosPagos', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12ComplementoNominaTotalOtrosPagos.Value));
        //[nomEmisor]
//        Ini.WriteString('nomEmisor', 'CURP', adoqryNomina12nomEmisorCURP.AsString);
        Ini.WriteString('nomEmisor', 'RegistroPatronal', adoqryNomina12nomEmisorRegistroPatronal.AsString);
//        Ini.WriteString('nomEmisor', 'RfcPatronOrigen', adoqryNomina12nomEmisorRfcPatronOrigen.AsString);
        // OrigenRecurso
        {$IFDEF DEBUG}

        {$ELSE}
          Ini.WriteString('nomEmisor', 'OrigenRecurso', 'IP');
        {$ENDIF}
        //[nomReceptor]
        Ini.WriteString('nomReceptor', 'CURP', adoqryNomina12nomReceptorCURP.AsString);
        Ini.WriteString('nomReceptor', 'NumSeguridadSocial', adoqryNomina12nomReceptorNumSeguridadSocial.AsString);
        Ini.WriteString('nomReceptor', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
        Ini.WriteString('nomReceptor', 'Antigedad', adoqryNomina12nomReceptorAntiguedad.AsString);
        Ini.WriteString('nomReceptor', 'TipoContrato', adoqryNomina12nomReceptorTipoContrato.AsString);
        Ini.WriteString('nomReceptor', 'Sindicalizado', adoqryNomina12nomReceptorSindicalizado.AsString);
        Ini.WriteString('nomReceptor', 'TipoJornada', adoqryNomina12nomReceptorTipoJornada.AsString);
        Ini.WriteString('nomReceptor', 'TipoRegimen', adoqryNomina12nomReceptorTipoRegimen.AsString);
        Ini.WriteString('nomReceptor', 'NumEmpleado', adoqryNomina12nomReceptorNumEmpleado.Value);
        Ini.WriteString('nomReceptor', 'Departamento', Remplazar(adoqryNomina12nomReceptorDepartamento.AsString));
        Ini.WriteString('nomReceptor', 'Puesto', Remplazar(adoqryNomina12nomReceptorPuesto.AsString));
        Ini.WriteString('nomReceptor', 'RiesgoPuesto', adoqryNomina12nomReceptorRiesgoPuesto.AsString);
        Ini.WriteString('nomReceptor', 'PeriodicidadPago', adoqryNomina12nomReceptorPeriodicidadPago.AsString);
//        Ini.WriteString('nomReceptor', 'Banco', adoqryNomina12nomEmisorBanco.AsString);
//        Ini.WriteString('nomReceptor', 'CuentaBancaria', adoqryNomina12nomEmisorCuentaBancaria.AsString);
        Ini.WriteString('nomReceptor', 'SalarioBaseCotApor', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomReceptorSalarioBaseCotApor.Value));
        Ini.WriteString('nomReceptor', 'SalarioDiarioIntegrado', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomReceptorSalarioDiarioIntegrado.Value));
        Ini.WriteString('nomReceptor', 'ClaveEntFed', adoqryNomina12nomReceptorClaveEntFed.AsString);
        //[nomSubcontratacion1]
        //RfcLabora=XAXX010101000
        //PorcentajeTiempo=50.000
        //[nomPercepciones]
        if (adoqryNomina12nomPercepcionesTotalSueldos.Value <> 0)
        or (adoqryNomina12nomPercepcionesTotalGravado.Value <> 0)
        or (adoqryNomina12nomPercepcionesTotalExento.Value <> 0) then
        begin
          Ini.WriteString('nomPercepciones', 'TotalSueldos', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomPercepcionesTotalSueldos.Value));
//          Ini.WriteString('nomPercepciones', 'TotalSeparacionIndemnizacion', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12PTotalGravado.Value));
//          Ini.WriteString('nomPercepciones', 'TotalJubilacionPensionRetiro', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12PTotalGravado.Value));
          Ini.WriteString('nomPercepciones', 'TotalGravado', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomPercepcionesTotalGravado.Value));
          Ini.WriteString('nomPercepciones', 'TotalExento', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomPercepcionesTotalExento.Value));
        end;
        //[nomPercepciones1]
        vCountPercepcion := 0;
        vCampoIni := 49;
        vCampoFin := 74;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina12.Fields[vCampoI].FieldName;
          vClave := Copy(vCampoN, 2, Length(vCampoN));
          vCampoV := adoqryNomina12.FieldByName(vCampoN).Value;
          if (vCampoV <> 0) then
          begin
            if dxmdPercepcionesTipo.Locate('Clave', vClave, []) then
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
        if (adoqryNomina12nomDeduccionesTotalOtrasDeducciones.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalOtrasDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomDeduccionesTotalOtrasDeducciones.Value));
        if (adoqryNomina12nomDeduccionesTotalImpuestosRetenidos.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12nomDeduccionesTotalImpuestosRetenidos.Value));
        //[nomDeducciones1]
        vCountDeduccion := 0;
        vCampoIni := 75;
        vCampoFin := 106;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina12.Fields[vCampoI].FieldName;
          vClave := Copy(vCampoN, 2, Length(vCampoN));
          vCampoV := adoqryNomina12.FieldByName(vCampoN).Value;
          if (vCampoV <> 0) then
          begin
            if dxmdDeduccionesTipo.Locate('Clave', vClave, []) then
            begin
              Inc(vCountDeduccion);
              vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
              Ini.WriteString(vDeducciones, 'TipoDeduccion', dxmdDeduccionesTipoSAT.Value);
              Ini.WriteString(vDeducciones, 'Clave', vClave);
              Ini.WriteString(vDeducciones, 'Concepto', Remplazar(dxmdDeduccionesTipoConcepto.AsString));
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
//          vCampoN := adoqryNomina12.Fields[vCampoI].FieldName;
//          vClave := Copy(vCampoN, 2, Length(vCampoN));
//          vCampoV := adoqryNomina12.FieldByName(vCampoN).Value;
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
//        if (adoqryNomina12P42.Value <> 0) then
//        begin
//          Inc(vCountOtrosPagos);
//          vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
//          Ini.WriteString(vOtrosPagos, 'TipoOtroPago', '002');
//          Ini.WriteString(vOtrosPagos, 'Clave', 'P42');
//          Ini.WriteString(vOtrosPagos, 'Concepto', 'SUBSIDIO PARA EL EMPLEO');
//          Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12P42.Value));
//          Ini.WriteString(vOtrosPagos, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN,adoqryNomina12SubsidioAlEmpleo.Value));
//        end;

        //[nomIncapacidades1]
        //DiasIncapacidad=1
        //TipoIncapacidad=01
        //ImporteMonetario=0.00

      finally
        Ini.Free;
      end;
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqryNomina12.Next;
    end;
  finally
    adoqryNomina12.Close;
    ShowProgress(0,0);
    FormatSettings.DateSeparator := FDateSeparator;
  end;
end;

procedure TdmCOMPESCA.CrearINI_11(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
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
begin
  FDateSeparator := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '-';
  vCount := 0;
  adoqryNominaCount.Close;
//  if pFiltrar then
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
//  end;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;

  adoqryNomina.Close;
//  if pFiltrar then
//  begin
//    adoqryNominaCount.Parameters.ParamByName('Mes1').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Mes2').Value:= pMes;
//    adoqryNominaCount.Parameters.ParamByName('Anio1').Value:= pAnio;
//    adoqryNominaCount.Parameters.ParamByName('Anio2').Value:= pAnio;
//  end;
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
//        Ini.WriteString('ECODEX', 'Servicio', 'Prueba'); //Servicio=Prueba (cuando ya este en produccion debera usar "Produccion")
//        Ini.WriteString('ECODEX', 'RFC', adoqryNominaEmisorRFC.AsString);
//        Ini.WriteString('ECODEX', 'TransaccionID', FloatToStr(adoqryNominaID.Value));
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
        {$IFDEF DEBUG}
          Ini.WriteString('Emisor', 'Rfc', FCertificado.RFCAlQuePertenece);
        {$ELSE}
          Ini.WriteString('Emisor', 'Rfc', adoqryNominaEmisorRFC.AsString);
        {$ENDIF}
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
//        Ini.WriteString('ComplementoNomina', 'Departamento', adoqryNominaComplementoNominaDepartamento.AsString);
//        Ini.WriteString('ComplementoNomina', 'CLABE', adoqryCFDICLABE.AsString);
//        Ini.WriteString('ComplementoNomina', 'Banco', adoqryCFDIBanco.AsString);
//        Ini.WriteString('ComplementoNomina', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
//        Ini.WriteString('ComplementoNomina', 'Antiguedad', adoqryCFDIAntiguedad.AsString);
        Ini.WriteString('ComplementoNomina', 'Puesto', adoqryNominaComplementoNominaPuesto.AsString);
        Ini.WriteString('ComplementoNomina', 'TipoContrato', adoqryNominaComplementoNominaTipoContrato.AsString);
//        Ini.WriteString('ComplementoNomina', 'TipoJornada', adoqryCFDITipoJornada.AsString);
        Ini.WriteString('ComplementoNomina', 'PeriodicidadPago', adoqryNominaComplementoNominaPeriodicidad.AsString);
//        Ini.WriteString('ComplementoNomina', 'SalarioBaseCotApor', adoqryCFDISalarioBaseCotApor.AsString);
//        Ini.WriteString('ComplementoNomina', 'RiesgoPuesto', adoqryCFDIRiesgoPuesto.AsString);
//        Ini.WriteString('ComplementoNomina', 'SalarioDiarioIntegrado', adoqryCFDISalarioDiarioIntegrado.AsString);
        //[nomPercepciones]
        if (adoqryNominaPTotalGravado.Value <> 0) or (adoqryNominaPTotalExento.Value <> 0) then
        begin
          Ini.WriteString(cPercepciones, 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaPTotalGravado.Value));
          Ini.WriteString(cPercepciones, 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaPTotalExento.Value));
        end;
        //[nomPercepciones1]
        vCountPercepcion := 0;
        vCampoIni := 34;
        vCampoFin := 59;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
          vClave := Copy(vCampoN, 2, Length(vCampoN));
          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
          if (vCampoV <> 0) then
          begin
            if dxmdPercepcionesTipo.Locate('Clave', vClave, []) then
            begin
              Inc(vCountPercepcion);
              vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
              Ini.WriteString(vPercepciones, 'TipoPercepcion', dxmdPercepcionesTipoSAT.Value);
              Ini.WriteString(vPercepciones, 'Clave', vClave);
              Ini.WriteString(vPercepciones, 'Concepto', dxmdPercepcionesTipoConcepto.Value);
              vCampoGravado := dxmdPercepcionesTipoGravado.Value;
              vCampoExento := dxmdPercepcionesTipoExento.Value;
              if vCampoGravado then
                Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cFormatFloat,vCampoV))
              else
                Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
              if vCampoExento then
                Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cFormatFloat,vCampoV))
              else
                Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
            end;
          end;
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
        // Ingresos propios
          Inc(vCountPercepcion);
          vPercepciones := cPercepciones + IntToStr(vCountPercepcion);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '040');
          Ini.WriteString(vPercepciones, 'Clave', '000');
          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS PROPIOS');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
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

        //[nomDeducciones]
        if (adoqryNominaDTotalGravado.Value <> 0) or (adoqryNominaDTotalExento.Value <> 0) then
        begin
          Ini.WriteString('nomDeducciones', 'TotalGravado', FormatFloat(cFormatFloat,adoqryNominaDTotalGravado.Value));
          Ini.WriteString('nomDeducciones', 'TotalExento', FormatFloat(cFormatFloat,adoqryNominaDTotalExento.Value));
        end;
        //[nomDeducciones1]
        vCountDeduccion := 0;
        vCampoIni := 60;
        vCampoFin := 91;
        for vCampoI := vCampoIni to vCampoFin do
        begin
          vCampoN := adoqryNomina.Fields[vCampoI].FieldName;
          vClave := Copy(vCampoN, 2, Length(vCampoN));
          vCampoV := adoqryNomina.FieldByName(vCampoN).Value;
          if (vCampoV <> 0) then
          begin
            if dxmdDeduccionesTipo.Locate('Clave', vClave, []) then
            begin
              Inc(vCountDeduccion);
              vDeducciones := cDeducciones + IntToStr(vCountDeduccion);
              Ini.WriteString(vDeducciones, 'TipoDeduccion', dxmdDeduccionesTipoSAT.Value);
              Ini.WriteString(vDeducciones, 'Clave', vClave);
              Ini.WriteString(vDeducciones, 'Concepto', dxmdDeduccionesTipoConcepto.Value);
              vCampoGravado := dxmdDeduccionesTipoGravado.Value;
              vCampoExento := dxmdDeduccionesTipoExento.Value;
              if vCampoGravado then
                Ini.WriteString(vDeducciones, 'ImporteGravado', FormatFloat(cFormatFloat,vCampoV))
              else
                Ini.WriteString(vDeducciones, 'ImporteGravado', '0.00');
              if vCampoExento then
                Ini.WriteString(vDeducciones, 'ImporteExento', FormatFloat(cFormatFloat,vCampoV))
              else
                Ini.WriteString(vDeducciones, 'ImporteExento', '0.00');
            end;
          end;
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

procedure TdmCOMPESCA.DataModuleCreate(Sender: TObject);
begin
  CargarTipos;
end;

end.
