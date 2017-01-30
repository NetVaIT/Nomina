object dmCOBAEM: TdmCOBAEM
  OldCreateOrder = False
  Height = 150
  Width = 215
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
      'SELECT  TOP(2)  *'
      'FROM            v_COBAEM2016'
      'WHERE ComplementoNominaFechaPago is not null'
      'AND (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (PeriodoMes = :Mes1 OR :Mes2 = 0)'
      'ORDER BY ID')
    Left = 40
    Top = 32
    object adoqryNominaID: TFloatField
      FieldName = 'ID'
    end
    object adoqryNominaCONOM: TWideStringField
      FieldName = 'CONOM'
      Size = 255
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
      Size = 46
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
      ReadOnly = True
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
    object adoqryNominaComplementoNominaTipoRegimen: TStringField
      FieldName = 'ComplementoNominaTipoRegimen'
      ReadOnly = True
      Size = 1
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
    object adoqryNominaComplementoNominaNumDiasPagados: TIntegerField
      FieldName = 'ComplementoNominaNumDiasPagados'
      ReadOnly = True
    end
    object adoqryNominaPTotalGravado: TFloatField
      FieldName = 'PTotalGravado'
      ReadOnly = True
    end
    object adoqryNominaPTotalExento: TFloatField
      FieldName = 'PTotalExento'
      ReadOnly = True
    end
    object adoqryNominaDTotalGravado: TIntegerField
      FieldName = 'DTotalGravado'
      ReadOnly = True
    end
    object adoqryNominaDTotalExento: TFloatField
      FieldName = 'DTotalExento'
      ReadOnly = True
    end
    object adoqryNominaP02: TFloatField
      FieldName = 'P02'
    end
    object adoqryNominaP03: TFloatField
      FieldName = 'P03'
    end
    object adoqryNominaP04: TFloatField
      FieldName = 'P04'
    end
    object adoqryNominaP05: TFloatField
      FieldName = 'P05'
    end
    object adoqryNominaP06: TFloatField
      FieldName = 'P06'
    end
    object adoqryNominaP07: TFloatField
      FieldName = 'P07'
    end
    object adoqryNominaP08: TFloatField
      FieldName = 'P08'
    end
    object adoqryNominaP09: TFloatField
      FieldName = 'P09'
    end
    object adoqryNominaP10: TFloatField
      FieldName = 'P10'
    end
    object adoqryNominaP11: TFloatField
      FieldName = 'P11'
    end
    object adoqryNominaP12: TFloatField
      FieldName = 'P12'
    end
    object adoqryNominaP13: TFloatField
      FieldName = 'P13'
    end
    object adoqryNominaP14: TFloatField
      FieldName = 'P14'
    end
    object adoqryNominaP15: TFloatField
      FieldName = 'P15'
    end
    object adoqryNominaP16: TFloatField
      FieldName = 'P16'
    end
    object adoqryNominaP17: TFloatField
      FieldName = 'P17'
    end
    object adoqryNominaP18: TFloatField
      FieldName = 'P18'
    end
    object adoqryNominaP19: TFloatField
      FieldName = 'P19'
    end
    object adoqryNominaP20: TFloatField
      FieldName = 'P20'
    end
    object adoqryNominaP21: TFloatField
      FieldName = 'P21'
    end
    object adoqryNominaP22: TFloatField
      FieldName = 'P22'
    end
    object adoqryNominaP23: TFloatField
      FieldName = 'P23'
    end
    object adoqryNominaP24: TFloatField
      FieldName = 'P24'
    end
    object adoqryNominaD26: TFloatField
      FieldName = 'D26'
    end
    object adoqryNominaD27: TFloatField
      FieldName = 'D27'
    end
    object adoqryNominaD28: TFloatField
      FieldName = 'D28'
    end
    object adoqryNominaD29: TFloatField
      FieldName = 'D29'
    end
    object adoqryNominaP30: TFloatField
      FieldName = 'P30'
    end
    object adoqryNominaD32: TFloatField
      FieldName = 'D32'
    end
    object adoqryNominaD31: TFloatField
      FieldName = 'D31'
    end
    object adoqryNominaD33: TFloatField
      FieldName = 'D33'
    end
    object adoqryNominaD34: TFloatField
      FieldName = 'D34'
    end
    object adoqryNominaD35: TFloatField
      FieldName = 'D35'
    end
    object adoqryNominaD36: TFloatField
      FieldName = 'D36'
    end
    object adoqryNominaD37: TFloatField
      FieldName = 'D37'
    end
    object adoqryNominaD38: TFloatField
      FieldName = 'D38'
    end
    object adoqryNominaP40: TFloatField
      FieldName = 'P40'
    end
    object adoqryNominaP41: TFloatField
      FieldName = 'P41'
    end
    object adoqryNominaP42: TFloatField
      FieldName = 'P42'
    end
    object adoqryNominaP43: TFloatField
      FieldName = 'P43'
    end
    object adoqryNominaP44: TFloatField
      FieldName = 'P44'
    end
    object adoqryNominaP45: TFloatField
      FieldName = 'P45'
    end
    object adoqryNominaP46: TFloatField
      FieldName = 'P46'
    end
    object adoqryNominaP47: TFloatField
      FieldName = 'P47'
    end
    object adoqryNominaP48: TFloatField
      FieldName = 'P48'
    end
    object adoqryNominaP49: TFloatField
      FieldName = 'P49'
    end
    object adoqryNominaP50: TFloatField
      FieldName = 'P50'
    end
    object adoqryNominaP51: TFloatField
      FieldName = 'P51'
    end
    object adoqryNominaP52: TFloatField
      FieldName = 'P52'
    end
    object adoqryNominaP53: TFloatField
      FieldName = 'P53'
    end
    object adoqryNominaP54: TFloatField
      FieldName = 'P54'
    end
    object adoqryNominaP55: TFloatField
      FieldName = 'P55'
    end
    object adoqryNominaP56: TFloatField
      FieldName = 'P56'
    end
    object adoqryNominaP57: TFloatField
      FieldName = 'P57'
    end
    object adoqryNominaP58: TFloatField
      FieldName = 'P58'
    end
    object adoqryNominaP59: TFloatField
      FieldName = 'P59'
    end
    object adoqryNominaP60: TFloatField
      FieldName = 'P60'
    end
    object adoqryNominaP61: TFloatField
      FieldName = 'P61'
    end
    object adoqryNominaP62: TFloatField
      FieldName = 'P62'
    end
    object adoqryNominaP63: TFloatField
      FieldName = 'P63'
    end
    object adoqryNominaP64: TFloatField
      FieldName = 'P64'
    end
    object adoqryNominaP65: TFloatField
      FieldName = 'P65'
    end
    object adoqryNominaP66: TFloatField
      FieldName = 'P66'
    end
    object adoqryNominaP67: TFloatField
      FieldName = 'P67'
    end
    object adoqryNominaP68: TFloatField
      FieldName = 'P68'
    end
    object adoqryNominaD70: TFloatField
      FieldName = 'D70'
    end
    object adoqryNominaD71: TFloatField
      FieldName = 'D71'
    end
    object adoqryNominaD72: TFloatField
      FieldName = 'D72'
    end
    object adoqryNominaD73: TFloatField
      FieldName = 'D73'
    end
    object adoqryNominaD74: TFloatField
      FieldName = 'D74'
    end
    object adoqryNominaD75: TFloatField
      FieldName = 'D75'
    end
    object adoqryNominaD76: TFloatField
      FieldName = 'D76'
    end
    object adoqryNominaD77: TFloatField
      FieldName = 'D77'
    end
    object adoqryNominaD78: TFloatField
      FieldName = 'D78'
    end
    object adoqryNominaD79: TFloatField
      FieldName = 'D79'
    end
    object adoqryNominaD80: TFloatField
      FieldName = 'D80'
    end
    object adoqryNominaD81: TFloatField
      FieldName = 'D81'
    end
    object adoqryNominaD82: TFloatField
      FieldName = 'D82'
    end
    object adoqryNominaD83: TFloatField
      FieldName = 'D83'
    end
    object adoqryNominaD84: TFloatField
      FieldName = 'D84'
    end
    object adoqryNominaD85: TFloatField
      FieldName = 'D85'
    end
    object adoqryNominaD86: TFloatField
      FieldName = 'D86'
    end
    object adoqryNominaD87: TFloatField
      FieldName = 'D87'
    end
    object adoqryNominaD88: TFloatField
      FieldName = 'D88'
    end
    object adoqryNominaD89: TFloatField
      FieldName = 'D89'
    end
    object adoqryNominaD90: TFloatField
      FieldName = 'D90'
    end
    object adoqryNominaD91: TFloatField
      FieldName = 'D91'
    end
    object adoqryNominaD92: TFloatField
      FieldName = 'D92'
    end
    object adoqryNominaD93: TFloatField
      FieldName = 'D93'
    end
    object adoqryNominaD94: TFloatField
      FieldName = 'D94'
    end
    object adoqryNominaD95: TFloatField
      FieldName = 'D95'
    end
    object adoqryNominaD96: TFloatField
      FieldName = 'D96'
    end
    object adoqryNominaD97: TFloatField
      FieldName = 'D97'
    end
    object adoqryNominaD98: TFloatField
      FieldName = 'D98'
    end
    object adoqryNominaD99: TFloatField
      FieldName = 'D99'
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
    object adoqryNominaComplementoNominaNumSeguridadSocial: TFloatField
      FieldName = 'ComplementoNominaNumSeguridadSocial'
    end
    object adoqryNominaComplementoNominaDepartamento: TWideStringField
      FieldName = 'ComplementoNominaDepartamento'
      Size = 255
    end
    object adoqryNominaComplementoNominaPuesto: TWideStringField
      FieldName = 'ComplementoNominaPuesto'
      ReadOnly = True
      Size = 511
    end
    object adoqryNominaComplementoNominaTipoContrato: TWideStringField
      FieldName = 'ComplementoNominaTipoContrato'
      Size = 255
    end
    object adoqryNominaComplementoNominaFechaInicioRelLaboral: TDateTimeField
      FieldName = 'ComplementoNominaFechaInicioRelLaboral'
    end
    object adoqryNominaP69: TFloatField
      FieldName = 'P69'
    end
  end
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
      'select count(*) AS CUENTA from v_COBAEM2016'
      'WHERE (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (PeriodoMes = :Mes1 OR :Mes2 = 0)')
    Left = 136
    Top = 32
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
end
