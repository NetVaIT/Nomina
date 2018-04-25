object dmJUMAPAM: TdmJUMAPAM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 262
  Width = 305
  object adoqryNominaCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Anio1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Anio2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Mes1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Mes2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) AS CUENTA from v_JUMAPAM'
      'WHERE (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (PeriodoMes = :Mes1 OR :Mes2 = 0)')
    Left = 136
    Top = 32
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
  object adoqryNomina: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Anio1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Anio2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Mes1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Mes2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  *'
      'FROM            v_JUMAPAM'
      'WHERE ComplementoNominaFechaPago is not null'
      'AND (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (PeriodoMes = :Mes1 OR :Mes2 = 0)'
      'ORDER BY ID')
    Left = 40
    Top = 32
    object adoqryNominaID: TFloatField
      FieldName = 'ID'
    end
    object adoqryNominaFormaDePago: TStringField
      FieldName = 'FormaDePago'
      ReadOnly = True
      Size = 22
    end
    object adoqryNominaSubTotal: TFloatField
      FieldName = 'SubTotal'
    end
    object adoqryNominaDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object adoqryNominaTipoCambio: TIntegerField
      FieldName = 'TipoCambio'
      ReadOnly = True
    end
    object adoqryNominaMoneda: TStringField
      FieldName = 'Moneda'
      ReadOnly = True
      Size = 3
    end
    object adoqryNominaTotal: TFloatField
      FieldName = 'Total'
    end
    object adoqryNominaMetodoDePago: TStringField
      FieldName = 'MetodoDePago'
      ReadOnly = True
      Size = 2
    end
    object adoqryNominaTipoDeComprobante: TStringField
      FieldName = 'TipoDeComprobante'
      ReadOnly = True
      Size = 6
    end
    object adoqryNominaLugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      ReadOnly = True
      Size = 5
    end
    object adoqryNominaEmisorRFC: TStringField
      FieldName = 'EmisorRFC'
      ReadOnly = True
      Size = 12
    end
    object adoqryNominaEmisorNombre: TStringField
      FieldName = 'EmisorNombre'
      ReadOnly = True
      Size = 60
    end
    object adoqryNominaEmisorRegimen: TStringField
      FieldName = 'EmisorRegimen'
      ReadOnly = True
      Size = 3
    end
    object adoqryNominaReceptorRFC: TWideStringField
      FieldName = 'ReceptorRFC'
      Size = 255
    end
    object adoqryNominaReceptorNombre: TWideStringField
      FieldName = 'ReceptorNombre'
      Size = 255
    end
    object adoqryNominaConceptoValorUnitario: TFloatField
      FieldName = 'ConceptoValorUnitario'
    end
    object adoqryNominaConceptoImporte: TFloatField
      FieldName = 'ConceptoImporte'
    end
    object adoqryNominaComplementoNominaTipoNomina: TWideStringField
      FieldName = 'ComplementoNominaTipoNomina'
      Size = 255
    end
    object adoqryNominaComplementoNominaFechaPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaPago'
    end
    object adoqryNominaComplementoNominaFechaInicialPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaInicialPago'
    end
    object adoqryNominaComplementoNominaFechaFinalPago: TDateTimeField
      FieldName = 'ComplementoNominaFechaFinalPago'
    end
    object adoqryNominaComplementoNominaNumDiasPagados: TFloatField
      FieldName = 'ComplementoNominaNumDiasPagados'
    end
    object adoqryNominaSubsidioAlEmpleo: TFloatField
      FieldName = 'SubsidioAlEmpleo'
    end
    object adoqryNominaHORAS_EXTRAS_DIAS: TFloatField
      FieldName = 'HORAS_EXTRAS_DIAS'
    end
    object adoqryNominaTIEMPO_EXTRA_DOBLE: TFloatField
      FieldName = 'TIEMPO_EXTRA_DOBLE'
    end
    object adoqryNominaTIEMPO_EXTRA_TRIPLE: TFloatField
      FieldName = 'TIEMPO_EXTRA_TRIPLE'
    end
    object adoqryNominaComplementoNominaTotalPercepciones: TFloatField
      FieldName = 'ComplementoNominaTotalPercepciones'
      ReadOnly = True
    end
    object adoqryNominaComplementoNominaTotalDeducciones: TFloatField
      FieldName = 'ComplementoNominaTotalDeducciones'
      ReadOnly = True
    end
    object adoqryNominaComplementoNominaTotalOtrosPagos: TFloatField
      FieldName = 'ComplementoNominaTotalOtrosPagos'
      ReadOnly = True
    end
    object adoqryNominanomEmisorCURP: TStringField
      FieldName = 'nomEmisorCURP'
      ReadOnly = True
      Size = 1
    end
    object adoqryNominanomEmisorRegistroPatronal: TWideStringField
      FieldName = 'nomEmisorRegistroPatronal'
      Size = 255
    end
    object adoqryNominanomReceptorCURP: TWideStringField
      FieldName = 'nomReceptorCURP'
      Size = 255
    end
    object adoqryNominanomReceptorNumSeguridadSocial: TWideStringField
      FieldName = 'nomReceptorNumSeguridadSocial'
      ReadOnly = True
      Size = 4000
    end
    object adoqryNominanomReceptorFechaInicioRelLaboral: TDateTimeField
      FieldName = 'nomReceptorFechaInicioRelLaboral'
    end
    object adoqryNominanomReceptorAntiguedad: TStringField
      FieldName = 'nomReceptorAntiguedad'
      ReadOnly = True
      Size = 7
    end
    object adoqryNominanomReceptorTipoContrato: TWideStringField
      FieldName = 'nomReceptorTipoContrato'
      Size = 255
    end
    object adoqryNominanomReceptorSindicalizado: TWideStringField
      FieldName = 'nomReceptorSindicalizado'
      Size = 255
    end
    object adoqryNominanomReceptorTipoJornada: TWideStringField
      FieldName = 'nomReceptorTipoJornada'
      Size = 255
    end
    object adoqryNominanomReceptorTipoRegimen: TWideStringField
      FieldName = 'nomReceptorTipoRegimen'
      Size = 255
    end
    object adoqryNominanomReceptorNumEmpleado: TFloatField
      FieldName = 'nomReceptorNumEmpleado'
    end
    object adoqryNominanomReceptorDepartamento: TWideStringField
      FieldName = 'nomReceptorDepartamento'
      Size = 255
    end
    object adoqryNominanomReceptorPuesto: TWideStringField
      FieldName = 'nomReceptorPuesto'
      Size = 255
    end
    object adoqryNominanomReceptorRiesgoPuesto: TStringField
      FieldName = 'nomReceptorRiesgoPuesto'
      ReadOnly = True
      Size = 1
    end
    object adoqryNominanomReceptorPeriodicidadPago: TWideStringField
      FieldName = 'nomReceptorPeriodicidadPago'
      Size = 255
    end
    object adoqryNominanomReceptorClaveEntFed: TWideStringField
      FieldName = 'nomReceptorClaveEntFed'
      Size = 255
    end
    object adoqryNominanomPercepcionesTotalSueldos: TFloatField
      FieldName = 'nomPercepcionesTotalSueldos'
      ReadOnly = True
    end
    object adoqryNominanomPercepcionesTotalGravado: TFloatField
      FieldName = 'nomPercepcionesTotalGravado'
      ReadOnly = True
    end
    object adoqryNominanomPercepcionesTotalExento: TFloatField
      FieldName = 'nomPercepcionesTotalExento'
      ReadOnly = True
    end
    object adoqryNominanomDeduccionesTotalOtrasDeducciones: TFloatField
      FieldName = 'nomDeduccionesTotalOtrasDeducciones'
      ReadOnly = True
    end
    object adoqryNominanomDeduccionesTotalImpuestosRetenidos: TFloatField
      FieldName = 'nomDeduccionesTotalImpuestosRetenidos'
    end
    object adoqryNominaFloatField1: TFloatField
      FieldName = '1'
    end
    object adoqryNominaFloatField2: TFloatField
      FieldName = '2'
    end
    object adoqryNominaFloatField3: TFloatField
      FieldName = '3'
    end
    object adoqryNominaFloatField4: TFloatField
      FieldName = '4'
    end
    object adoqryNominaFloatField6: TFloatField
      FieldName = '6'
    end
    object adoqryNominaFloatField7: TFloatField
      FieldName = '7'
    end
    object adoqryNominaFloatField8: TFloatField
      FieldName = '8'
    end
    object adoqryNominaFloatField9: TFloatField
      FieldName = '9'
    end
    object adoqryNominaFloatField09A: TFloatField
      FieldName = '09A'
    end
    object adoqryNominaFloatField12: TFloatField
      FieldName = '12'
    end
    object adoqryNominaFloatField13: TFloatField
      FieldName = '13'
    end
    object adoqryNominaFloatField14: TFloatField
      FieldName = '14'
    end
    object adoqryNominaFloatField15: TFloatField
      FieldName = '15'
    end
    object adoqryNominaFloatField16: TFloatField
      FieldName = '16'
    end
    object adoqryNominaFloatField20: TFloatField
      FieldName = '20'
    end
    object adoqryNominaFloatField20A: TFloatField
      FieldName = '20A'
    end
    object adoqryNominaFloatField20D: TFloatField
      FieldName = '20D'
    end
    object adoqryNominaFloatField22: TFloatField
      FieldName = '22'
    end
    object adoqryNominaFloatField29: TFloatField
      FieldName = '29'
    end
    object adoqryNominaFloatField30A: TFloatField
      FieldName = '30A'
    end
    object adoqryNominaFloatField33: TFloatField
      FieldName = '33'
    end
    object adoqryNominaFloatField40: TFloatField
      FieldName = '40'
    end
    object adoqryNominaFloatField41: TFloatField
      FieldName = '41'
    end
    object adoqryNominaFloatField45: TFloatField
      FieldName = '45'
    end
    object adoqryNominaFloatField46: TFloatField
      FieldName = '46'
    end
    object adoqryNominaFloatField49A: TFloatField
      FieldName = '49A'
    end
    object adoqryNominaFloatField67D: TFloatField
      FieldName = '67D'
    end
    object adoqryNominaFloatField67E: TFloatField
      FieldName = '67E'
    end
    object adoqryNominaFloatField67F: TFloatField
      FieldName = '67F'
    end
    object adoqryNominaFloatField10G: TFloatField
      FieldName = '10G'
    end
    object adoqryNominaFloatField10E: TFloatField
      FieldName = '10E'
    end
    object adoqryNominaFloatField11: TFloatField
      FieldName = '11'
    end
    object adoqryNominaFloatField17G: TFloatField
      FieldName = '17G'
    end
    object adoqryNominaFloatField17E: TFloatField
      FieldName = '17E'
    end
    object adoqryNominaFloatField18G: TFloatField
      FieldName = '18G'
    end
    object adoqryNominaFloatField18E: TFloatField
      FieldName = '18E'
    end
    object adoqryNominaFloatField19G: TFloatField
      FieldName = '19G'
    end
    object adoqryNominaFloatField19E: TFloatField
      FieldName = '19E'
    end
    object adoqryNominaFloatField21G: TFloatField
      FieldName = '21G'
    end
    object adoqryNominaFloatField21E: TFloatField
      FieldName = '21E'
    end
    object adoqryNominaFloatField30G: TFloatField
      FieldName = '30G'
    end
    object adoqryNominaFloatField30E: TFloatField
      FieldName = '30E'
    end
    object adoqryNominaFloatField51: TFloatField
      FieldName = '51'
    end
    object adoqryNominaFloatField52: TFloatField
      FieldName = '52'
    end
    object adoqryNominaFloatField53: TFloatField
      FieldName = '53'
    end
    object adoqryNominaFloatField53A: TFloatField
      FieldName = '53A'
    end
    object adoqryNominaFloatField53B: TFloatField
      FieldName = '53B'
    end
    object adoqryNominaFloatField53C: TFloatField
      FieldName = '53C'
    end
    object adoqryNominaFloatField60: TFloatField
      FieldName = '60'
    end
    object adoqryNominaFloatField60C: TFloatField
      FieldName = '60C'
    end
    object adoqryNominaFloatField60D: TFloatField
      FieldName = '60D'
    end
    object adoqryNominaFloatField60F: TFloatField
      FieldName = '60F'
    end
    object adoqryNominaFloatField61: TFloatField
      FieldName = '61'
    end
    object adoqryNominaFloatField64: TFloatField
      FieldName = '64'
    end
    object adoqryNominaFloatField65: TFloatField
      FieldName = '65'
    end
    object adoqryNominaFloatField67A: TFloatField
      FieldName = '67A'
    end
    object adoqryNominaFloatField67B: TFloatField
      FieldName = '67B'
    end
    object adoqryNominaFloatField69: TFloatField
      FieldName = '69'
    end
    object adoqryNominaFloatField72: TFloatField
      FieldName = '72'
    end
    object adoqryNominaFloatField73: TFloatField
      FieldName = '73'
    end
    object adoqryNominaFloatField76: TFloatField
      FieldName = '76'
    end
    object adoqryNominaFloatField77: TFloatField
      FieldName = '77'
    end
    object adoqryNominaFloatField99: TFloatField
      FieldName = '99'
    end
    object adoqryNominaFloatField51A: TFloatField
      FieldName = '51A'
    end
    object adoqryNominaFloatField999: TFloatField
      FieldName = '999'
    end
    object adoqryNominaTOTAL_PERCEPCIONES: TFloatField
      FieldName = 'TOTAL_PERCEPCIONES'
    end
    object adoqryNominaTOTAL_DEDUCCIONES: TFloatField
      FieldName = 'TOTAL_DEDUCCIONES'
    end
    object adoqryNominaTOTAL_PAGADO: TFloatField
      FieldName = 'TOTAL_PAGADO'
    end
    object adoqryNominaPeriodoMes: TIntegerField
      FieldName = 'PeriodoMes'
      ReadOnly = True
    end
    object adoqryNominaPeriodoAnio: TIntegerField
      FieldName = 'PeriodoAnio'
      ReadOnly = True
    end
    object adoqryNominaSALARIO_BASE: TFloatField
      FieldName = 'SALARIO_BASE'
    end
    object adoqryNominaSALARIO_BASE_INTEGRADO: TFloatField
      FieldName = 'SALARIO_BASE_INTEGRADO'
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
    Top = 160
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
    Top = 104
  end
  object dxmdDeduccionesTipo: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F05000000FF00000014000600436C61766500FF0000
      0014000900436F6E636570746F0002000000050007004578656E746F00020000
      00050008004772617661646F00FF0000001400040053415400}
    SortOptions = []
    Left = 192
    Top = 160
    object dxmdDeduccionesTipoClave: TWideStringField
      FieldName = 'Clave'
      Size = 255
    end
    object dxmdDeduccionesTipoConcepto: TWideStringField
      FieldName = 'Concepto'
      Size = 255
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
      'SELECT Clave, Concepto, SAT'
      'FROM DeduccionesTipo')
    Left = 192
    Top = 104
  end
end
