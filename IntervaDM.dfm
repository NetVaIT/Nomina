object dmInterva: TdmInterva
  OldCreateOrder = False
  Height = 349
  Width = 377
  object adoqryCFDI: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT        CFD.ID, CFD.CFDCFDILINK, CFDINOMINAS.IDCFDINomina,' +
        ' CFD.SERIE, CFD.FOLIO, CFD.FORMADEPAGO, CFD.SUBTOTAL, CFD.DESCUE' +
        'NTO, CFD.MOTIVODESCUENTO, CFD.TOTAL, '
      
        '                         CASE WHEN CFD.METODODEPAGO = '#39'Efectivo'#39 +
        ' THEN '#39'01'#39' WHEN CFD.METODODEPAGO LIKE '#39'Cheque%'#39' THEN '#39'02'#39' WHEN C' +
        'FD.METODODEPAGO LIKE '#39'Transferencia%'#39' THEN '#39'03'#39' ELSE CFD.METODOD' +
        'EPAGO END'
      
        '                          AS METODODEPAGO, CFD.TIPODECOMPROBANTE' +
        ', '#39'MORELIA, MICHOACAN'#39' AS LugarExpedicion, CFD.RFCEMISOR, CFD.RA' +
        'ZONSOCIALEMISOR, CFD.CALLEDMEMISOR, CFD.NUMEXTDMEMISOR, '
      
        '                         CFD.NUMINTDMEMISOR, CFD.COLONIADMEMISOR' +
        ', CFD.LOCALIDADDMEMISOR, CFD.MUNICIPIODMEMISOR, CFD.ESTADODMEMIS' +
        'OR, CFD.PAISDMEMISOR, CFD.CODIGOPOSTALDMEMISOR, '
      
        '                         CFD.REGIMENFISCAL, CFD.RFCRECEPTOR, CFD' +
        '.RAZONSOCIALRECEPTOR, CFD.PAISDMRECEPTOR, CFD.TOTALIMPUESTORETEN' +
        'IDO, CFD.TOTALIMPUESTOTRASLADADO, CFD.FECHA, CFD.MONEDA, '
      
        '                         CFD.TIPOCAMBIO, CFD.NUMCTAPAGO, CFDINOM' +
        'INAS.Version, CFDINOMINAS.RegistroPatronal, CFDINOMINAS.NumEmple' +
        'ado, CFDINOMINAS.CURP, CFDINOMINAS.TipoRegimen, '
      
        '                         CFDINOMINAS.NumSeguridadSocial, CFDINOM' +
        'INAS.FechaPago, CFDINOMINAS.FechaInicialPago, CFDINOMINAS.FechaF' +
        'inalPago, CFDINOMINAS.NumDiasPagados, CFDINOMINAS.Departamento, '
      
        '                         CFDINOMINAS.CLABE, CFDINOMINAS.Banco, C' +
        'FDINOMINAS.FechaInicioRelLaboral, CFDINOMINAS.Antiguedad, CFDINO' +
        'MINAS.Puesto, CFDINOMINAS.TipoContrato, CFDINOMINAS.TipoJornada,' +
        ' '
      
        '                         CFDINOMINAS.PeriodicidadPago, CFDINOMIN' +
        'AS.SalarioBaseCotApor, CFDINOMINAS.RiesgoPuesto, CFDINOMINAS.Sal' +
        'arioDiarioIntegrado, CFDINOMINAS.TotalGravadoPercepcion, '
      
        '                         CFDINOMINAS.TotalExentoPercepcion, CFDI' +
        'NOMINAS.TotalGravadoDeduccion, CFDINOMINAS.TotalExentoDeduccion,' +
        ' CFDINOMINAS.Origen'
      'FROM            CFD INNER JOIN'
      
        '                         CFDINOMINAS ON CFD.CFDCFDILINK = CFDINO' +
        'MINAS.IDCFDI')
    Left = 56
    Top = 32
    object adoqryCFDIID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adoqryCFDICFDCFDILINK: TLargeintField
      FieldName = 'CFDCFDILINK'
    end
    object adoqryCFDIIDCFDINomina: TLargeintField
      FieldName = 'IDCFDINomina'
      ReadOnly = True
    end
    object adoqryCFDISERIE: TStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object adoqryCFDIFOLIO: TStringField
      FieldName = 'FOLIO'
    end
    object adoqryCFDIFORMADEPAGO: TStringField
      FieldName = 'FORMADEPAGO'
      Size = 50
    end
    object adoqryCFDISUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Precision = 19
    end
    object adoqryCFDIDESCUENTO: TBCDField
      FieldName = 'DESCUENTO'
      Precision = 19
    end
    object adoqryCFDIMOTIVODESCUENTO: TStringField
      FieldName = 'MOTIVODESCUENTO'
      Size = 250
    end
    object adoqryCFDITOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object adoqryCFDIMETODODEPAGO: TStringField
      FieldName = 'METODODEPAGO'
      Size = 250
    end
    object adoqryCFDITIPODECOMPROBANTE: TStringField
      FieldName = 'TIPODECOMPROBANTE'
      Size = 50
    end
    object adoqryCFDILugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      ReadOnly = True
      Size = 18
    end
    object adoqryCFDIRFCEMISOR: TStringField
      FieldName = 'RFCEMISOR'
      Size = 13
    end
    object adoqryCFDIREGIMENFISCAL: TStringField
      FieldName = 'REGIMENFISCAL'
      Size = 250
    end
    object adoqryCFDIRFCRECEPTOR: TStringField
      FieldName = 'RFCRECEPTOR'
      Size = 13
    end
    object adoqryCFDIRAZONSOCIALRECEPTOR: TStringField
      FieldName = 'RAZONSOCIALRECEPTOR'
      Size = 250
    end
    object adoqryCFDIPAISDMRECEPTOR: TStringField
      FieldName = 'PAISDMRECEPTOR'
      Size = 200
    end
    object adoqryCFDITOTALIMPUESTORETENIDO: TBCDField
      FieldName = 'TOTALIMPUESTORETENIDO'
      Precision = 19
    end
    object adoqryCFDITOTALIMPUESTOTRASLADADO: TBCDField
      FieldName = 'TOTALIMPUESTOTRASLADADO'
      Precision = 19
    end
    object adoqryCFDIRAZONSOCIALEMISOR: TStringField
      FieldName = 'RAZONSOCIALEMISOR'
      Size = 250
    end
    object adoqryCFDIFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object adoqryCFDIMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 100
    end
    object adoqryCFDITIPOCAMBIO: TStringField
      FieldName = 'TIPOCAMBIO'
    end
    object adoqryCFDINUMCTAPAGO: TStringField
      FieldName = 'NUMCTAPAGO'
    end
    object adoqryCFDIVersion: TStringField
      FieldName = 'Version'
      Size = 10
    end
    object adoqryCFDIRegistroPatronal: TStringField
      FieldName = 'RegistroPatronal'
    end
    object adoqryCFDINumEmpleado: TStringField
      FieldName = 'NumEmpleado'
      Size = 15
    end
    object adoqryCFDICURP: TStringField
      FieldName = 'CURP'
      Size = 18
    end
    object adoqryCFDITipoRegimen: TIntegerField
      FieldName = 'TipoRegimen'
    end
    object adoqryCFDINumSeguridadSocial: TStringField
      FieldName = 'NumSeguridadSocial'
      Size = 15
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
    object adoqryCFDIDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 100
    end
    object adoqryCFDICLABE: TStringField
      FieldName = 'CLABE'
      Size = 18
    end
    object adoqryCFDIBanco: TStringField
      FieldName = 'Banco'
      Size = 3
    end
    object adoqryCFDIFechaInicioRelLaboral: TDateTimeField
      FieldName = 'FechaInicioRelLaboral'
    end
    object adoqryCFDIAntiguedad: TIntegerField
      FieldName = 'Antiguedad'
    end
    object adoqryCFDIPuesto: TStringField
      FieldName = 'Puesto'
      Size = 50
    end
    object adoqryCFDITipoContrato: TStringField
      FieldName = 'TipoContrato'
      Size = 50
    end
    object adoqryCFDITipoJornada: TStringField
      FieldName = 'TipoJornada'
      Size = 50
    end
    object adoqryCFDIPeriodicidadPago: TStringField
      FieldName = 'PeriodicidadPago'
      Size = 50
    end
    object adoqryCFDISalarioBaseCotApor: TFMTBCDField
      FieldName = 'SalarioBaseCotApor'
      Precision = 18
      Size = 6
    end
    object adoqryCFDIRiesgoPuesto: TIntegerField
      FieldName = 'RiesgoPuesto'
    end
    object adoqryCFDISalarioDiarioIntegrado: TFMTBCDField
      FieldName = 'SalarioDiarioIntegrado'
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
    object adoqryCFDITotalGravadoDeduccion: TFMTBCDField
      FieldName = 'TotalGravadoDeduccion'
      Precision = 18
      Size = 6
    end
    object adoqryCFDITotalExentoDeduccion: TFMTBCDField
      FieldName = 'TotalExentoDeduccion'
      Precision = 18
      Size = 6
    end
    object adoqryCFDIOrigen: TIntegerField
      FieldName = 'Origen'
    end
    object adoqryCFDICALLEDMEMISOR: TStringField
      FieldName = 'CALLEDMEMISOR'
      Size = 200
    end
    object adoqryCFDINUMEXTDMEMISOR: TStringField
      FieldName = 'NUMEXTDMEMISOR'
    end
    object adoqryCFDINUMINTDMEMISOR: TStringField
      FieldName = 'NUMINTDMEMISOR'
    end
    object adoqryCFDICOLONIADMEMISOR: TStringField
      FieldName = 'COLONIADMEMISOR'
      Size = 200
    end
    object adoqryCFDILOCALIDADDMEMISOR: TStringField
      FieldName = 'LOCALIDADDMEMISOR'
      Size = 200
    end
    object adoqryCFDIMUNICIPIODMEMISOR: TStringField
      FieldName = 'MUNICIPIODMEMISOR'
      Size = 200
    end
    object adoqryCFDIESTADODMEMISOR: TStringField
      FieldName = 'ESTADODMEMISOR'
      Size = 200
    end
    object adoqryCFDIPAISDMEMISOR: TStringField
      FieldName = 'PAISDMEMISOR'
      Size = 200
    end
    object adoqryCFDICODIGOPOSTALDMEMISOR: TStringField
      FieldName = 'CODIGOPOSTALDMEMISOR'
      Size = 5
    end
  end
  object adoqryConceptos: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDCFD'
        Attributes = [paSigned, paNullable]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ID, CANTIDAD, UNIDAD, CLAVE, VALORUNITARIO, IMPORTE, DESC' +
        'RIPCION'
      'FROM            CFDCONCEPTOS'
      'WHERE        (CFDLINK = :IDCFD)')
    Left = 160
    Top = 32
    object adoqryConceptosID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adoqryConceptosCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      Precision = 19
    end
    object adoqryConceptosUNIDAD: TStringField
      FieldName = 'UNIDAD'
      Size = 100
    end
    object adoqryConceptosCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 100
    end
    object adoqryConceptosVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Precision = 19
    end
    object adoqryConceptosIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      Precision = 19
    end
    object adoqryConceptosDESCRIPCION: TMemoField
      FieldName = 'DESCRIPCION'
      BlobType = ftMemo
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
      
        'SELECT        IdCFDIConceptoNomina, TipoPer_TipoDed, Clave, Conc' +
        'epto, ImporteGravado, ImporteExento'
      'FROM            CFDICONCEPTOSNOMINA'
      'WHERE Clase = '#39'Percepcion'#39
      'AND IdCFDINomina = :IdCFDINomina')
    Left = 56
    Top = 112
    object adoqryPercepcionesIdCFDIConceptoNomina: TLargeintField
      FieldName = 'IdCFDIConceptoNomina'
      ReadOnly = True
    end
    object adoqryPercepcionesTipoPer_TipoDed: TStringField
      FieldName = 'TipoPer_TipoDed'
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
      
        'SELECT        IdCFDIConceptoNomina, TipoPer_TipoDed, Clave, Conc' +
        'epto, ImporteGravado, ImporteExento'
      'FROM            CFDICONCEPTOSNOMINA'
      'WHERE Clase = '#39'Deduccion'#39
      'AND IdCFDINomina = :IdCFDINomina')
    Left = 176
    Top = 112
    object adoqryDeduccionesIdCFDIConceptoNomina: TLargeintField
      FieldName = 'IdCFDIConceptoNomina'
      ReadOnly = True
    end
    object adoqryDeduccionesTipoPer_TipoDed: TStringField
      FieldName = 'TipoPer_TipoDed'
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
    object adoqryDeduccionesImporteGravado: TFMTBCDField
      FieldName = 'ImporteGravado'
      Precision = 18
      Size = 6
    end
    object adoqryDeduccionesImporteExento: TFMTBCDField
      FieldName = 'ImporteExento'
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
    Top = 184
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
    Top = 184
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
  object adoqryNominaCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT COUNT(*) AS CUENTA FROM CFD ')
    Left = 296
    Top = 32
    object adoqryNominaCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
end
