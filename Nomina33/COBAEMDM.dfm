object dmCOBAEM: TdmCOBAEM
  OldCreateOrder = False
  Height = 265
  Width = 285
  object adoqryCFDI: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Estatus'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT CFDI.ID_CFDI, CASE WHEN ID_CFDI_ANTERIOR IS NOT NULL THEN' +
        ' '#39'04'#39' ELSE NULL END AS TipoRelacion, CFDI_ANT.TFD2UUID AS CfdiRe' +
        'lacionado1,'
      
        'TOTAL_PERCEPCIONES + TOTAL_OTROS_PAGOS AS Subtotal, TOTAL_DEDUCC' +
        'IONES AS Descuento, TOTAL_LIQUIDO AS Total, RECEPTOR_NOMBRE, REC' +
        'EPTOR_RFC, '
      
        'TOTAL_PERCEPCIONES + TOTAL_OTROS_PAGOS AS ConceptoValorUnitario,' +
        ' TOTAL_PERCEPCIONES + TOTAL_OTROS_PAGOS AS ConceptoImporte, TOTA' +
        'L_DEDUCCIONES AS ConceptoDescuento, TIPO_NOMINA, FECHA_PAGO, '
      
        'FECHA_INICIAL_PAGO, FECHA_FINAL_PAGO, DIAS_PAGADOS, TOTAL_PERCEP' +
        'CIONES, TOTAL_DEDUCCIONES, TOTAL_OTROS_PAGOS, ORIGEN_RECURSO, MO' +
        'NTO_RECURSO_PROPIO, RECEPTOR_CURP, NSS, '
      
        'FECHA_INGRESO, '#39'P'#39' + CAST((DATEDIFF(DAY, FECHA_INGRESO, FECHA_FI' +
        'NAL_PAGO) + 1) / 7 AS varchar(5)) + '#39'W'#39' AS ANTIGUEDAD, TIPO_CONT' +
        'RATO, SINDICALIZADO, TIPO_JORNADA, TIPO_REGIMEN, NO_EMPLEADO, '
      
        'DEPARTAMENTO, PUESTO, RIESGO_PUESTO, PERIORICIDAD_PAGO, SALARIO_' +
        'BASE, SALARIO_DIARIO_INTEGRADO, ENTIDAD_FEDERATIVA, TOTAL_SUELDO' +
        'S, TOTAL_GRAVADO, TOTAL_EXENTO, '
      
        'TOTAL_OTRAS_DEDUCCIONES, TOTAL_IMPUESTOS_RETENIDOS, CT, FILIACIO' +
        'N, SUBSIDIO_CAUSADO, TOTAL_LIQUIDO, REGISTRO_PATRONAL'
      'FROM CFDI'
      
        'LEFT OUTER JOIN CFDILog AS CFDI_ANT ON CFDI.ID_CFDI_ANTERIOR = C' +
        'FDI_ANT.ID_CFDI'
      'WHERE Estatus = :Estatus'
      'ORDER BY RECEPTOR_RFC, CFDI.ID_CFDI')
    Left = 56
    Top = 32
    object adoqryCFDISubtotal: TFloatField
      FieldName = 'Subtotal'
      ReadOnly = True
    end
    object adoqryCFDIDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object adoqryCFDITotal: TFloatField
      FieldName = 'Total'
    end
    object adoqryCFDIRECEPTOR_NOMBRE: TWideStringField
      FieldName = 'RECEPTOR_NOMBRE'
      Size = 255
    end
    object adoqryCFDIRECEPTOR_RFC: TWideStringField
      FieldName = 'RECEPTOR_RFC'
      Size = 15
    end
    object adoqryCFDIConceptoValorUnitario: TFloatField
      FieldName = 'ConceptoValorUnitario'
      ReadOnly = True
    end
    object adoqryCFDIConceptoImporte: TFloatField
      FieldName = 'ConceptoImporte'
      ReadOnly = True
    end
    object adoqryCFDIConceptoDescuento: TFloatField
      FieldName = 'ConceptoDescuento'
    end
    object adoqryCFDITIPO_NOMINA: TWideStringField
      FieldName = 'TIPO_NOMINA'
      Size = 1
    end
    object adoqryCFDIFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
    end
    object adoqryCFDIFECHA_INICIAL_PAGO: TDateTimeField
      FieldName = 'FECHA_INICIAL_PAGO'
    end
    object adoqryCFDIFECHA_FINAL_PAGO: TDateTimeField
      FieldName = 'FECHA_FINAL_PAGO'
    end
    object adoqryCFDIDIAS_PAGADOS: TFloatField
      FieldName = 'DIAS_PAGADOS'
    end
    object adoqryCFDITOTAL_PERCEPCIONES: TFloatField
      FieldName = 'TOTAL_PERCEPCIONES'
    end
    object adoqryCFDITOTAL_DEDUCCIONES: TFloatField
      FieldName = 'TOTAL_DEDUCCIONES'
    end
    object adoqryCFDITOTAL_OTROS_PAGOS: TFloatField
      FieldName = 'TOTAL_OTROS_PAGOS'
    end
    object adoqryCFDIORIGEN_RECURSO: TWideStringField
      FieldName = 'ORIGEN_RECURSO'
      Size = 2
    end
    object adoqryCFDIMONTO_RECURSO_PROPIO: TFloatField
      FieldName = 'MONTO_RECURSO_PROPIO'
    end
    object adoqryCFDIRECEPTOR_CURP: TWideStringField
      FieldName = 'RECEPTOR_CURP'
    end
    object adoqryCFDINSS: TWideStringField
      FieldName = 'NSS'
      Size = 15
    end
    object adoqryCFDIFECHA_INGRESO: TDateTimeField
      FieldName = 'FECHA_INGRESO'
    end
    object adoqryCFDIANTIGUEDAD: TStringField
      FieldName = 'ANTIGUEDAD'
      ReadOnly = True
      Size = 7
    end
    object adoqryCFDITIPO_CONTRATO: TWideStringField
      FieldName = 'TIPO_CONTRATO'
      Size = 5
    end
    object adoqryCFDISINDICALIZADO: TWideStringField
      FieldName = 'SINDICALIZADO'
      Size = 5
    end
    object adoqryCFDITIPO_JORNADA: TWideStringField
      FieldName = 'TIPO_JORNADA'
      Size = 5
    end
    object adoqryCFDITIPO_REGIMEN: TWideStringField
      FieldName = 'TIPO_REGIMEN'
      Size = 5
    end
    object adoqryCFDINO_EMPLEADO: TWideStringField
      FieldName = 'NO_EMPLEADO'
      Size = 15
    end
    object adoqryCFDIDEPARTAMENTO: TWideStringField
      FieldName = 'DEPARTAMENTO'
      Size = 100
    end
    object adoqryCFDIPUESTO: TWideStringField
      FieldName = 'PUESTO'
      Size = 100
    end
    object adoqryCFDIRIESGO_PUESTO: TWideStringField
      FieldName = 'RIESGO_PUESTO'
      Size = 5
    end
    object adoqryCFDIPERIORICIDAD_PAGO: TWideStringField
      FieldName = 'PERIORICIDAD_PAGO'
      Size = 5
    end
    object adoqryCFDISALARIO_BASE: TFloatField
      FieldName = 'SALARIO_BASE'
    end
    object adoqryCFDISALARIO_DIARIO_INTEGRADO: TFloatField
      FieldName = 'SALARIO_DIARIO_INTEGRADO'
    end
    object adoqryCFDIENTIDAD_FEDERATIVA: TWideStringField
      FieldName = 'ENTIDAD_FEDERATIVA'
      Size = 5
    end
    object adoqryCFDITOTAL_SUELDOS: TFloatField
      FieldName = 'TOTAL_SUELDOS'
    end
    object adoqryCFDITOTAL_GRAVADO: TFloatField
      FieldName = 'TOTAL_GRAVADO'
    end
    object adoqryCFDITOTAL_EXENTO: TFloatField
      FieldName = 'TOTAL_EXENTO'
    end
    object adoqryCFDITOTAL_OTRAS_DEDUCCIONES: TFloatField
      FieldName = 'TOTAL_OTRAS_DEDUCCIONES'
    end
    object adoqryCFDITOTAL_IMPUESTOS_RETENIDOS: TFloatField
      FieldName = 'TOTAL_IMPUESTOS_RETENIDOS'
    end
    object adoqryCFDICT: TWideStringField
      FieldName = 'CT'
      Size = 255
    end
    object adoqryCFDIFILIACION: TWideStringField
      FieldName = 'FILIACION'
      Size = 255
    end
    object adoqryCFDISUBSIDIO_CAUSADO: TFloatField
      FieldName = 'SUBSIDIO_CAUSADO'
    end
    object adoqryCFDITOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
    end
    object adoqryCFDIREGISTRO_PATRONAL: TWideStringField
      FieldName = 'REGISTRO_PATRONAL'
      Size = 255
    end
    object adoqryCFDITipoRelacion: TStringField
      FieldName = 'TipoRelacion'
      ReadOnly = True
      Size = 2
    end
    object adoqryCFDICfdiRelacionado1: TStringField
      FieldName = 'CfdiRelacionado1'
      Size = 36
    end
    object adoqryCFDIID_CFDI: TAutoIncField
      FieldName = 'ID_CFDI'
      ReadOnly = True
    end
  end
  object adoqryPercepciones: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CFDI'
        Attributes = [paSigned, paNullable]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ID_CONCEPTO, TIPO, CLAVE, CASE WHEN CLAVE_PLAZA IS NULL T' +
        'HEN CONCEPTO ELSE CLAVE_PLAZA + '#39' '#39' + CONCEPTO END AS CONCEPTO, ' +
        'IMPORTE, IMPORTE_EXENTO'
      'FROM CONCEPTOS'
      'WHERE TIPO_CONCEPTO = '#39'P'#39
      'AND ID_CFDI = :ID_CFDI'
      'ORDER BY CLAVE_PLAZA'
      '')
    Left = 56
    Top = 112
    object adoqryPercepcionesID_CONCEPTO: TAutoIncField
      FieldName = 'ID_CONCEPTO'
      ReadOnly = True
    end
    object adoqryPercepcionesTIPO: TWideStringField
      FieldName = 'TIPO'
      Size = 255
    end
    object adoqryPercepcionesCLAVE: TWideStringField
      FieldName = 'CLAVE'
      Size = 15
    end
    object adoqryPercepcionesCONCEPTO: TWideStringField
      FieldName = 'CONCEPTO'
      ReadOnly = True
      Size = 271
    end
    object adoqryPercepcionesIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object adoqryPercepcionesIMPORTE_EXENTO: TFloatField
      FieldName = 'IMPORTE_EXENTO'
    end
  end
  object adoqryDeducciones: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CFDI'
        Attributes = [paSigned, paNullable]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ID_CONCEPTO, TIPO, CLAVE, CASE WHEN CLAVE_PLAZA IS NULL T' +
        'HEN CONCEPTO ELSE CLAVE_PLAZA + '#39' '#39' + CONCEPTO END AS CONCEPTO, ' +
        'IMPORTE, IMPORTE_EXENTO'
      'FROM CONCEPTOS'
      'WHERE TIPO_CONCEPTO = '#39'D'#39
      'AND ID_CFDI = :ID_CFDI'
      'ORDER BY CLAVE_PLAZA'
      '')
    Left = 176
    Top = 112
    object adoqryDeduccionesID_CONCEPTO: TAutoIncField
      FieldName = 'ID_CONCEPTO'
      ReadOnly = True
    end
    object adoqryDeduccionesTIPO: TWideStringField
      FieldName = 'TIPO'
      Size = 255
    end
    object adoqryDeduccionesCLAVE: TWideStringField
      FieldName = 'CLAVE'
      Size = 15
    end
    object adoqryDeduccionesCONCEPTO: TWideStringField
      FieldName = 'CONCEPTO'
      ReadOnly = True
      Size = 271
    end
    object adoqryDeduccionesIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object adoqryDeduccionesIMPORTE_EXENTO: TFloatField
      FieldName = 'IMPORTE_EXENTO'
    end
  end
  object adoqryNominaCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Estatus'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT COUNT(*) AS CUENTA FROM CFDI'
      'WHERE Estatus = :Estatus')
    Left = 160
    Top = 32
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
  object adoqOtrosPagos: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CFDI'
        Attributes = [paSigned, paNullable]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ID_CONCEPTO, TIPO, CLAVE, CASE WHEN CLAVE_PLAZA IS NULL T' +
        'HEN CONCEPTO ELSE CLAVE_PLAZA + '#39' '#39' + CONCEPTO END AS CONCEPTO, ' +
        'IMPORTE, IMPORTE_EXENTO'
      'FROM CONCEPTOS'
      'WHERE TIPO_CONCEPTO = '#39'O'#39
      'AND ID_CFDI = :ID_CFDI'
      'ORDER BY CLAVE_PLAZA'
      '')
    Left = 56
    Top = 176
    object adoqOtrosPagosID_CONCEPTO: TAutoIncField
      FieldName = 'ID_CONCEPTO'
      ReadOnly = True
    end
    object adoqOtrosPagosTIPO: TWideStringField
      FieldName = 'TIPO'
      Size = 255
    end
    object adoqOtrosPagosCLAVE: TWideStringField
      FieldName = 'CLAVE'
      Size = 15
    end
    object adoqOtrosPagosCONCEPTO: TWideStringField
      FieldName = 'CONCEPTO'
      ReadOnly = True
      Size = 271
    end
    object adoqOtrosPagosIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object adoqOtrosPagosIMPORTE_EXENTO: TFloatField
      FieldName = 'IMPORTE_EXENTO'
    end
  end
  object adoqHorasExtra: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CONCEPTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM v_HORAS_EXTRAS '
      'WHERE ID_CONCEPTO = :ID_CONCEPTO')
    Left = 184
    Top = 192
    object adoqHorasExtraID_CONCEPTO: TIntegerField
      FieldName = 'ID_CONCEPTO'
    end
    object adoqHorasExtraTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 2
    end
    object adoqHorasExtraDias: TFloatField
      FieldName = 'Dias'
    end
    object adoqHorasExtraHorasExtra: TFloatField
      FieldName = 'HorasExtra'
      ReadOnly = True
    end
    object adoqHorasExtraImporte: TFloatField
      FieldName = 'Importe'
      ReadOnly = True
    end
  end
end
