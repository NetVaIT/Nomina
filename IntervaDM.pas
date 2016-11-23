unit IntervaDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  Data.FmtBcd, FacturaTipos;

const
  cBitacora = 'C:\Users\hucj1e3.FG\AppData\Local\Temp\bitacora de proceso.txt';
  cConceptos = 'Concepto';
  cPercepciones = 'nomPercepciones';
  cDeducciones = 'nomDeducciones';
  cIncapacidad = 'nomIncapacidad';
  cHorasExtra = 'nomHorasExtra';
  cFormatFloat = '0.00####';

type
  TdmInterva = class(TDataModule)
    adoqryCFDI: TADOQuery;
    adoqryCFDIID: TLargeintField;
    adoqryCFDICFDCFDILINK: TLargeintField;
    adoqryCFDIIDCFDINomina: TLargeintField;
    adoqryCFDISERIE: TStringField;
    adoqryCFDIFOLIO: TStringField;
    adoqryCFDIFORMADEPAGO: TStringField;
    adoqryCFDISUBTOTAL: TBCDField;
    adoqryCFDIDESCUENTO: TBCDField;
    adoqryCFDIMOTIVODESCUENTO: TStringField;
    adoqryCFDITOTAL: TBCDField;
    adoqryCFDIMETODODEPAGO: TStringField;
    adoqryCFDITIPODECOMPROBANTE: TStringField;
    adoqryCFDILugarExpedicion: TStringField;
    adoqryCFDIRFCEMISOR: TStringField;
    adoqryCFDIREGIMENFISCAL: TStringField;
    adoqryCFDIRFCRECEPTOR: TStringField;
    adoqryCFDIRAZONSOCIALRECEPTOR: TStringField;
    adoqryCFDIPAISDMRECEPTOR: TStringField;
    adoqryCFDITOTALIMPUESTORETENIDO: TBCDField;
    adoqryCFDITOTALIMPUESTOTRASLADADO: TBCDField;
    adoqryCFDIRAZONSOCIALEMISOR: TStringField;
    adoqryCFDIFECHA: TDateTimeField;
    adoqryCFDIMONEDA: TStringField;
    adoqryCFDITIPOCAMBIO: TStringField;
    adoqryCFDINUMCTAPAGO: TStringField;
    adoqryCFDIVersion: TStringField;
    adoqryCFDIRegistroPatronal: TStringField;
    adoqryCFDINumEmpleado: TStringField;
    adoqryCFDICURP: TStringField;
    adoqryCFDITipoRegimen: TIntegerField;
    adoqryCFDINumSeguridadSocial: TStringField;
    adoqryCFDIFechaPago: TDateTimeField;
    adoqryCFDIFechaInicialPago: TDateTimeField;
    adoqryCFDIFechaFinalPago: TDateTimeField;
    adoqryCFDINumDiasPagados: TFloatField;
    adoqryCFDIDepartamento: TStringField;
    adoqryCFDICLABE: TStringField;
    adoqryCFDIBanco: TStringField;
    adoqryCFDIFechaInicioRelLaboral: TDateTimeField;
    adoqryCFDIAntiguedad: TIntegerField;
    adoqryCFDIPuesto: TStringField;
    adoqryCFDITipoContrato: TStringField;
    adoqryCFDITipoJornada: TStringField;
    adoqryCFDIPeriodicidadPago: TStringField;
    adoqryCFDISalarioBaseCotApor: TFMTBCDField;
    adoqryCFDIRiesgoPuesto: TIntegerField;
    adoqryCFDISalarioDiarioIntegrado: TFMTBCDField;
    adoqryConceptos: TADOQuery;
    adoqryConceptosID: TLargeintField;
    adoqryConceptosCANTIDAD: TBCDField;
    adoqryConceptosUNIDAD: TStringField;
    adoqryConceptosCLAVE: TStringField;
    adoqryConceptosVALORUNITARIO: TBCDField;
    adoqryConceptosIMPORTE: TBCDField;
    adoqryConceptosDESCRIPCION: TMemoField;
    adoqryPercepciones: TADOQuery;
    adoqryDeducciones: TADOQuery;
    adoqryIncapacidades: TADOQuery;
    adoqryHorasExtra: TADOQuery;
    adoqryPercepcionesIdCFDIConceptoNomina: TLargeintField;
    adoqryPercepcionesTipoPer_TipoDed: TStringField;
    adoqryPercepcionesClave: TStringField;
    adoqryPercepcionesConcepto: TStringField;
    adoqryPercepcionesImporteGravado: TFMTBCDField;
    adoqryPercepcionesImporteExento: TFMTBCDField;
    adoqryDeduccionesIdCFDIConceptoNomina: TLargeintField;
    adoqryDeduccionesTipoPer_TipoDed: TStringField;
    adoqryDeduccionesClave: TStringField;
    adoqryDeduccionesConcepto: TStringField;
    adoqryDeduccionesImporteGravado: TFMTBCDField;
    adoqryDeduccionesImporteExento: TFMTBCDField;
    adoqryIncapacidadesIdCFDIIncapacidadNomina: TAutoIncField;
    adoqryIncapacidadesDiasIncapacidad: TFloatField;
    adoqryIncapacidadesTipoIncapacidad: TIntegerField;
    adoqryIncapacidadesDescuento: TFMTBCDField;
    adoqryHorasExtraIDCFDIHoraExtraNomina: TAutoIncField;
    adoqryHorasExtraDias: TIntegerField;
    adoqryHorasExtraTipoHoras: TStringField;
    adoqryHorasExtraHorasExtra: TIntegerField;
    adoqryHorasExtraImportePagado: TFMTBCDField;
    adoqryCFDITotalGravadoPercepcion: TFMTBCDField;
    adoqryCFDITotalExentoPercepcion: TFMTBCDField;
    adoqryCFDITotalGravadoDeduccion: TFMTBCDField;
    adoqryCFDITotalExentoDeduccion: TFMTBCDField;
    adoqryNominaCount: TADOQuery;
    adoqryNominaCountCUENTA: TIntegerField;
    adoqryCFDIOrigen: TIntegerField;
    adoqryCFDICALLEDMEMISOR: TStringField;
    adoqryCFDINUMEXTDMEMISOR: TStringField;
    adoqryCFDINUMINTDMEMISOR: TStringField;
    adoqryCFDICOLONIADMEMISOR: TStringField;
    adoqryCFDILOCALIDADDMEMISOR: TStringField;
    adoqryCFDIMUNICIPIODMEMISOR: TStringField;
    adoqryCFDIESTADODMEMISOR: TStringField;
    adoqryCFDIPAISDMEMISOR: TStringField;
    adoqryCFDICODIGOPOSTALDMEMISOR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    FCertificado: TFECertificado;
    procedure CrearINI(pCDirINI, pCDirXML: string);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _Utils;

{$R *.dfm}

{ TdmInterva }

procedure TdmInterva.CrearINI(pCDirINI, pCDirXML: string);
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
  vCountDeducciones: Integer;
  vDeducciones: string;
  vCountIncapacidad: Integer;
  vIncapacidad: string;
  vCountHorasExtra: Integer;
  vHorasExtra: string;
begin
  FDateSeparator := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '-';
  vCount := 0;
  adoqryNominaCount.Close;
  adoqryNominaCount.Open;
  vCountTotal:= adoqryNominaCountCUENTA.Value;
  adoqryNominaCount.Close;

  adoqryCFDI.Close;
  adoqryCFDI.Open;
  try
    while not adoqryCFDI.Eof do
    begin
      ID := adoqryCFDIRFCRECEPTOR.AsString + '_' + FloatToStr(adoqryCFDIID.Value);
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
        Ini.WriteString('Comprobante', 'Version', '3.2');
        Ini.WriteString('Comprobante', 'Serie', adoqryCFDISERIE.AsString);
        Ini.WriteString('Comprobante', 'Folio', adoqryCFDIFOLIO.AsString);
        Ini.WriteString('Comprobante', 'FormaDePago', adoqryCFDIFORMADEPAGO.AsString);
        Ini.WriteString('Comprobante', 'SubTotal', FormatFloat(cFormatFloat, adoqryCFDISUBTOTAL.Value));
        Ini.WriteString('Comprobante', 'Descuento', FormatFloat(cFormatFloat,adoqryCFDIDESCUENTO.Value));
        Ini.WriteString('Comprobante', 'MotivoDescuento', adoqryCFDIMOTIVODESCUENTO.AsString);
        Ini.WriteString('Comprobante', 'Total', FormatFloat(cFormatFloat, adoqryCFDITOTAL.Value));
        Ini.WriteString('Comprobante', 'MetodoDePago', adoqryCFDIMETODODEPAGO.AsString);
        Ini.WriteString('Comprobante', 'TipoDeComprobante', adoqryCFDITIPODECOMPROBANTE.AsString);
        Ini.WriteString('Comprobante', 'LugarExpedicion', adoqryCFDILugarExpedicion.AsString);
        //[Emisor]
        Ini.WriteString('Emisor', 'Rfc', adoqryCFDIRFCEMISOR.AsString);
        Ini.WriteString('Emisor', 'Nombre', adoqryCFDIRAZONSOCIALEMISOR.AsString);
        Ini.WriteString('Emisor', 'Calle', adoqryCFDICALLEDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'NoExterior', adoqryCFDINUMEXTDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'NoInterior', adoqryCFDINUMINTDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Colonia', adoqryCFDICOLONIADMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Localidad', adoqryCFDILOCALIDADDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Municipio', adoqryCFDIMUNICIPIODMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Estado', adoqryCFDIESTADODMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Pais', adoqryCFDIPAISDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'CodigoPostal', adoqryCFDICODIGOPOSTALDMEMISOR.AsString);
        Ini.WriteString('Emisor', 'Regimen', adoqryCFDIREGIMENFISCAL.AsString);
        //[Receptor]
        Ini.WriteString('Receptor', 'Rfc', adoqryCFDIRFCRECEPTOR.AsString);
        Ini.WriteString('Receptor', 'Nombre', adoqryCFDIRAZONSOCIALRECEPTOR.AsString);
        Ini.WriteString('Receptor', 'Pais', adoqryCFDIPAISDMRECEPTOR.AsString);
        //[Concepto1]
        vCountConceptos := 0;
        adoqryConceptos.Close;
        adoqryConceptos.Parameters.ParamByName('IDCFD').Value := adoqryCFDIID.Value;
        adoqryConceptos.Open;
        try
          while not adoqryConceptos.Eof do
          begin
            Inc(vCountConceptos);
            vConceptos := cConceptos + IntToStr(vCountConceptos);
            Ini.WriteString(vConceptos, 'Cantidad', FloatToStr(adoqryConceptosCANTIDAD.Value));
            Ini.WriteString(vConceptos, 'Unidad', adoqryConceptosUNIDAD.AsString);
            Ini.WriteString(vConceptos, 'Descripcion', adoqryConceptosDESCRIPCION.AsString);
            Ini.WriteString(vConceptos, 'ValorUnitario', FormatFloat(cFormatFloat, adoqryConceptosVALORUNITARIO.Value));
            Ini.WriteString(vConceptos, 'Importe', FormatFloat(cFormatFloat,adoqryConceptosIMPORTE.Value));
            adoqryConceptos.Next;
          end;
        finally
          adoqryConceptos.Close;
        end;
        //[Impuestos]
        if adoqryCFDITOTALIMPUESTORETENIDO.Value <> 0 then
        begin
          Ini.WriteString('Impuestos', 'TotalImpuestosRetenidos', FormatFloat(cFormatFloat, adoqryCFDITOTALIMPUESTORETENIDO.Value));
          Ini.WriteString('Impuestos', 'ISRRetenido', FormatFloat(cFormatFloat, adoqryCFDITOTALIMPUESTORETENIDO.Value));
        end;
        //[ComplementoNomina]
        Ini.WriteString('ComplementoNomina', 'RegistroPatronal', adoqryCFDIRegistroPatronal.AsString);
        Ini.WriteString('ComplementoNomina', 'NumEmpleado', adoqryCFDINumEmpleado.AsString);
        Ini.WriteString('ComplementoNomina', 'CURP', adoqryCFDICURP.AsString);
        Ini.WriteString('ComplementoNomina', 'TipoRegimen', adoqryCFDITipoRegimen.AsString);
        Ini.WriteString('ComplementoNomina', 'NumSeguridadSocial', adoqryCFDINumSeguridadSocial.AsString);
        Ini.WriteString('ComplementoNomina', 'FechaPago', vFechaPago);
        Ini.WriteString('ComplementoNomina', 'FechaInicialPago', vPagoDesde);
        Ini.WriteString('ComplementoNomina', 'FechaFinalPago', vPagoHasta);
        Ini.WriteString('ComplementoNomina', 'NumDiasPagados', adoqryCFDINumDiasPagados.AsString);
        Ini.WriteString('ComplementoNomina', 'Departamento', adoqryCFDIDepartamento.AsString);
//        Ini.WriteString('ComplementoNomina', 'CLABE', adoqryCFDICLABE.AsString);
        Ini.WriteString('ComplementoNomina', 'Banco', adoqryCFDIBanco.AsString);
        Ini.WriteString('ComplementoNomina', 'FechaInicioRelLaboral', vFechaInicioRelLaboral);
//        Ini.WriteString('ComplementoNomina', 'Antiguedad', adoqryCFDIAntiguedad.AsString);
        Ini.WriteString('ComplementoNomina', 'Puesto', adoqryCFDIPuesto.AsString);
//        Ini.WriteString('ComplementoNomina', 'TipoContrato', adoqryCFDITipoContrato.AsString);
//        Ini.WriteString('ComplementoNomina', 'TipoJornada', adoqryCFDITipoJornada.AsString);
        Ini.WriteString('ComplementoNomina', 'PeriodicidadPago', adoqryCFDIPeriodicidadPago.AsString);
        Ini.WriteString('ComplementoNomina', 'SalarioBaseCotApor', adoqryCFDISalarioBaseCotApor.AsString);
//        Ini.WriteString('ComplementoNomina', 'RiesgoPuesto', adoqryCFDIRiesgoPuesto.AsString);
        Ini.WriteString('ComplementoNomina', 'SalarioDiarioIntegrado', adoqryCFDISalarioDiarioIntegrado.AsString);
        //[nomPercepciones]
        if (adoqryCFDITotalGravadoPercepcion.Value <> 0) or (adoqryCFDITotalExentoPercepcion.Value <> 0) then
        begin
          Ini.WriteString(cPercepciones, 'TotalGravado', FormatBcd(cFormatFloat, adoqryCFDITotalGravadoPercepcion.Value));
          Ini.WriteString(cPercepciones, 'TotalExento', FormatBcd(cFormatFloat, adoqryCFDITotalExentoPercepcion.Value));
        end;
//        //[nomPercepciones1]
        vCountPercepciones := 0;
        adoqryPercepciones.Close;
        adoqryPercepciones.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqryPercepciones.Open;
        try
          while not adoqryPercepciones.Eof do
          begin
            Inc(vCountPercepciones);
            vPercepciones := cPercepciones + IntToStr(vCountPercepciones);
            Ini.WriteString(vPercepciones, 'TipoPercepcion', adoqryPercepcionesTipoPer_TipoDed.AsString);
            Ini.WriteString(vPercepciones, 'Clave', adoqryPercepcionesClave.AsString);
            Ini.WriteString(vPercepciones, 'Concepto', adoqryPercepcionesConcepto.AsString);
            Ini.WriteString(vPercepciones, 'ImporteGravado', FormatBcd(cFormatFloat, adoqryPercepcionesImporteGravado.value));
            Ini.WriteString(vPercepciones, 'ImporteExento', FormatBcd(cFormatFloat, adoqryPercepcionesImporteExento.Value));
            adoqryPercepciones.Next;
          end;
        finally
          adoqryPercepciones.Close;
        end;
        if (adoqryCFDIOrigen.Value = 40) then
        begin
          Inc(vCountPercepciones);
          vPercepciones := cPercepciones + IntToStr(vCountPercepciones);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '040');
          Ini.WriteString(vPercepciones, 'Clave', '000');
          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS LOCALES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        if (adoqryCFDIOrigen.Value = 41) then
        begin
          Inc(vCountPercepciones);
          vPercepciones := cPercepciones + IntToStr(vCountPercepciones);
          Ini.WriteString(vPercepciones, 'TipoPercepcion', '041');
          Ini.WriteString(vPercepciones, 'Clave', '000');
          Ini.WriteString(vPercepciones, 'Concepto', 'INGRESOS FEDERALES');
          Ini.WriteString(vPercepciones, 'ImporteGravado', '0.00');
          Ini.WriteString(vPercepciones, 'ImporteExento', '0.00');
        end;
        //[nomDeducciones]
        if (adoqryCFDITotalGravadoDeduccion.Value <> 0) or (adoqryCFDITotalExentoDeduccion.Value <> 0) then
        begin
          Ini.WriteString('nomDeducciones', 'TotalGravado', FormatBcd(cFormatFloat, adoqryCFDITotalGravadoDeduccion.Value));
          Ini.WriteString('nomDeducciones', 'TotalExento', FormatBcd(cFormatFloat, adoqryCFDITotalExentoDeduccion.Value));
        end;
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
            Ini.WriteString(vDeducciones, 'TipoDeduccion', adoqryDeduccionesTipoPer_TipoDed.AsString);
            Ini.WriteString(vDeducciones, 'Clave', adoqryDeduccionesClave.AsString);
            Ini.WriteString(vDeducciones, 'Concepto', adoqryDeduccionesConcepto.AsString);
            Ini.WriteString(vDeducciones, 'ImporteGravado', FormatBcd(cFormatFloat, adoqryDeduccionesImporteGravado.Value));
            Ini.WriteString(vDeducciones, 'ImporteExento', FormatBcd(cFormatFloat, adoqryDeduccionesImporteExento.Value));
            adoqryDeducciones.Next;
          end;
        finally
          adoqryDeducciones.Close;
        end;
        //[nomIncapacidad1]
        vCountIncapacidad := 0;
        adoqryIncapacidades.Close;
        adoqryIncapacidades.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqryIncapacidades.Open;
        try
          while not adoqryIncapacidades.Eof do
          begin
            Inc(vCountIncapacidad);
            vIncapacidad := cIncapacidad + IntToStr(vCountIncapacidad);
            Ini.WriteString(vIncapacidad, 'DiasIncapacidad', FloatToStr(adoqryIncapacidadesDiasIncapacidad.Value));
            Ini.WriteString(vIncapacidad, 'TipoIncapacidad', adoqryIncapacidadesTipoIncapacidad.AsString);
            Ini.WriteString(vIncapacidad, 'Descuento', FormatBcd(cFormatFloat, adoqryIncapacidadesDescuento.Value));
            adoqryIncapacidades.Next;
          end;
        finally
          adoqryIncapacidades.Close;
        end;
        //[nomHorasExtra1]
        vCountHorasExtra := 0;
        adoqryHorasExtra.Close;
        adoqryHorasExtra.Parameters.ParamByName('IdCFDINomina').Value := adoqryCFDIIDCFDINomina.Value;
        adoqryHorasExtra.Open;
        try
          while not adoqryHorasExtra.Eof do
          begin
            Inc(vCountHorasExtra);
            vHorasExtra := cHorasExtra + IntToStr(vCountHorasExtra);
            Ini.WriteString(vHorasExtra, 'Dias', adoqryHorasExtraDias.AsString);
            Ini.WriteString(vHorasExtra, 'TipoHoras', adoqryHorasExtraTipoHoras.AsString);
            Ini.WriteString(vHorasExtra, 'HorasExtra', adoqryHorasExtraHorasExtra.AsString);
            Ini.WriteString(vHorasExtra, 'ImportePagado', FormatBcd(cFormatFloat, adoqryHorasExtraImportePagado.Value));
            adoqryHorasExtra.Next;
          end;
        finally
          adoqryHorasExtra.Close;
        end;
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

end.
