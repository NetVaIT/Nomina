object dmInterva: TdmInterva
  OldCreateOrder = False
  Height = 347
  Width = 321
  object adoqryCFDI: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Estatus'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        N.IDCFDI, N.IDCFDINomina, CFDI.fSerie AS Serie, CF' +
        'DI.fFolio AS Folio, N.TotalPercepciones + N.TotalOtrosPagos AS S' +
        'ubtotal, N.TotalDeducciones AS Descuento, CFDI.fTotal AS Total, ' +
        #39'04'#39' AS TipoRelacion, '
      
        '                         CFDI.fuuid AS CfdiRelacionado1, CFDI.fr' +
        'fcreceptor AS ReceptorRFC, CFDI.frazonsocialreceptor AS Receptor' +
        'Nombre, N.TotalPercepciones + N.TotalOtrosPagos AS ConceptoValor' +
        'Unitario, '
      
        '                         N.TotalPercepciones + N.TotalOtrosPagos' +
        ' AS ConceptoImporte, N.TotalDeducciones AS ConceptoDescuento, N.' +
        'TipoNomina, N.FechaPago, N.FechaInicialPago, N.FechaFinalPago, N' +
        '.NumDiasPagados, N.TotalPercepciones, '
      
        '                         N.TotalDeducciones, N.TotalOtrosPagos, ' +
        'N.OrigenRecurso, N.MontoRecursoPropio, N.RegistroPatronal, N.CUR' +
        'P AS ReceptorCURP, N.NumSeguridadSocial, N.FechaInicioRelLaboral' +
        ', N.Antiguedad, N.TipoContrato, '
      
        '                         N.Sindicalizado, N.TipoJornada, N.TipoR' +
        'egimen, N.NumEmpleado, N.Departamento, N.Puesto, N.RiesgoPuesto,' +
        ' N.PeriodicidadPago, N.Banco, N.CLABE, N.SalarioBaseCotApor, N.S' +
        'alarioDiarioIntegrado, N.ClaveEntFed, '
      
        '                         N.TotalSueldos, N.TotalGravadoPercepcio' +
        'n, N.TotalExentoPercepcion, N.TotalOtrasDeducciones, N.TotalImpu' +
        'estosRetenidos, N.SubsidioCausado, N.TotalSeparacionIndemnizacio' +
        'n, N.TotalJubilacionPensionRetiro, '
      
        '                         N.SI_TotalPagado, N.SI_NumAniosServicio' +
        ', N.SI_UltimoSueldoMensOrd, N.SI_IngresoAcumulable, N.SI_Ingreso' +
        'NoAcumulable'
      'FROM            CFDCFDI AS CFDI INNER JOIN'
      '                         CFDINOMINAS AS N ON CFDI.ID = N.IDCFDI'
      'WHERE CFDI.statusproceso = :Estatus'
      'ORDER BY ReceptorRFC, IDCFDI')
    Left = 56
    Top = 24
    object adoqryCFDIIDCFDI: TLargeintField
      FieldName = 'IDCFDI'
    end
    object adoqryCFDIIDCFDINomina: TLargeintField
      FieldName = 'IDCFDINomina'
      ReadOnly = True
    end
    object adoqryCFDISerie: TStringField
      FieldName = 'Serie'
      Size = 250
    end
    object adoqryCFDIFolio: TStringField
      FieldName = 'Folio'
      Size = 250
    end
    object adoqryCFDISubtotal: TFMTBCDField
      FieldName = 'Subtotal'
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object adoqryCFDIDescuento: TFMTBCDField
      FieldName = 'Descuento'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotal: TBCDField
      FieldName = 'Total'
      Precision = 19
    end
    object adoqryCFDITipoRelacion: TStringField
      FieldName = 'TipoRelacion'
      ReadOnly = True
      Size = 2
    end
    object adoqryCFDICfdiRelacionado1: TStringField
      FieldName = 'CfdiRelacionado1'
      Size = 38
    end
    object adoqryCFDIReceptorRFC: TStringField
      FieldName = 'ReceptorRFC'
      Size = 13
    end
    object adoqryCFDIReceptorNombre: TStringField
      FieldName = 'ReceptorNombre'
      Size = 250
    end
    object adoqryCFDIConceptoValorUnitario: TFMTBCDField
      FieldName = 'ConceptoValorUnitario'
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object adoqryCFDIConceptoImporte: TFMTBCDField
      FieldName = 'ConceptoImporte'
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object adoqryCFDIConceptoDescuento: TFMTBCDField
      FieldName = 'ConceptoDescuento'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITipoNomina: TStringField
      FieldName = 'TipoNomina'
      Size = 5
    end
    object adoqryCFDIFechaPago: TDateTimeField
      FieldName = 'FechaPago'
    end
    object adoqryCFDIFechaInicialPago: TDateTimeField
      FieldName = 'FechaInicialPago'
    end
    object adoqryCFDIFechaFinalPago: TDateTimeField
      FieldName = 'FechaFinalPago'
    end
    object adoqryCFDINumDiasPagados: TFloatField
      FieldName = 'NumDiasPagados'
    end
    object adoqryCFDITotalPercepciones: TFMTBCDField
      FieldName = 'TotalPercepciones'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalDeducciones: TFMTBCDField
      FieldName = 'TotalDeducciones'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalOtrosPagos: TFMTBCDField
      FieldName = 'TotalOtrosPagos'
      Precision = 18
      Size = 6
    end
    object adoqryCFDIOrigenRecurso: TStringField
      FieldName = 'OrigenRecurso'
      ReadOnly = True
      Size = 2
    end
    object adoqryCFDIMontoRecursoPropio: TBCDField
      FieldName = 'MontoRecursoPropio'
      ReadOnly = True
      Precision = 1
      Size = 1
    end
    object adoqryCFDIRegistroPatronal: TStringField
      FieldName = 'RegistroPatronal'
    end
    object adoqryCFDIReceptorCURP: TStringField
      FieldName = 'ReceptorCURP'
      Size = 18
    end
    object adoqryCFDINumSeguridadSocial: TStringField
      FieldName = 'NumSeguridadSocial'
      Size = 15
    end
    object adoqryCFDIFechaInicioRelLaboral: TDateTimeField
      FieldName = 'FechaInicioRelLaboral'
    end
    object adoqryCFDIAntiguedad: TStringField
      FieldName = 'Antiguedad'
      Size = 10
    end
    object adoqryCFDITipoContrato: TStringField
      FieldName = 'TipoContrato'
      Size = 50
    end
    object adoqryCFDISindicalizado: TStringField
      FieldName = 'Sindicalizado'
      Size = 5
    end
    object adoqryCFDITipoJornada: TStringField
      FieldName = 'TipoJornada'
      Size = 50
    end
    object adoqryCFDITipoRegimen: TStringField
      FieldName = 'TipoRegimen'
      Size = 5
    end
    object adoqryCFDINumEmpleado: TStringField
      FieldName = 'NumEmpleado'
      Size = 15
    end
    object adoqryCFDIDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 100
    end
    object adoqryCFDIPuesto: TStringField
      FieldName = 'Puesto'
      Size = 50
    end
    object adoqryCFDIRiesgoPuesto: TIntegerField
      FieldName = 'RiesgoPuesto'
    end
    object adoqryCFDIPeriodicidadPago: TStringField
      FieldName = 'PeriodicidadPago'
      Size = 50
    end
    object adoqryCFDIBanco: TStringField
      FieldName = 'Banco'
      Size = 3
    end
    object adoqryCFDICLABE: TStringField
      FieldName = 'CLABE'
      Size = 18
    end
    object adoqryCFDISalarioBaseCotApor: TFMTBCDField
      FieldName = 'SalarioBaseCotApor'
      Precision = 18
      Size = 6
    end
    object adoqryCFDISalarioDiarioIntegrado: TFMTBCDField
      FieldName = 'SalarioDiarioIntegrado'
      Precision = 18
      Size = 6
    end
    object adoqryCFDIClaveEntFed: TStringField
      FieldName = 'ClaveEntFed'
      Size = 5
    end
    object adoqryCFDITotalSueldos: TFMTBCDField
      FieldName = 'TotalSueldos'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalGravadoPercepcion: TFMTBCDField
      FieldName = 'TotalGravadoPercepcion'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalExentoPercepcion: TFMTBCDField
      FieldName = 'TotalExentoPercepcion'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalOtrasDeducciones: TFMTBCDField
      FieldName = 'TotalOtrasDeducciones'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalImpuestosRetenidos: TFMTBCDField
      FieldName = 'TotalImpuestosRetenidos'
      Precision = 18
      Size = 6
    end
    object adoqryCFDISubsidioCausado: TBCDField
      FieldName = 'SubsidioCausado'
      Precision = 19
    end
    object adoqryCFDITotalSeparacionIndemnizacion: TBCDField
      FieldName = 'TotalSeparacionIndemnizacion'
      Precision = 19
    end
    object adoqryCFDITotalJubilacionPensionRetiro: TBCDField
      FieldName = 'TotalJubilacionPensionRetiro'
      Precision = 19
    end
    object adoqryCFDISI_TotalPagado: TBCDField
      FieldName = 'SI_TotalPagado'
      Precision = 19
    end
    object adoqryCFDISI_NumAniosServicio: TIntegerField
      FieldName = 'SI_NumAniosServicio'
    end
    object adoqryCFDISI_UltimoSueldoMensOrd: TBCDField
      FieldName = 'SI_UltimoSueldoMensOrd'
      Precision = 19
    end
    object adoqryCFDISI_IngresoAcumulable: TBCDField
      FieldName = 'SI_IngresoAcumulable'
      Precision = 19
    end
    object adoqryCFDISI_IngresoNoAcumulable: TBCDField
      FieldName = 'SI_IngresoNoAcumulable'
      Precision = 19
    end
  end
  object adoqryNominaCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Estatus'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT COUNT(*) AS CUENTA FROM CFDCFDI'
      'WHERE statusproceso = :Estatus')
    Left = 176
    Top = 24
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
  object adoqryPercepciones: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IdCFDINomina'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        IdCFDIConceptoNomina, TipoPer_TipoDed AS Tipo, Cla' +
        've, Concepto, ImporteGravado, ImporteExento'
      'FROM            CFDICONCEPTOSNOMINA'
      'WHERE Clase = '#39'Percepcion'#39
      'AND IdCFDINomina = :IdCFDINomina')
    Left = 56
    Top = 96
    object adoqryPercepcionesIdCFDIConceptoNomina: TLargeintField
      FieldName = 'IdCFDIConceptoNomina'
      ReadOnly = True
    end
    object adoqryPercepcionesTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object adoqryPercepcionesClave: TStringField
      FieldName = 'Clave'
      Size = 15
    end
    object adoqryPercepcionesConcepto: TStringField
      FieldName = 'Concepto'
      Size = 100
    end
    object adoqryPercepcionesImporteGravado: TFMTBCDField
      FieldName = 'ImporteGravado'
      Precision = 18
      Size = 6
    end
    object adoqryPercepcionesImporteExento: TFMTBCDField
      FieldName = 'ImporteExento'
      Precision = 18
      Size = 6
    end
  end
  object adoqryDeducciones: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IdCFDINomina'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        IdCFDIConceptoNomina, TipoPer_TipoDed AS Tipo, Cla' +
        've, Concepto, ImporteGravado AS Importe'
      'FROM            CFDICONCEPTOSNOMINA'
      'WHERE Clase = '#39'Deduccion'#39
      'AND IdCFDINomina = :IdCFDINomina')
    Left = 176
    Top = 96
    object adoqryDeduccionesIdCFDIConceptoNomina: TLargeintField
      FieldName = 'IdCFDIConceptoNomina'
      ReadOnly = True
    end
    object adoqryDeduccionesTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object adoqryDeduccionesClave: TStringField
      FieldName = 'Clave'
      Size = 15
    end
    object adoqryDeduccionesConcepto: TStringField
      FieldName = 'Concepto'
      Size = 100
    end
    object adoqryDeduccionesImporte: TFMTBCDField
      FieldName = 'Importe'
      Precision = 18
      Size = 6
    end
  end
  object adoqryIncapacidades: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IdCFDINomina'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        IdCFDIIncapacidadNomina, DiasIncapacidad, TipoInca' +
        'pacidad, Descuento'
      'FROM            CFDIINCAPACIDADESNOMINA'
      'WHERE        (IdCFDINomina = :IdCFDINomina)'
      '')
    Left = 56
    Top = 168
    object adoqryIncapacidadesIdCFDIIncapacidadNomina: TAutoIncField
      FieldName = 'IdCFDIIncapacidadNomina'
      ReadOnly = True
    end
    object adoqryIncapacidadesDiasIncapacidad: TFloatField
      FieldName = 'DiasIncapacidad'
    end
    object adoqryIncapacidadesTipoIncapacidad: TIntegerField
      FieldName = 'TipoIncapacidad'
    end
    object adoqryIncapacidadesDescuento: TFMTBCDField
      FieldName = 'Descuento'
      Precision = 18
      Size = 6
    end
  end
  object adoqryHorasExtra: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDCFDINomina'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        IDCFDIHoraExtraNomina, Dias, TipoHoras, HorasExtra' +
        ', ImportePagado'
      'FROM            CFDIHORASEXTRANOMINA'
      'WHERE        (IDCFDINomina = :IDCFDINomina)')
    Left = 176
    Top = 168
    object adoqryHorasExtraIDCFDIHoraExtraNomina: TAutoIncField
      FieldName = 'IDCFDIHoraExtraNomina'
      ReadOnly = True
    end
    object adoqryHorasExtraDias: TIntegerField
      FieldName = 'Dias'
    end
    object adoqryHorasExtraTipoHoras: TStringField
      FieldName = 'TipoHoras'
      Size = 10
    end
    object adoqryHorasExtraHorasExtra: TIntegerField
      FieldName = 'HorasExtra'
    end
    object adoqryHorasExtraImportePagado: TFMTBCDField
      FieldName = 'ImportePagado'
      Precision = 18
      Size = 6
    end
  end
  object adoqOtrosPagos: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IdCFDINomina'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        IdCFDIConceptoNomina, TipoPer_TipoDed AS Tipo, Cla' +
        've, Concepto, ImporteGravado AS Importe'
      'FROM            CFDICONCEPTOSNOMINA'
      'WHERE Clase = '#39'OtroPago'#39
      'AND IdCFDINomina = :IdCFDINomina')
    Left = 56
    Top = 248
    object adoqOtrosPagosIdCFDIConceptoNomina: TLargeintField
      FieldName = 'IdCFDIConceptoNomina'
      ReadOnly = True
    end
    object adoqOtrosPagosTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object adoqOtrosPagosClave: TStringField
      FieldName = 'Clave'
      Size = 15
    end
    object adoqOtrosPagosConcepto: TStringField
      FieldName = 'Concepto'
      Size = 100
    end
    object adoqOtrosPagosImporte: TFMTBCDField
      FieldName = 'Importe'
      Precision = 18
      Size = 6
    end
  end
end
