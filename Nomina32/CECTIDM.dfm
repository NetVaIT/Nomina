object dmCECTI: TdmCECTI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 362
  Width = 275
  object adoqryNomina: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  *'
      'FROM            v_SMRTV'
      'WHERE ComplementoNominaFechaPago is not null'
      'ORDER BY ID')
    Left = 40
    Top = 32
    object adoqryNominaID: TFloatField
      FieldName = 'ID'
    end
    object adoqryNominaFormaDePago: TStringField
      FieldName = 'FormaDePago'
      ReadOnly = True
      Size = 27
    end
    object adoqryNominaSubTotal: TFloatField
      FieldName = 'SubTotal'
    end
    object adoqryNominaDescuento: TFloatField
      FieldName = 'Descuento'
      ReadOnly = True
    end
    object adoqryNominaMotivoDescuento: TStringField
      FieldName = 'MotivoDescuento'
      ReadOnly = True
      Size = 18
    end
    object adoqryNominaTotal: TFloatField
      FieldName = 'Total'
    end
    object adoqryNominaMetodoDePago: TWideStringField
      FieldName = 'MetodoDePago'
      Size = 255
    end
    object adoqryNominaTipoDeComprobante: TStringField
      FieldName = 'TipoDeComprobante'
      ReadOnly = True
      Size = 6
    end
    object adoqryNominaLugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      ReadOnly = True
      Size = 18
    end
    object adoqryNominaEmisorRFC: TStringField
      FieldName = 'EmisorRFC'
      ReadOnly = True
      Size = 12
    end
    object adoqryNominaEmisorNombre: TStringField
      FieldName = 'EmisorNombre'
      ReadOnly = True
      Size = 40
    end
    object adoqryNominaEmisorRegimen: TStringField
      FieldName = 'EmisorRegimen'
      ReadOnly = True
      Size = 40
    end
    object adoqryNominaReceptorRFC: TWideStringField
      FieldName = 'ReceptorRFC'
      Size = 255
    end
    object adoqryNominaReceptorNombre: TWideStringField
      FieldName = 'ReceptorNombre'
      Size = 255
    end
    object adoqryNominaReceptorPais: TStringField
      FieldName = 'ReceptorPais'
      ReadOnly = True
      Size = 6
    end
    object adoqryNominaConceptoValorUnitario: TFloatField
      FieldName = 'ConceptoValorUnitario'
    end
    object adoqryNominaConceptoImporte: TFloatField
      FieldName = 'ConceptoImporte'
    end
    object adoqryNominaImpuestosISRRetenido: TFloatField
      FieldName = 'ImpuestosISRRetenido'
    end
    object adoqryNominaComplementoNominaRegistroPatronal: TStringField
      FieldName = 'ComplementoNominaRegistroPatronal'
      ReadOnly = True
      Size = 1
    end
    object adoqryNominaComplementoNominaNumEmpleado: TWideStringField
      FieldName = 'ComplementoNominaNumEmpleado'
      Size = 255
    end
    object adoqryNominaComplementoNominaCURP: TWideStringField
      FieldName = 'ComplementoNominaCURP'
      Size = 255
    end
    object adoqryNominaComplementoNominaTipoRegimen: TFloatField
      FieldName = 'ComplementoNominaTipoRegimen'
    end
    object adoqryNominaComplementoNominaNumSeguridadSocial: TWideStringField
      FieldName = 'ComplementoNominaNumSeguridadSocial'
      Size = 255
    end
    object adoqryNominaComplementoNominaFechaPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaPago'
    end
    object adoqryNominaComplementoNominaPagoDesde: TDateTimeField
      FieldName = 'ComplementoNominaPagoDesde'
    end
    object adoqryNominaComplementoNominaPagoHasta: TDateTimeField
      FieldName = 'ComplementoNominaPagoHasta'
    end
    object adoqryNominaComplementoNominaNumDiasPagados: TFloatField
      FieldName = 'ComplementoNominaNumDiasPagados'
    end
    object adoqryNominaComplementoNominaPuesto: TWideStringField
      FieldName = 'ComplementoNominaPuesto'
      Size = 255
    end
    object adoqryNominaComplementoNominaTipoContrato: TWideStringField
      FieldName = 'ComplementoNominaTipoContrato'
      Size = 255
    end
    object adoqryNominaComplementoNominaPeriodicidad: TWideStringField
      FieldName = 'ComplementoNominaPeriodicidad'
      Size = 255
    end
    object adoqryNominaPTotalGravado: TFloatField
      FieldName = 'PTotalGravado'
      ReadOnly = True
    end
    object adoqryNominaPTotalExento: TFloatField
      FieldName = 'PTotalExento'
      ReadOnly = True
    end
    object adoqryNominaDTotalGravado: TFloatField
      FieldName = 'DTotalGravado'
      ReadOnly = True
    end
    object adoqryNominaDTotalExento: TFloatField
      FieldName = 'DTotalExento'
      ReadOnly = True
    end
    object adoqryNominaC101: TFloatField
      FieldName = 'C101'
    end
    object adoqryNominaC102: TFloatField
      FieldName = 'C102'
    end
    object adoqryNominaC106: TFloatField
      FieldName = 'C106'
    end
    object adoqryNominaC114: TFloatField
      FieldName = 'C114'
    end
    object adoqryNominaC115: TFloatField
      FieldName = 'C115'
    end
    object adoqryNominaC116: TFloatField
      FieldName = 'C116'
    end
    object adoqryNominaC119: TFloatField
      FieldName = 'C119'
    end
    object adoqryNominaC122: TFloatField
      FieldName = 'C122'
    end
    object adoqryNominaC127: TFloatField
      FieldName = 'C127'
    end
    object adoqryNominaC128: TFloatField
      FieldName = 'C128'
    end
    object adoqryNominaC1AD: TFloatField
      FieldName = 'C1AD'
    end
    object adoqryNominaC1AJ: TFloatField
      FieldName = 'C1AJ'
    end
    object adoqryNominaC1AF: TFloatField
      FieldName = 'C1AF'
    end
    object adoqryNominaC1EF: TFloatField
      FieldName = 'C1EF'
    end
    object adoqryNominaC1PE: TFloatField
      FieldName = 'C1PE'
    end
    object adoqryNominaC1CH: TFloatField
      FieldName = 'C1CH'
    end
    object adoqryNominaC1DF: TFloatField
      FieldName = 'C1DF'
    end
    object adoqryNominaC1VP: TFloatField
      FieldName = 'C1VP'
    end
    object adoqryNominaC1CU: TFloatField
      FieldName = 'C1CU'
    end
    object adoqryNominaC1CP: TFloatField
      FieldName = 'C1CP'
    end
    object adoqryNominaC1PL: TFloatField
      FieldName = 'C1PL'
    end
    object adoqryNominaC1LC: TFloatField
      FieldName = 'C1LC'
    end
    object adoqryNominaC1SC: TFloatField
      FieldName = 'C1SC'
    end
    object adoqryNominaC251: TFloatField
      FieldName = 'C251'
    end
    object adoqryNominaC252: TFloatField
      FieldName = 'C252'
    end
    object adoqryNominaC253: TFloatField
      FieldName = 'C253'
    end
    object adoqryNominaC256: TFloatField
      FieldName = 'C256'
    end
    object adoqryNominaC258: TFloatField
      FieldName = 'C258'
    end
    object adoqryNominaC259: TFloatField
      FieldName = 'C259'
    end
    object adoqryNominaC262: TFloatField
      FieldName = 'C262'
    end
    object adoqryNominaC263: TFloatField
      FieldName = 'C263'
    end
    object adoqryNominaC264: TFloatField
      FieldName = 'C264'
    end
    object adoqryNominaC265: TFloatField
      FieldName = 'C265'
    end
    object adoqryNominaC268: TFloatField
      FieldName = 'C268'
    end
    object adoqryNominaC271: TFloatField
      FieldName = 'C271'
    end
    object adoqryNominaC272: TFloatField
      FieldName = 'C272'
    end
    object adoqryNominaC273: TFloatField
      FieldName = 'C273'
    end
    object adoqryNominaC274: TFloatField
      FieldName = 'C274'
    end
    object adoqryNominaC275: TFloatField
      FieldName = 'C275'
    end
    object adoqryNominaC280: TFloatField
      FieldName = 'C280'
    end
    object adoqryNominaC290: TFloatField
      FieldName = 'C290'
    end
    object adoqryNominaC291: TFloatField
      FieldName = 'C291'
    end
    object adoqryNominaC2S1: TFloatField
      FieldName = 'C2S1'
    end
    object adoqryNominaC2S2: TFloatField
      FieldName = 'C2S2'
    end
    object adoqryNominaC2S3: TFloatField
      FieldName = 'C2S3'
    end
    object adoqryNominaC2S4: TFloatField
      FieldName = 'C2S4'
    end
    object adoqryNominaC2U1: TFloatField
      FieldName = 'C2U1'
    end
    object adoqryNominaC2U2: TFloatField
      FieldName = 'C2U2'
    end
    object adoqryNominaC2U3: TFloatField
      FieldName = 'C2U3'
    end
    object adoqryNominaC2U8: TFloatField
      FieldName = 'C2U8'
    end
    object adoqryNominaC2V1: TFloatField
      FieldName = 'C2V1'
    end
    object adoqryNominaC2V7: TFloatField
      FieldName = 'C2V7'
    end
    object adoqryNominaC2W2: TFloatField
      FieldName = 'C2W2'
    end
    object adoqryNominaC2W4: TFloatField
      FieldName = 'C2W4'
    end
    object adoqryNominaC2Y2: TFloatField
      FieldName = 'C2Y2'
    end
    object adoqryNominaC2Y4: TFloatField
      FieldName = 'C2Y4'
    end
    object adoqryNominaC2Y5: TFloatField
      FieldName = 'C2Y5'
    end
    object adoqryNominaC2Y6: TFloatField
      FieldName = 'C2Y6'
    end
    object adoqryNominaC2Y8: TFloatField
      FieldName = 'C2Y8'
    end
    object adoqryNominaC2Z5: TFloatField
      FieldName = 'C2Z5'
    end
    object adoqryNominaC2Z8: TFloatField
      FieldName = 'C2Z8'
    end
    object adoqryNominaTOTPER: TFloatField
      FieldName = 'TOTPER'
    end
    object adoqryNominaTOTDED: TFloatField
      FieldName = 'TOTDED'
    end
    object adoqryNominaTOTLIQ: TFloatField
      FieldName = 'TOTLIQ'
    end
    object adoqryNominaPeriodoMes: TIntegerField
      FieldName = 'PeriodoMes'
      ReadOnly = True
    end
    object adoqryNominaPeriodoAnio: TIntegerField
      FieldName = 'PeriodoAnio'
      ReadOnly = True
    end
  end
  object adoqryNominaCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select count(*) AS CUENTA from v_CECTI'
      '')
    Left = 152
    Top = 104
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
  object dxmdPercepcionesTipo: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F05000000FF00000014000600436C61766500FF0000
      0014000900436F6E636570746F0002000000050007004578656E746F00020000
      00050008004772617661646F00FF0000001400040053415400}
    SortOptions = []
    Left = 56
    Top = 232
    object dxmdPercepcionesTipoClave: TWideStringField
      FieldName = 'Clave'
      Size = 255
    end
    object dxmdPercepcionesTipoConcepto: TWideStringField
      FieldName = 'Concepto'
      Size = 255
    end
    object dxmdPercepcionesTipoExento: TBooleanField
      FieldName = 'Exento'
    end
    object dxmdPercepcionesTipoGravado: TBooleanField
      FieldName = 'Gravado'
    end
    object dxmdPercepcionesTipoSAT: TWideStringField
      FieldName = 'SAT'
      Size = 255
    end
  end
  object adoqPercepcionesTipo: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Clave, Concepto, Exento, Gravado, SAT'
      'FROM PercepcionesTipo')
    Left = 56
    Top = 176
  end
  object dxmdDeduccionesTipo: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F05000000FF00000014000600436C61766500FF0000
      0014000900436F6E636570746F0002000000050007004578656E746F00020000
      00050008004772617661646F00FF0000001400040053415400}
    SortOptions = []
    Left = 192
    Top = 232
    object dxmdDeduccionesTipoClave: TWideStringField
      FieldName = 'Clave'
      Size = 255
    end
    object dxmdDeduccionesTipoConcepto: TWideStringField
      FieldName = 'Concepto'
      Size = 255
    end
    object dxmdDeduccionesTipoExento: TBooleanField
      FieldName = 'Exento'
    end
    object dxmdDeduccionesTipoGravado: TBooleanField
      FieldName = 'Gravado'
    end
    object dxmdDeduccionesTipoSAT: TWideStringField
      FieldName = 'SAT'
      Size = 255
    end
  end
  object adoqDeduccionesTipo: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Clave, Concepto, Exento, Gravado, SAT'
      'FROM DeduccionesTipo')
    Left = 192
    Top = 176
  end
  object adoqryNomina12: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  *'
      'FROM            v_CECTI'
      'WHERE ComplementoNominaFechaPago is not null'
      'ORDER BY ID')
    Left = 40
    Top = 104
    object adoqryNomina12ID: TFloatField
      FieldName = 'ID'
    end
    object adoqryNomina12FormaDePago: TStringField
      FieldName = 'FormaDePago'
      ReadOnly = True
      Size = 22
    end
    object adoqryNomina12SubTotal: TFloatField
      FieldName = 'SubTotal'
    end
    object adoqryNomina12Descuento: TFloatField
      FieldName = 'Descuento'
    end
    object adoqryNomina12TipoCambio: TIntegerField
      FieldName = 'TipoCambio'
      ReadOnly = True
    end
    object adoqryNomina12Moneda: TStringField
      FieldName = 'Moneda'
      ReadOnly = True
      Size = 3
    end
    object adoqryNomina12Total: TFloatField
      FieldName = 'Total'
    end
    object adoqryNomina12MetodoDePago: TStringField
      FieldName = 'MetodoDePago'
      ReadOnly = True
      Size = 2
    end
    object adoqryNomina12TipoDeComprobante: TStringField
      FieldName = 'TipoDeComprobante'
      ReadOnly = True
      Size = 6
    end
    object adoqryNomina12LugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      ReadOnly = True
      Size = 5
    end
    object adoqryNomina12EmisorRFC: TStringField
      FieldName = 'EmisorRFC'
      ReadOnly = True
      Size = 12
    end
    object adoqryNomina12EmisorNombre: TStringField
      FieldName = 'EmisorNombre'
      ReadOnly = True
      Size = 51
    end
    object adoqryNomina12EmisorRegimen: TStringField
      FieldName = 'EmisorRegimen'
      ReadOnly = True
      Size = 3
    end
    object adoqryNomina12ReceptorRFC: TWideStringField
      FieldName = 'ReceptorRFC'
      Size = 255
    end
    object adoqryNomina12ReceptorNombre: TWideStringField
      FieldName = 'ReceptorNombre'
      Size = 255
    end
    object adoqryNomina12ConceptoValorUnitario: TFloatField
      FieldName = 'ConceptoValorUnitario'
    end
    object adoqryNomina12ConceptoImporte: TFloatField
      FieldName = 'ConceptoImporte'
    end
    object adoqryNomina12ComplementoNominaTipoNomina: TWideStringField
      FieldName = 'ComplementoNominaTipoNomina'
      Size = 255
    end
    object adoqryNomina12ComplementoNominaFechaPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaPago'
    end
    object adoqryNomina12ComplementoNominaFechaInicialPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaInicialPago'
    end
    object adoqryNomina12ComplementoNominaFechaFinalPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaFinalPago'
    end
    object adoqryNomina12ComplementoNominaNumDiasPagados: TFloatField
      FieldName = 'ComplementoNominaNumDiasPagados'
    end
    object adoqryNomina12SubsidioAlEmpleo: TIntegerField
      FieldName = 'SubsidioAlEmpleo'
      ReadOnly = True
    end
    object adoqryNomina12ComplementoNominaTotalPercepciones: TFloatField
      FieldName = 'ComplementoNominaTotalPercepciones'
      ReadOnly = True
    end
    object adoqryNomina12ComplementoNominaTotalDeducciones: TFloatField
      FieldName = 'ComplementoNominaTotalDeducciones'
      ReadOnly = True
    end
    object adoqryNomina12ComplementoNominaTotalOtrosPagos: TFloatField
      FieldName = 'ComplementoNominaTotalOtrosPagos'
    end
    object adoqryNomina12nomEmisorCURP: TStringField
      FieldName = 'nomEmisorCURP'
      ReadOnly = True
      Size = 1
    end
    object adoqryNomina12nomEmisorRegistroPatronal: TStringField
      FieldName = 'nomEmisorRegistroPatronal'
      ReadOnly = True
      Size = 11
    end
    object adoqryNomina12nomReceptorCURP: TWideStringField
      FieldName = 'nomReceptorCURP'
      Size = 255
    end
    object adoqryNomina12nomReceptorNumSeguridadSocial: TWideStringField
      FieldName = 'nomReceptorNumSeguridadSocial'
      ReadOnly = True
      Size = 4000
    end
    object adoqryNomina12nomReceptorFechaInicioRelLaboral: TDateTimeField
      FieldName = 'nomReceptorFechaInicioRelLaboral'
    end
    object adoqryNomina12nomReceptorAntiguedad: TStringField
      FieldName = 'nomReceptorAntiguedad'
      ReadOnly = True
      Size = 7
    end
    object adoqryNomina12nomReceptorTipoContrato: TWideStringField
      FieldName = 'nomReceptorTipoContrato'
      Size = 255
    end
    object adoqryNomina12nomReceptorSindicalizado: TWideStringField
      FieldName = 'nomReceptorSindicalizado'
      Size = 255
    end
    object adoqryNomina12nomReceptorTipoJornada: TWideStringField
      FieldName = 'nomReceptorTipoJornada'
      Size = 255
    end
    object adoqryNomina12nomReceptorTipoRegimen: TWideStringField
      FieldName = 'nomReceptorTipoRegimen'
      Size = 255
    end
    object adoqryNomina12nomReceptorNumEmpleado: TWideStringField
      FieldName = 'nomReceptorNumEmpleado'
      Size = 255
    end
    object adoqryNomina12nomReceptorDepartamento: TWideStringField
      FieldName = 'nomReceptorDepartamento'
      Size = 255
    end
    object adoqryNomina12nomReceptorPuesto: TWideStringField
      FieldName = 'nomReceptorPuesto'
      Size = 255
    end
    object adoqryNomina12nomReceptorRiesgoPuesto: TStringField
      FieldName = 'nomReceptorRiesgoPuesto'
      ReadOnly = True
      Size = 1
    end
    object adoqryNomina12nomReceptorPeriodicidadPago: TWideStringField
      FieldName = 'nomReceptorPeriodicidadPago'
      Size = 255
    end
    object adoqryNomina12nomReceptorSalarioBaseCotApor: TFloatField
      FieldName = 'nomReceptorSalarioBaseCotApor'
    end
    object adoqryNomina12nomReceptorSalarioDiarioIntegrado: TFloatField
      FieldName = 'nomReceptorSalarioDiarioIntegrado'
    end
    object adoqryNomina12nomReceptorClaveEntFed: TWideStringField
      FieldName = 'nomReceptorClaveEntFed'
      Size = 255
    end
    object adoqryNomina12nomPercepcionesTotalSueldos: TFloatField
      FieldName = 'nomPercepcionesTotalSueldos'
      ReadOnly = True
    end
    object adoqryNomina12nomPercepcionesTotalGravado: TFloatField
      FieldName = 'nomPercepcionesTotalGravado'
      ReadOnly = True
    end
    object adoqryNomina12nomPercepcionesTotalExento: TFloatField
      FieldName = 'nomPercepcionesTotalExento'
      ReadOnly = True
    end
    object adoqryNomina12nomDeduccionesTotalOtrasDeducciones: TFloatField
      FieldName = 'nomDeduccionesTotalOtrasDeducciones'
      ReadOnly = True
    end
    object adoqryNomina12nomDeduccionesTotalImpuestosRetenidos: TFloatField
      FieldName = 'nomDeduccionesTotalImpuestosRetenidos'
    end
    object adoqryNomina12FloatField001: TFloatField
      FieldName = '001'
    end
    object adoqryNomina12FloatField002: TFloatField
      FieldName = '002'
    end
    object adoqryNomina12FloatField003: TFloatField
      FieldName = '003'
    end
    object adoqryNomina12FloatField004: TFloatField
      FieldName = '004'
    end
    object adoqryNomina12FloatField005: TFloatField
      FieldName = '005'
    end
    object adoqryNomina12FloatField006: TFloatField
      FieldName = '006'
    end
    object adoqryNomina12FloatField007: TFloatField
      FieldName = '007'
    end
    object adoqryNomina12FloatField008: TFloatField
      FieldName = '008'
    end
    object adoqryNomina12FloatField009E: TFloatField
      FieldName = '009E'
    end
    object adoqryNomina12FloatField009G: TFloatField
      FieldName = '009G'
    end
    object adoqryNomina12FloatField010E: TFloatField
      FieldName = '010E'
    end
    object adoqryNomina12FloatField010G: TFloatField
      FieldName = '010G'
    end
    object adoqryNomina12FloatField011: TFloatField
      FieldName = '011'
    end
    object adoqryNomina12FloatField012: TFloatField
      FieldName = '012'
    end
    object adoqryNomina12FloatField013: TFloatField
      FieldName = '013'
    end
    object adoqryNomina12FloatField014: TFloatField
      FieldName = '014'
    end
    object adoqryNomina12FloatField015: TFloatField
      FieldName = '015'
    end
    object adoqryNomina12FloatField016: TFloatField
      FieldName = '016'
    end
    object adoqryNomina12FloatField017: TFloatField
      FieldName = '017'
    end
    object adoqryNomina12TOTPER: TFloatField
      FieldName = 'TOTPER'
    end
    object adoqryNomina12TOTDED: TFloatField
      FieldName = 'TOTDED'
    end
    object adoqryNomina12TOTLIQ: TFloatField
      FieldName = 'TOTLIQ'
    end
    object adoqryNomina12PeriodoMes: TIntegerField
      FieldName = 'PeriodoMes'
      ReadOnly = True
    end
    object adoqryNomina12PeriodoAnio: TIntegerField
      FieldName = 'PeriodoAnio'
      ReadOnly = True
    end
  end
end
