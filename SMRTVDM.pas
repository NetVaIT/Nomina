unit SMRTVDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  FacturaTipos, dxmdaset;

const
  cBitacora = 'C:\Temp\bitacora de proceso.txt';
  cPercepciones = 'nomPercepciones';
  cDeducciones = 'nomDeducciones';
  cFormatFloat = '0.00####';

type
  TdmSMRTV = class(TDataModule)
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
    adoqryNominaC106: TFloatField;
    adoqryNominaC114: TFloatField;
    adoqryNominaC115: TFloatField;
    adoqryNominaC116: TFloatField;
    adoqryNominaC119: TFloatField;
    adoqryNominaC122: TFloatField;
    adoqryNominaC127: TFloatField;
    adoqryNominaC128: TFloatField;
    adoqryNominaC1AD: TFloatField;
    adoqryNominaC1AJ: TFloatField;
    adoqryNominaC1AF: TFloatField;
    adoqryNominaC1EF: TFloatField;
    adoqryNominaC1PE: TFloatField;
    adoqryNominaC1CH: TFloatField;
    adoqryNominaC1DF: TFloatField;
    adoqryNominaC1VP: TFloatField;
    adoqryNominaC1CU: TFloatField;
    adoqryNominaC1CP: TFloatField;
    adoqryNominaC1PL: TFloatField;
    adoqryNominaC1LC: TFloatField;
    adoqryNominaC1SC: TFloatField;
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
    adoqryNominaC2U3: TFloatField;
    adoqryNominaC2U8: TFloatField;
    adoqryNominaC2V1: TFloatField;
    adoqryNominaC2V7: TFloatField;
    adoqryNominaC2W2: TFloatField;
    adoqryNominaC2W4: TFloatField;
    adoqryNominaC2Y2: TFloatField;
    adoqryNominaC2Y4: TFloatField;
    adoqryNominaC2Y5: TFloatField;
    adoqryNominaC2Y6: TFloatField;
    adoqryNominaC2Y8: TFloatField;
    adoqryNominaC2Z5: TFloatField;
    adoqryNominaC2Z8: TFloatField;
    adoqryNominaTOTPER: TFloatField;
    adoqryNominaTOTDED: TFloatField;
    adoqryNominaTOTLIQ: TFloatField;
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

{ TdmRTV }

procedure TdmSMRTV.CargarTipos;
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

procedure TdmSMRTV.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
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
        vCampoFin := 56;
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
        vCampoIni := 57;
        vCampoFin := 94;
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

procedure TdmSMRTV.DataModuleCreate(Sender: TObject);
begin
  CargarTipos;
end;

end.
