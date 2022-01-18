unit IntervaDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  System.StrUtils,
  CFDIUtils;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepcion';
  cDeducciones = 'nomDeduccion';
  cOtrosPagos = 'nomOtrosPagos';
//  cFormatFloat = '0.00####';
  cCFDI_ImporteMXN = '0.00';

type
  TdmInterva = class(TDataModule)
    adoqryCFDI: TADOQuery;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryCFDIIDCFDI: TLargeintField;
    adoqryCFDIIDCFDINomina: TLargeintField;
    adoqryCFDISubtotal: TFMTBCDField;
    adoqryCFDIDescuento: TFMTBCDField;
    adoqryCFDITotal: TBCDField;
    adoqryCFDIReceptorRFC: TStringField;
    adoqryCFDIReceptorNombre: TStringField;
    adoqryCFDIConceptoValorUnitario: TFMTBCDField;
    adoqryCFDIConceptoImporte: TFMTBCDField;
    adoqryCFDIConceptoDescuento: TFMTBCDField;
    adoqryCFDITipoNomina: TStringField;
    adoqryCFDIFechaPago: TDateTimeField;
    adoqryCFDIFechaInicialPago: TDateTimeField;
    adoqryCFDIFechaFinalPago: TDateTimeField;
    adoqryCFDINumDiasPagados: TFloatField;
    adoqryCFDITotalPercepciones: TFMTBCDField;
    adoqryCFDITotalDeducciones: TFMTBCDField;
    adoqryCFDITotalOtrosPagos: TFMTBCDField;
    adoqryCFDIOrigenRecurso: TStringField;
    adoqryCFDIMontoRecursoPropio: TBCDField;
    adoqryCFDIRegistroPatronal: TStringField;
    adoqryCFDIReceptorCURP: TStringField;
    adoqryCFDINumSeguridadSocial: TStringField;
    adoqryCFDIFechaInicioRelLaboral: TDateTimeField;
    adoqryCFDIAntiguedad: TStringField;
    adoqryCFDITipoContrato: TStringField;
    adoqryCFDISindicalizado: TStringField;
    adoqryCFDITipoJornada: TStringField;
    adoqryCFDITipoRegimen: TStringField;
    adoqryCFDINumEmpleado: TStringField;
    adoqryCFDIDepartamento: TStringField;
    adoqryCFDIPuesto: TStringField;
    adoqryCFDIRiesgoPuesto: TIntegerField;
    adoqryCFDIPeriodicidadPago: TStringField;
    adoqryCFDIBanco: TStringField;
    adoqryCFDICLABE: TStringField;
    adoqryCFDISalarioBaseCotApor: TFMTBCDField;
    adoqryCFDISalarioDiarioIntegrado: TFMTBCDField;
    adoqryCFDIClaveEntFed: TStringField;
    adoqryCFDITotalSueldos: TFMTBCDField;
    adoqryCFDITotalGravadoPercepcion: TFMTBCDField;
    adoqryCFDITotalExentoPercepcion: TFMTBCDField;
    adoqryCFDITotalOtrasDeducciones: TFMTBCDField;
    adoqryCFDITotalImpuestosRetenidos: TFMTBCDField;
    adoqryPercepciones: TADOQuery;
    adoqryDeducciones: TADOQuery;
    adoqryIncapacidades: TADOQuery;
    adoqryIncapacidadesIdCFDIIncapacidadNomina: TAutoIncField;
    adoqryIncapacidadesDiasIncapacidad: TFloatField;
    adoqryIncapacidadesTipoIncapacidad: TIntegerField;
    adoqryIncapacidadesDescuento: TFMTBCDField;
    adoqryHorasExtra: TADOQuery;
    adoqryHorasExtraIDCFDIHoraExtraNomina: TAutoIncField;
    adoqryHorasExtraDias: TIntegerField;
    adoqryHorasExtraTipoHoras: TStringField;
    adoqryHorasExtraHorasExtra: TIntegerField;
    adoqryHorasExtraImportePagado: TFMTBCDField;
    adoqryPercepcionesIdCFDIConceptoNomina: TLargeintField;
    adoqryPercepcionesTipo: TStringField;
    adoqryPercepcionesClave: TStringField;
    adoqryPercepcionesConcepto: TStringField;
    adoqryPercepcionesImporteGravado: TFMTBCDField;
    adoqryPercepcionesImporteExento: TFMTBCDField;
    adoqryDeduccionesIdCFDIConceptoNomina: TLargeintField;
    adoqryDeduccionesTipo: TStringField;
    adoqryDeduccionesClave: TStringField;
    adoqryDeduccionesConcepto: TStringField;
    adoqryDeduccionesImporte: TFMTBCDField;
    adoqryCFDITipoRelacion: TStringField;
    adoqryCFDICfdiRelacionado1: TStringField;
    adoqryCFDISerie: TStringField;
    adoqryCFDIFolio: TStringField;
    adoqryCFDISubsidioCausado: TBCDField;
    adoqOtrosPagos: TADOQuery;
    adoqOtrosPagosIdCFDIConceptoNomina: TLargeintField;
    adoqOtrosPagosTipo: TStringField;
    adoqOtrosPagosClave: TStringField;
    adoqOtrosPagosConcepto: TStringField;
    adoqOtrosPagosImporte: TFMTBCDField;
    adoqryCFDITotalSeparacionIndemnizacion: TBCDField;
    adoqryCFDITotalJubilacionPensionRetiro: TBCDField;
    adoqryCFDISI_TotalPagado: TBCDField;
    adoqryCFDISI_NumAniosServicio: TIntegerField;
    adoqryCFDISI_UltimoSueldoMensOrd: TBCDField;
    adoqryCFDISI_IngresoAcumulable: TBCDField;
    adoqryCFDISI_IngresoNoAcumulable: TBCDField;
  private
    { Private declarations }
    FEmisorNombre: string;
    FEmisorRegimenFiscal: string;
    FRegistroPatronal: string;
    FEmisorRFC: string;
    FLugarExpedicion: string;
    procedure SetEmisorNombre(const Value: string);
    procedure SetEmisorRegimenFiscal(const Value: string);
    procedure SetEmisorRFC(const Value: string);
    procedure SetLugarExpedicion(const Value: string);
    procedure SetRegistroPatronal(const Value: string);
  public
    { Public declarations }
    FCertificado: TFECertificado;
    procedure CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
      pCDirXML: string);
    property LugarExpedicion: string read FLugarExpedicion write SetLugarExpedicion;
    property EmisorRFC: string read FEmisorRFC write SetEmisorRFC;
    property EmisorNombre: string read FEmisorNombre write SetEmisorNombre;
    property EmisorRegimenFiscal: string read FEmisorRegimenFiscal write SetEmisorRegimenFiscal;
    property RegistroPatronal: string read FRegistroPatronal write SetRegistroPatronal;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils;

{$R *.dfm}

{ TdmInterva }

procedure TdmInterva.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
  pCDirXML: string);
var
  Ini: TIniFile;
  INIFileName: string;
  XMLFileName: string;
  vCountTotal, vCount: Integer;
  ID: String;
  vFechaPago: string;
  vPagoDesde: string;
  vPagoHasta: string;
  vFechaInicioRelLaboral: string;
  FDateSeparator: Char;
  vCountConceptos: Integer;
  vConceptos: string;
  vCountPercepciones: Integer;
  vPercepciones: string;
  vCountHorasExtra: Integer;
  vHorasExtra: string;
  vCountDeducciones: Integer;
  vDeducciones: string;
  vCountOtrosPagos: Integer;
  vOtrosPagos: string;
  vCountIncapacidad: Integer;
  vIncapacidad: string;
  vTipoContrato: string;

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
  vCount := 0;
  adoqryNominaCount.Close;
  adoqryNominaCount.Parameters.ParamByName('Estatus').Value := pMes;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;

  adoqryCFDI.Close;
  adoqryCFDI.Parameters.ParamByName('Estatus').Value := pMes;
  adoqryCFDI.Open;
  try
    while not adoqryCFDI.Eof do
    begin
      ID := adoqryCFDIReceptorRFC.AsString + '_' + FloatToStr(adoqryCFDIIDCFDI.Value);
      vTipoContrato := PreparaCadena(adoqryCFDITipoContrato.AsString,'D','0',2);
  FormatSettings.DateSeparator:= '-';
      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryCFDIFechaPago.Value);
      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryCFDIFechaInicialPago.Value);
      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryCFDIFechaFinalPago.Value);
      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryCFDIFechaInicioRelLaboral.Value);
      INIFileName := '.' + PathDelim + pCDirINI + PathDelim + ID + '.INI';
      XMLFileName := '.' + PathDelim + pCDirXML + PathDelim + ID + '.XML';
      Ini := TIniFile.Create(INIFileName);
      try
        //[Parametros]
        Ini.WriteString('Parametros', 'Certificado', FCertificado.Ruta);
        Ini.WriteString('Parametros', 'LlavePrivada', FCertificado.LlavePrivada.Ruta);
        Ini.WriteString('Parametros', 'XMLDestino', XMLFileName);
        Ini.WriteString('Parametros', 'Bitacora', cBitacora);
//        Ini.WriteString('Parametros', 'PAC', 'ECODEX');
//        Ini.WriteString('Parametros', 'Mensajes', 'OFF');
        //[ECODEX]
//        Ini.WriteString('ECODEX', 'Servicio', 'Prueba'); //Servicio=Prueba (cuando ya este en produccion debera usar "Produccion")
//        Ini.WriteString('ECODEX', 'RFC', 'AAA010101AAA');
//        Ini.WriteString('ECODEX', 'TransaccionID', FloatToStr(adoqryCFDIID.Value));
        //[Comprobante]
        Ini.WriteString('Comprobante', 'Version', '3.3');
        Ini.WriteString('Comprobante', 'Serie', adoqryCFDISerie.AsString);
        Ini.WriteString('Comprobante', 'Folio', adoqryCFDIFolio.AsString);
        Ini.WriteString('Comprobante', 'FormaPago', '99');
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISubtotal.AsFloat));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIDescuento.AsFloat));
        Ini.WriteString('Comprobante', 'Moneda', 'MXN');
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cCFDI_ImporteMXN, adoqryCFDITotal.AsFloat));
        Ini.WriteString('Comprobante', 'TipoDeComprobante', 'N');
        Ini.WriteString('Comprobante', 'MetodoPago', 'PUE');
        Ini.WriteString('Comprobante', 'LugarExpedicion', LugarExpedicion);
//        Ini.WriteString('Comprobante', 'Confirmacion', );
        if not adoqryCFDITipoRelacion.IsNull then
        begin
          Ini.WriteString('Comprobante', 'TipoRelacion', adoqryCFDITipoRelacion.AsString);
          Ini.WriteString('Comprobante', 'CfdiRelacionado1', adoqryCFDICfdiRelacionado1.AsString);
        end;
//        Ini.WriteString('Comprobante', 'CfdiRelacionado2', );
//        Ini.WriteString('Comprobante', 'CfdiRelacionado3', );
        //[Emisor]
        {$IFDEF DEBUG}
          Ini.WriteString('Emisor', 'Rfc', 'TES030201001');
        {$ELSE}
          Ini.WriteString('Emisor', 'Rfc', EmisorRFC);
        {$ENDIF}
        Ini.WriteString('Emisor', 'Nombre', EmisorNombre);
        Ini.WriteString('Emisor', 'RegimenFiscal', EmisorRegimenFiscal);
        //[Receptor]
        {$IFDEF DEBUG}
          Ini.WriteString('Receptor', 'Rfc', 'TEST010203001');
        {$ELSE}
          Ini.WriteString('Receptor', 'Rfc', adoqryCFDIReceptorRFC.AsString);
        {$ENDIF}
        Ini.WriteString('Receptor', 'Nombre', adoqryCFDIReceptorNombre.AsString);
        Ini.WriteString('Receptor', 'UsoCFDI', 'P01');
        //[Concepto1]
        Ini.WriteString('Concepto1', 'ClaveProdServ', '84111505');
        Ini.WriteString('Concepto1', 'Cantidad', '1');
        Ini.WriteString('Concepto1', 'ClaveUnidad', 'ACT');
        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de nómina');
        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cCFDI_ImporteMXN, adoqryCFDIConceptoValorUnitario.AsFloat));
        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIConceptoImporte.AsFloat));
        Ini.WriteString('Concepto1', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIConceptoDescuento.AsFloat));
        //[Nomina]
        Ini.WriteString('Nomina', 'TipoNomina', adoqryCFDITipoNomina.AsString);
        Ini.WriteString('Nomina', 'FechaPago', vFechaPago);
        Ini.WriteString('Nomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('Nomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('Nomina', 'NumDiasPagados', adoqryCFDINumDiasPagados.AsString);
        if (adoqryCFDITotalPercepciones.AsFloat <> 0) then
          Ini.WriteString('Nomina', 'TotalPercepciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalPercepciones.AsFloat));
        if (adoqryCFDITotalDeducciones.AsFloat <> 0) then
          Ini.WriteString('Nomina', 'TotalDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalDeducciones.AsFloat));
        if (adoqryCFDITipoRegimen.AsString = '02') OR (adoqryCFDITotalOtrosPagos.AsFloat <> 0) then
          Ini.WriteString('Nomina', 'TotalOtrosPagos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalOtrosPagos.AsFloat));
        //[nomEmisor]
//        Ini.WriteString('nomEmisor', 'CURP', adoqryNominanomEmisorCURP.AsString);
        if vTipoContrato <> '09' then
          Ini.WriteString('nomEmisor', 'RegistroPatronal', adoqryCFDIRegistroPatronal.AsString);
//        Ini.WriteString('nomEmisor', 'RfcPatronOrigen', adoqryNominanomEmisorRfcPatronOrigen.AsString);
        {$IFDEF DEBUG}

        {$ELSE}
          Ini.WriteString('nomEmisor', 'OrigenRecurso', adoqryCFDIOrigenRecurso.AsString);
          if adoqryCFDIOrigenRecurso.AsString = 'IM' then
            Ini.WriteString('nomEmisor', 'MontoRecursoPropio', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIMontoRecursoPropio.AsFloat));
        {$ENDIF}
        //[nomReceptor]
        Ini.WriteString('nomReceptor', 'CURP', adoqryCFDIReceptorCURP.AsString);
        if vTipoContrato <> '09' then
        begin
          Ini.WriteString('nomReceptor', 'NumSeguridadSocial', adoqryCFDINumSeguridadSocial.AsString);
          Ini.WriteString('nomReceptor', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
          Ini.WriteString('nomReceptor', 'Antigedad', adoqryCFDIAntiguedad.AsString);
        end;
        Ini.WriteString('nomReceptor', 'TipoContrato', vTipoContrato);
        Ini.WriteString('nomReceptor', 'Sindicalizado', adoqryCFDISindicalizado.AsString);
        if vTipoContrato <> '09' then
          Ini.WriteString('nomReceptor', 'TipoJornada', PreparaCadena(adoqryCFDITipoJornada.AsString,'D','0',2));
        Ini.WriteString('nomReceptor', 'TipoRegimen', PreparaCadena(adoqryCFDITipoRegimen.AsString,'D','0',2));
        Ini.WriteString('nomReceptor', 'NumEmpleado', adoqryCFDINumEmpleado.AsString);
        Ini.WriteString('nomReceptor', 'Departamento', Remplazar(adoqryCFDIDepartamento.AsString));
        Ini.WriteString('nomReceptor', 'Puesto', Remplazar(adoqryCFDIPuesto.AsString));
        if vTipoContrato <> '09' then
          Ini.WriteString('nomReceptor', 'RiesgoPuesto', adoqryCFDIRiesgoPuesto.AsString);
        Ini.WriteString('nomReceptor', 'PeriodicidadPago', PreparaCadena(adoqryCFDIPeriodicidadPago.AsString,'D','0',2));
//        Ini.WriteString('nomReceptor', 'Banco', adoqryNominanomEmisorBanco.AsString);
//        Ini.WriteString('nomReceptor', 'CuentaBancaria', adoqryNominanomEmisorCuentaBancaria.AsString);
        if vTipoContrato <> '09' then
        begin
          Ini.WriteString('nomReceptor', 'SalarioBaseCotApor', FormatFloat(cCFDI_ImporteMXN,adoqryCFDISalarioBaseCotApor.AsFloat));
          Ini.WriteString('nomReceptor', 'SalarioDiarioIntegrado', FormatFloat(cCFDI_ImporteMXN,adoqryCFDISalarioDiarioIntegrado.AsFloat));
        end;
        Ini.WriteString('nomReceptor', 'ClaveEntFed', adoqryCFDIClaveEntFed.AsString);
        //[nomSubcontratacion1]
        //RfcLabora=XAXX010101000
        //PorcentajeTiempo=50.000
        //[nomPercepciones1]
        if (adoqryCFDITotalSueldos.AsFloat <> 0) then
          Ini.WriteString('nomPercepciones', 'TotalSueldos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalSueldos.AsFloat));
        if (adoqryCFDITotalSeparacionIndemnizacion.AsFloat <> 0) then
          Ini.WriteString('nomPercepciones', 'TotalSeparacionIndemnizacion', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalSeparacionIndemnizacion.AsFloat));
//        if (adoqryCFDITotalJubilacionPensionRetiro.AsFloat <> 0) then
//          Ini.WriteString('nomPercepciones', 'TotalJubilacionPensionRetiro', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalJubilacionPensionRetiro.AsFloat));
          Ini.WriteString('nomPercepciones', 'TotalGravado', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalGravadoPercepcion.AsFloat));
          Ini.WriteString('nomPercepciones', 'TotalExento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalExentoPercepcion.AsFloat));
        vCountPercepciones := 0;
        adoqryPercepciones.Close;
        adoqryPercepciones.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqryPercepciones.Open;
        try
          while not adoqryPercepciones.Eof do
          begin
            Inc(vCountPercepciones);
            vPercepciones := cPercepciones + IntToStr(vCountPercepciones);
            Ini.WriteString(vPercepciones, 'TipoPercepcion', adoqryPercepcionesTipo.AsString);
            Ini.WriteString(vPercepciones, 'Clave', adoqryPercepcionesClave.AsString);
            Ini.WriteString(vPercepciones, 'Concepto', Remplazar(adoqryPercepcionesConcepto.AsString));
            Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN, adoqryPercepcionesImporteGravado.AsFloat));
            Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN, adoqryPercepcionesImporteExento.AsFloat));
//        //[nomHorasExtra1]
//        vCountHorasExtra := 0;
//        adoqryHorasExtra.Close;
//        adoqryHorasExtra.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
//        adoqryHorasExtra.Open;
//        try
//          while not adoqryHorasExtra.Eof do
//          begin
//            Inc(vCountHorasExtra);
//            vHorasExtra := cHorasExtra + IntToStr(vCountHorasExtra);
//            Ini.WriteString(vHorasExtra, 'Dias', adoqryHorasExtraDias.AsString);
//            Ini.WriteString(vHorasExtra, 'TipoHoras', adoqryHorasExtraTipoHoras.AsString);
//            Ini.WriteString(vHorasExtra, 'HorasExtra', adoqryHorasExtraHorasExtra.AsString);
//            Ini.WriteString(vHorasExtra, 'ImportePagado', FormatBcd(cFormatFloat, adoqryHorasExtraImportePagado.Value));
//            adoqryHorasExtra.Next;
//          end;
//        finally
//          adoqryHorasExtra.Close;
//        end;
            adoqryPercepciones.Next;
          end;
        finally
          adoqryPercepciones.Close;
        end;
//[nomJubilacionPensionRetiro]
//TotalUnaExhibicion=
//TotalParcialidad=
//MontoDiario=
//IngresoAcumulable=
//IngresoNoAcumulable=

//[nomSeparacionIndemnizacion]
//TotalPagado=
//NumAosServicio=
//UltimoSueldoMensOrd=
//IngresoAcumulable=
//IngresoNoAcumulable=
//            if (adoqOtrosPagosTIPO.AsString = '023') or (adoqOtrosPagosTIPO.AsString = '025') then
        if (adoqryCFDITotalSeparacionIndemnizacion.AsFloat <> 0) then
        begin
          Ini.WriteString('nomSeparacionIndemnizacion', 'TotalPagado', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISI_TotalPagado.Value));
          Ini.WriteString('nomSeparacionIndemnizacion', 'NumAosServicio', IntToStr(adoqryCFDISI_NumAniosServicio.Value));
          Ini.WriteString('nomSeparacionIndemnizacion', 'UltimoSueldoMensOrd', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISI_UltimoSueldoMensOrd.Value));
          Ini.WriteString('nomSeparacionIndemnizacion', 'IngresoAcumulable', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISI_IngresoAcumulable.Value));
          Ini.WriteString('nomSeparacionIndemnizacion', 'IngresoNoAcumulable', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISI_IngresoNoAcumulable.Value));
        end;
        //[nomDeducciones]
        if (adoqryCFDITotalOtrasDeducciones.AsFloat <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalOtrasDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalOtrasDeducciones.AsFloat));
        if (adoqryCFDITotalImpuestosRetenidos.AsFloat <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITotalImpuestosRetenidos.AsFloat));
        //[nomDeducciones1]
        vCountDeducciones := 0;
        adoqryDeducciones.Close;
        adoqryDeducciones.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqryDeducciones.Open;
        try
          while not adoqryDeducciones.Eof do
          begin
            Inc(vCountDeducciones);
            vDeducciones := cDeducciones + IntToStr(vCountDeducciones);
            Ini.WriteString(vDeducciones, 'TipoDeduccion', adoqryDeduccionesTipo.AsString);
            Ini.WriteString(vDeducciones, 'Clave', adoqryDeduccionesClave.AsString);
            Ini.WriteString(vDeducciones, 'Concepto', Remplazar(adoqryDeduccionesConcepto.AsString));
            Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN, adoqryDeduccionesImporte.AsFloat));
            adoqryDeducciones.Next;
          end;
        finally
          adoqryDeducciones.Close;
        end;
        //[nomOtrosPagos1]
        vCountOtrosPagos := 0;
        adoqOtrosPagos.Close;
        adoqOtrosPagos.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqOtrosPagos.Open;
        try
          while not adoqOtrosPagos.Eof do
          begin
            Inc(vCountOtrosPagos);
            vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
            Ini.WriteString(vOtrosPagos, 'TipoOtroPago', adoqOtrosPagosTipo.AsString);
            Ini.WriteString(vOtrosPagos, 'Clave', adoqOtrosPagosClave.AsString);
            Ini.WriteString(vOtrosPagos, 'Concepto', Remplazar(adoqOtrosPagosConcepto.AsString));
            Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN, adoqOtrosPagosImporte.AsFloat));
            if adoqOtrosPagosTIPO.AsString = '002' then
              Ini.WriteString(vOtrosPagos, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISubsidioCausado.Value));
//            SaldoAFavor=
//            Ao=
//            RemanenteSalFav=
            adoqOtrosPagos.Next;
          end;
        finally
          adoqOtrosPagos.Close;
        end;

//        //[nomIncapacidad1]
//        vCountIncapacidad := 0;
//        adoqryIncapacidades.Close;
//        adoqryIncapacidades.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
//        adoqryIncapacidades.Open;
//        try
//          while not adoqryIncapacidades.Eof do
//          begin
//            Inc(vCountIncapacidad);
//            vIncapacidad := cIncapacidad + IntToStr(vCountIncapacidad);
//            Ini.WriteString(vIncapacidad, 'DiasIncapacidad', FloatToStr(adoqryIncapacidadesDiasIncapacidad.Value));
//            Ini.WriteString(vIncapacidad, 'TipoIncapacidad', adoqryIncapacidadesTipoIncapacidad.AsString);
//            Ini.WriteString(vIncapacidad, 'Descuento', FormatBcd(cFormatFloat, adoqryIncapacidadesDescuento.Value));
//            adoqryIncapacidades.Next;
//          end;
//        finally
//          adoqryIncapacidades.Close;
//        end;
      finally
        Ini.Free;
      end;
      Inc(vCount);
      ShowProgress(vCount,vCountTotal);
      adoqryCFDI.Next;
    end;
  finally
    adoqryCFDI.Close;
    ShowProgress(0,0);
    FormatSettings.DateSeparator := FDateSeparator;
  end;
end;

procedure TdmInterva.SetEmisorNombre(const Value: string);
begin
  FEmisorNombre := Value;
end;

procedure TdmInterva.SetEmisorRegimenFiscal(const Value: string);
begin
  FEmisorRegimenFiscal := Value;
end;

procedure TdmInterva.SetEmisorRFC(const Value: string);
begin
  FEmisorRFC := Value;
end;

procedure TdmInterva.SetLugarExpedicion(const Value: string);
begin
  FLugarExpedicion := Value;
end;

procedure TdmInterva.SetRegistroPatronal(const Value: string);
begin
  FRegistroPatronal := Value;
end;

end.
