unit COBAEMDM;

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
  cHorasExtra = 'HorasExtra';
//  cFormatFloat = '0.00####';
  cCFDI_ImporteMXN = '0.00';
  cCFDI_NumDiasPagados = '0.000';

type
  TdmCOBAEM = class(TDataModule)
    adoqryCFDI: TADOQuery;
    adoqryPercepciones: TADOQuery;
    adoqryDeducciones: TADOQuery;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryCFDISubtotal: TFloatField;
    adoqryCFDIDescuento: TFloatField;
    adoqryCFDITotal: TFloatField;
    adoqryCFDIRECEPTOR_NOMBRE: TWideStringField;
    adoqryCFDIRECEPTOR_RFC: TWideStringField;
    adoqryCFDIConceptoValorUnitario: TFloatField;
    adoqryCFDIConceptoImporte: TFloatField;
    adoqryCFDIConceptoDescuento: TFloatField;
    adoqryCFDITIPO_NOMINA: TWideStringField;
    adoqryCFDIFECHA_PAGO: TDateTimeField;
    adoqryCFDIFECHA_INICIAL_PAGO: TDateTimeField;
    adoqryCFDIFECHA_FINAL_PAGO: TDateTimeField;
    adoqryCFDIDIAS_PAGADOS: TFloatField;
    adoqryCFDITOTAL_PERCEPCIONES: TFloatField;
    adoqryCFDITOTAL_DEDUCCIONES: TFloatField;
    adoqryCFDITOTAL_OTROS_PAGOS: TFloatField;
    adoqryCFDIORIGEN_RECURSO: TWideStringField;
    adoqryCFDIMONTO_RECURSO_PROPIO: TFloatField;
    adoqryCFDIRECEPTOR_CURP: TWideStringField;
    adoqryCFDINSS: TWideStringField;
    adoqryCFDIFECHA_INGRESO: TDateTimeField;
    adoqryCFDIANTIGUEDAD: TStringField;
    adoqryCFDITIPO_CONTRATO: TWideStringField;
    adoqryCFDISINDICALIZADO: TWideStringField;
    adoqryCFDITIPO_JORNADA: TWideStringField;
    adoqryCFDITIPO_REGIMEN: TWideStringField;
    adoqryCFDINO_EMPLEADO: TWideStringField;
    adoqryCFDIDEPARTAMENTO: TWideStringField;
    adoqryCFDIPUESTO: TWideStringField;
    adoqryCFDIRIESGO_PUESTO: TWideStringField;
    adoqryCFDIPERIORICIDAD_PAGO: TWideStringField;
    adoqryCFDISALARIO_BASE: TFloatField;
    adoqryCFDISALARIO_DIARIO_INTEGRADO: TFloatField;
    adoqryCFDIENTIDAD_FEDERATIVA: TWideStringField;
    adoqryCFDITOTAL_SUELDOS: TFloatField;
    adoqryCFDITOTAL_GRAVADO: TFloatField;
    adoqryCFDITOTAL_EXENTO: TFloatField;
    adoqryCFDITOTAL_OTRAS_DEDUCCIONES: TFloatField;
    adoqryCFDITOTAL_IMPUESTOS_RETENIDOS: TFloatField;
    adoqryCFDICT: TWideStringField;
    adoqryCFDIFILIACION: TWideStringField;
    adoqryCFDISUBSIDIO_CAUSADO: TFloatField;
    adoqryCFDITOTAL_LIQUIDO: TFloatField;
    adoqryCFDIREGISTRO_PATRONAL: TWideStringField;
    adoqryPercepcionesID_CONCEPTO: TAutoIncField;
    adoqryPercepcionesTIPO: TWideStringField;
    adoqryPercepcionesCLAVE: TWideStringField;
    adoqryPercepcionesCONCEPTO: TWideStringField;
    adoqryPercepcionesIMPORTE: TFloatField;
    adoqryPercepcionesIMPORTE_EXENTO: TFloatField;
    adoqryDeduccionesID_CONCEPTO: TAutoIncField;
    adoqryDeduccionesTIPO: TWideStringField;
    adoqryDeduccionesCLAVE: TWideStringField;
    adoqryDeduccionesCONCEPTO: TWideStringField;
    adoqryDeduccionesIMPORTE: TFloatField;
    adoqryDeduccionesIMPORTE_EXENTO: TFloatField;
    adoqOtrosPagos: TADOQuery;
    adoqOtrosPagosID_CONCEPTO: TAutoIncField;
    adoqOtrosPagosTIPO: TWideStringField;
    adoqOtrosPagosCLAVE: TWideStringField;
    adoqOtrosPagosCONCEPTO: TWideStringField;
    adoqOtrosPagosIMPORTE: TFloatField;
    adoqOtrosPagosIMPORTE_EXENTO: TFloatField;
    adoqHorasExtra: TADOQuery;
    adoqHorasExtraID_CONCEPTO: TIntegerField;
    adoqHorasExtraTipo: TStringField;
    adoqHorasExtraDias: TFloatField;
    adoqHorasExtraHorasExtra: TFloatField;
    adoqHorasExtraImporte: TFloatField;
    adoqryCFDITipoRelacion: TStringField;
    adoqryCFDICfdiRelacionado1: TStringField;
    adoqryCFDIID_CFDI: TAutoIncField;
  private
    { Private declarations }
    FEmisorNombre: string;
    FEmisorRFC: string;
    FLugarExpedicion: string;
    FRegistroPatronal: string;
    FEmisorRegimenFiscal: string;
    procedure SetEmisorNombre(const Value: string);
    procedure SetEmisorRFC(const Value: string);
    procedure SetLugarExpedicion(const Value: string);
    procedure SetRegistroPatronal(const Value: string);
    procedure SetEmisorRegimenFiscal(const Value: string);
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

{ TdmCOBAEM }

procedure TdmCOBAEM.CrearINI(pAnio, pMes: Integer; pFiltrar: Boolean; pCDirINI,
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
//  vCountIncapacidad: Integer;
//  vIncapacidad: string;
//  vCountHorasExtra: Integer;
//  vHorasExtra: string;

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
      ID := adoqryCFDIRECEPTOR_RFC.AsString + '_' + FloatToStr(adoqryCFDIID_CFDI.Value);
  FormatSettings.DateSeparator:= '-';
      DateTimeToString(vFechaPago, 'yyyy/mm/dd', adoqryCFDIFECHA_PAGO.Value);
      DateTimeToString(vPagoDesde, 'yyyy/mm/dd', adoqryCFDIFECHA_INICIAL_PAGO.Value);
      DateTimeToString(vPagoHasta, 'yyyy/mm/dd', adoqryCFDIFECHA_FINAL_PAGO.Value);
      DateTimeToString(vFechaInicioRelLaboral, 'yyyy/mm/dd', adoqryCFDIFECHA_INGRESO.Value);
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
//        Ini.WriteString('Comprobante', 'Serie', adoqryCFDISERIE.AsString);
//        Ini.WriteString('Comprobante', 'Folio', adoqryCFDIFOLIO.AsString);
        Ini.WriteString('Comprobante', 'FormaPago', '99');
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISUBTOTAL.Value));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIDESCUENTO.Value));
        Ini.WriteString('Comprobante', 'Moneda', 'MXN');
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cCFDI_ImporteMXN, adoqryCFDITOTAL.Value));
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
          Ini.WriteString('Receptor', 'Rfc', adoqryCFDIRECEPTOR_RFC.AsString);
        {$ENDIF}
        Ini.WriteString('Receptor', 'Nombre', adoqryCFDIRECEPTOR_NOMBRE.AsString);
        Ini.WriteString('Receptor', 'UsoCFDI', 'P01');
        //[Concepto1]
        Ini.WriteString('Concepto1', 'ClaveProdServ', '84111505');
        Ini.WriteString('Concepto1', 'Cantidad', '1');
        Ini.WriteString('Concepto1', 'ClaveUnidad', 'ACT');
        Ini.WriteString('Concepto1', 'Descripcion', 'Pago de nómina');
        Ini.WriteString('Concepto1', 'ValorUnitario', FormatFloat(cCFDI_ImporteMXN, adoqryCFDIConceptoValorUnitario.Value));
        Ini.WriteString('Concepto1', 'Importe', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIConceptoImporte.Value));
        Ini.WriteString('Concepto1', 'Descuento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIConceptoDescuento.Value));
        //[Nomina]
        Ini.WriteString('Nomina', 'TipoNomina', adoqryCFDITIPO_NOMINA.AsString);
        Ini.WriteString('Nomina', 'FechaPago', vFechaPago);
        Ini.WriteString('Nomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('Nomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('Nomina', 'NumDiasPagados', FormatFloat(cCFDI_NumDiasPagados,adoqryCFDIDIAS_PAGADOS.Value));
        if (adoqryCFDITOTAL_PERCEPCIONES.Value <> 0) then
          Ini.WriteString('Nomina', 'TotalPercepciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_PERCEPCIONES.Value));
        if (adoqryCFDITOTAL_DEDUCCIONES.Value <> 0) then
          Ini.WriteString('Nomina', 'TotalDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_DEDUCCIONES.Value));
        if (adoqryCFDITOTAL_OTROS_PAGOS.Value <> 0) then
          Ini.WriteString('Nomina', 'TotalOtrosPagos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_OTROS_PAGOS.Value));
        //[nomEmisor]
//        Ini.WriteString('nomEmisor', 'CURP', adoqryNominanomEmisorCURP.AsString);
//        Ini.WriteString('nomEmisor', 'RegistroPatronal', RegistroPatronal);
        Ini.WriteString('nomEmisor', 'RegistroPatronal', adoqryCFDIREGISTRO_PATRONAL.AsString);
//        Ini.WriteString('nomEmisor', 'RfcPatronOrigen', adoqryNominanomEmisorRfcPatronOrigen.AsString);
        {$IFDEF DEBUG}

        {$ELSE}
          Ini.WriteString('nomEmisor', 'OrigenRecurso', adoqryCFDIORIGEN_RECURSO.AsString);
          if adoqryCFDIORIGEN_RECURSO.AsString = 'IM' then
            Ini.WriteString('nomEmisor', 'MontoRecursoPropio', FormatFloat(cCFDI_ImporteMXN,adoqryCFDIMONTO_RECURSO_PROPIO.Value));
        {$ENDIF}
        //[nomReceptor]
        Ini.WriteString('nomReceptor', 'CURP', adoqryCFDIRECEPTOR_CURP.AsString);
        if not adoqryCFDINSS.IsNull then
          Ini.WriteString('nomReceptor', 'NumSeguridadSocial', adoqryCFDINSS.AsString);
        if not adoqryCFDIFECHA_INGRESO.IsNull then
        begin
          Ini.WriteString('nomReceptor', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
          Ini.WriteString('nomReceptor', 'Antigedad', adoqryCFDIANTIGUEDAD.AsString);
        end;
        Ini.WriteString('nomReceptor', 'TipoContrato', PreparaCadena(adoqryCFDITIPO_CONTRATO.AsString,'D','0',2));
        Ini.WriteString('nomReceptor', 'Sindicalizado', adoqryCFDISINDICALIZADO.AsString);
        if not adoqryCFDITIPO_JORNADA.IsNull then
          Ini.WriteString('nomReceptor', 'TipoJornada', PreparaCadena(adoqryCFDITIPO_JORNADA.AsString,'D','0',2));
        Ini.WriteString('nomReceptor', 'TipoRegimen', PreparaCadena(adoqryCFDITIPO_REGIMEN.AsString,'D','0',2));
        Ini.WriteString('nomReceptor', 'NumEmpleado', adoqryCFDINO_EMPLEADO.Value);
        Ini.WriteString('nomReceptor', 'Departamento', Remplazar(adoqryCFDIDEPARTAMENTO.AsString));
        Ini.WriteString('nomReceptor', 'Puesto', Remplazar(adoqryCFDIPUESTO.AsString));
        Ini.WriteString('nomReceptor', 'RiesgoPuesto', adoqryCFDIRIESGO_PUESTO.AsString);
        Ini.WriteString('nomReceptor', 'PeriodicidadPago', PreparaCadena(adoqryCFDIPERIORICIDAD_PAGO.AsString,'D','0',2));
//        Ini.WriteString('nomReceptor', 'Banco', adoqryNominanomEmisorBanco.AsString);
//        Ini.WriteString('nomReceptor', 'CuentaBancaria', adoqryNominanomEmisorCuentaBancaria.AsString);
        Ini.WriteString('nomReceptor', 'SalarioBaseCotApor', FormatFloat(cCFDI_ImporteMXN,adoqryCFDISALARIO_BASE.Value));
        Ini.WriteString('nomReceptor', 'SalarioDiarioIntegrado', FormatFloat(cCFDI_ImporteMXN,adoqryCFDISALARIO_DIARIO_INTEGRADO.Value));
        Ini.WriteString('nomReceptor', 'ClaveEntFed', adoqryCFDIENTIDAD_FEDERATIVA.AsString);
        //[nomSubcontratacion1]
        //RfcLabora=XAXX010101000
        //PorcentajeTiempo=50.000
        //[nomPercepciones1]
        if (adoqryCFDITOTAL_SUELDOS.Value <> 0) then
          Ini.WriteString('nomPercepciones', 'TotalSueldos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_SUELDOS.Value));
//        if (adoqryCFDITOTAL_SUELDOS.Value <> 0) then
//          Ini.WriteString('nomPercepciones', 'TotalSeparacionIndemnizacion', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_SUELDOS.Value));
//        if (adoqryCFDITOTAL_SUELDOS.Value <> 0) then
//          Ini.WriteString('nomPercepciones', 'TotalJubilacionPensionRetiro', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_SUELDOS.Value));
          Ini.WriteString('nomPercepciones', 'TotalGravado', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_GRAVADO.Value));
          Ini.WriteString('nomPercepciones', 'TotalExento', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_EXENTO.Value));
        vCountPercepciones := 0;
        adoqryPercepciones.Close;
        adoqryPercepciones.Parameters.ParamByName('ID_CFDI').Value := adoqryCFDIID_CFDI.Value;
        adoqryPercepciones.Open;
        try
          while not adoqryPercepciones.Eof do
          begin
            Inc(vCountPercepciones);
            vPercepciones := cPercepciones + IntToStr(vCountPercepciones);
            Ini.WriteString(vPercepciones, 'TipoPercepcion', adoqryPercepcionesTIPO.AsString);
            Ini.WriteString(vPercepciones, 'Clave', adoqryPercepcionesCLAVE.AsString);
            Ini.WriteString(vPercepciones, 'Concepto', Remplazar(adoqryPercepcionesCONCEPTO.AsString));
            Ini.WriteString(vPercepciones, 'ImporteGravado', FormatFloat(cCFDI_ImporteMXN, adoqryPercepcionesIMPORTE.value));
            Ini.WriteString(vPercepciones, 'ImporteExento', FormatFloat(cCFDI_ImporteMXN, adoqryPercepcionesIMPORTE_EXENTO.Value));
//            // HorasExtra
//            vCountHorasExtra := 0;
//            adoqHorasExtra.Close;
//            adoqHorasExtra.Parameters.ParamByName('ID_CONCEPTO').Value := adoqryPercepcionesID_CONCEPTO.Value;
//            adoqHorasExtra.Open;
//            try
//              while not adoqHorasExtra.Eof do
//              begin
//                Inc(vCountHorasExtra);
//                vHorasExtra := cHorasExtra + IntToStr(vCountHorasExtra);
//                Ini.WriteString(vPercepciones, vHorasExtra+'Dias', adoqHorasExtraDias.AsString);
//                Ini.WriteString(vPercepciones, vHorasExtra+'TipoHoras', adoqHorasExtraTipo.AsString);
//                Ini.WriteString(vPercepciones, vHorasExtra+'HorasExtra', adoqHorasExtraHorasExtra.AsString);
//                Ini.WriteString(vPercepciones, vHorasExtra+'ImportePagado', FormatFloat(cCFDI_ImporteMXN, adoqHorasExtraImporte.Value));
//                adoqHorasExtra.Next;
//              end;
//            finally
//              adoqHorasExtra.Close;
//            end;
            adoqryPercepciones.Next;
          end;
        finally
          adoqryPercepciones.Close;
        end;
        //[nomDeducciones]
        if (adoqryCFDITOTAL_OTRAS_DEDUCCIONES.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalOtrasDeducciones', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_OTRAS_DEDUCCIONES.Value));
        if (adoqryCFDITOTAL_IMPUESTOS_RETENIDOS.Value <> 0) then
          Ini.WriteString('nomDeducciones', 'TotalImpuestosRetenidos', FormatFloat(cCFDI_ImporteMXN,adoqryCFDITOTAL_IMPUESTOS_RETENIDOS.Value));
        //[nomDeducciones1]
        vCountDeducciones := 0;
        adoqryDeducciones.Close;
        adoqryDeducciones.Parameters.ParamByName('ID_CFDI').Value := adoqryCFDIID_CFDI.Value;
        adoqryDeducciones.Open;
        try
          while not adoqryDeducciones.Eof do
          begin
            Inc(vCountDeducciones);
            vDeducciones := cDeducciones + IntToStr(vCountDeducciones);
            Ini.WriteString(vDeducciones, 'TipoDeduccion', adoqryDeduccionesTIPO.AsString);
            Ini.WriteString(vDeducciones, 'Clave', adoqryDeduccionesCLAVE.AsString);
            Ini.WriteString(vDeducciones, 'Concepto', Remplazar(adoqryDeduccionesCONCEPTO.AsString));
            Ini.WriteString(vDeducciones, 'Importe', FormatFloat(cCFDI_ImporteMXN, adoqryDeduccionesIMPORTE.Value));
            adoqryDeducciones.Next;
          end;
        finally
          adoqryDeducciones.Close;
        end;
        //[nomOtrosPagos1]
        vCountOtrosPagos := 0;
        adoqOtrosPagos.Close;
        adoqOtrosPagos.Parameters.ParamByName('ID_CFDI').Value := adoqryCFDIID_CFDI.Value;
        adoqOtrosPagos.Open;
        try
          while not adoqOtrosPagos.Eof do
          begin
            Inc(vCountOtrosPagos);
            vOtrosPagos := cOtrosPagos + IntToStr(vCountOtrosPagos);
            Ini.WriteString(vOtrosPagos, 'TipoOtroPago', adoqOtrosPagosTIPO.AsString);
            Ini.WriteString(vOtrosPagos, 'Clave', adoqOtrosPagosCLAVE.AsString);
            Ini.WriteString(vOtrosPagos, 'Concepto', Remplazar(adoqOtrosPagosCONCEPTO.AsString));
            Ini.WriteString(vOtrosPagos, 'Importe', FormatFloat(cCFDI_ImporteMXN, adoqOtrosPagosIMPORTE.Value));
            if adoqOtrosPagosTIPO.AsString = '002' then
              Ini.WriteString(vOtrosPagos, 'SubsidioCausado', FormatFloat(cCFDI_ImporteMXN, adoqryCFDISUBSIDIO_CAUSADO.Value));
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

procedure TdmCOBAEM.SetEmisorNombre(const Value: string);
begin
  FEmisorNombre := Value;
end;

procedure TdmCOBAEM.SetEmisorRegimenFiscal(const Value: string);
begin
  FEmisorRegimenFiscal := Value;
end;

procedure TdmCOBAEM.SetEmisorRFC(const Value: string);
begin
  FEmisorRFC := Value;
end;

procedure TdmCOBAEM.SetLugarExpedicion(const Value: string);
begin
  FLugarExpedicion := Value;
end;

procedure TdmCOBAEM.SetRegistroPatronal(const Value: string);
begin
  FRegistroPatronal := Value;
end;

end.
