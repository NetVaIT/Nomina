object dmXMLtoPDFNomina: TdmXMLtoPDFNomina
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 365
  Width = 885
  object XMLtN11: TXMLTransform
    Left = 40
    Top = 32
  end
  object XMLtpN11: TXMLTransformProvider
    TransformRead.TransformationFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Doc\cfdv32_N11.xtr'
    XMLDataFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Ejemplo_CFDI32N11.XML'
    Left = 40
    Top = 80
  end
  object cdsN11: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 32
    object cdsN11Version: TStringField
      FieldName = 'Version'
      Required = True
      Size = 31
    end
    object cdsN11RegistroPatronal: TStringField
      FieldName = 'RegistroPatronal'
    end
    object cdsN11NumEmpleado: TStringField
      FieldName = 'NumEmpleado'
      Required = True
      Size = 15
    end
    object cdsN11CURP: TStringField
      FieldName = 'CURP'
      Required = True
      Size = 31
    end
    object cdsN11TipoRegimen: TIntegerField
      FieldName = 'TipoRegimen'
      Required = True
    end
    object cdsN11NumSeguridadSocial: TStringField
      FieldName = 'NumSeguridadSocial'
      Size = 15
    end
    object cdsN11FechaPago: TDateField
      FieldName = 'FechaPago'
      Required = True
    end
    object cdsN11FechaInicialPago: TDateField
      FieldName = 'FechaInicialPago'
      Required = True
    end
    object cdsN11FechaFinalPago: TDateField
      FieldName = 'FechaFinalPago'
      Required = True
    end
    object cdsN11NumDiasPagados: TBCDField
      FieldName = 'NumDiasPagados'
      Required = True
      Precision = 14
    end
    object cdsN11Departamento: TStringField
      FieldName = 'Departamento'
      Size = 100
    end
    object cdsN11CLABE: TIntegerField
      FieldName = 'CLABE'
    end
    object cdsN11Banco: TIntegerField
      FieldName = 'Banco'
    end
    object cdsN11FechaInicioRelLaboral: TDateField
      FieldName = 'FechaInicioRelLaboral'
    end
    object cdsN11Antiguedad: TIntegerField
      FieldName = 'Antiguedad'
    end
    object cdsN11Puesto: TStringField
      FieldName = 'Puesto'
      Size = 31
    end
    object cdsN11TipoContrato: TStringField
      FieldName = 'TipoContrato'
      Size = 31
    end
    object cdsN11TipoJornada: TStringField
      FieldName = 'TipoJornada'
      Size = 31
    end
    object cdsN11PeriodicidadPago: TStringField
      FieldName = 'PeriodicidadPago'
      Required = True
      Size = 100
    end
    object cdsN11SalarioBaseCotApor: TBCDField
      FieldName = 'SalarioBaseCotApor'
      Precision = 14
    end
    object cdsN11RiesgoPuesto: TIntegerField
      FieldName = 'RiesgoPuesto'
    end
    object cdsN11SalarioDiarioIntegrado: TBCDField
      FieldName = 'SalarioDiarioIntegrado'
      Precision = 14
    end
    object cdsN11Percepciones_TotalGravado: TBCDField
      FieldName = 'Percepciones_TotalGravado'
      Required = True
      Precision = 14
    end
    object cdsN11Percepciones_TotalExento: TBCDField
      FieldName = 'Percepciones_TotalExento'
      Required = True
      Precision = 14
    end
    object cdsN11Deducciones_TotalGravado: TBCDField
      FieldName = 'Deducciones_TotalGravado'
      Required = True
      Precision = 14
    end
    object cdsN11Deducciones_TotalExento: TBCDField
      FieldName = 'Deducciones_TotalExento'
      Required = True
      Precision = 14
    end
    object cdsN11Percepcion: TDataSetField
      FieldName = 'Percepcion'
      UnNamed = True
    end
    object cdsN11Deduccion: TDataSetField
      FieldName = 'Deduccion'
      UnNamed = True
    end
    object cdsN11Incapacidad: TDataSetField
      FieldName = 'Incapacidad'
      UnNamed = True
    end
    object cdsN11HorasExtra: TDataSetField
      FieldName = 'HorasExtra'
      UnNamed = True
    end
  end
  object dsN11: TDataSource
    AutoEdit = False
    DataSet = cdsN11
    Left = 120
    Top = 80
  end
  object dbpN11: TppDBPipeline
    DataSource = dsN11
    UserName = 'N11'
    Left = 120
    Top = 128
  end
  object cdsN11Percepciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN11Percepcion
    Params = <>
    Left = 200
    Top = 32
    object cdsN11PercepcionesTipoPercepcion: TIntegerField
      FieldName = 'TipoPercepcion'
      Required = True
    end
    object cdsN11PercepcionesClave: TStringField
      FieldName = 'Clave'
      Required = True
      Size = 15
    end
    object cdsN11PercepcionesConcepto: TStringField
      FieldName = 'Concepto'
      Required = True
      Size = 100
    end
    object cdsN11PercepcionesImporteGravado: TBCDField
      FieldName = 'ImporteGravado'
      Required = True
      Precision = 14
    end
    object cdsN11PercepcionesImporteExento: TBCDField
      FieldName = 'ImporteExento'
      Required = True
      Precision = 14
    end
  end
  object dsN11Percepciones: TDataSource
    DataSet = cdsN11Percepciones
    Left = 200
    Top = 80
  end
  object dbpN11Percepciones: TppDBPipeline
    DataSource = dsN11Percepciones
    UserName = 'N11Percepciones'
    Left = 200
    Top = 128
  end
  object cdsN11Deducciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN11Deduccion
    Params = <>
    Left = 304
    Top = 32
    object cdsN11DeduccionesTipoDeduccion: TIntegerField
      FieldName = 'TipoDeduccion'
      Required = True
    end
    object cdsN11DeduccionesClave: TStringField
      FieldName = 'Clave'
      Required = True
      Size = 15
    end
    object cdsN11DeduccionesConcepto: TStringField
      FieldName = 'Concepto'
      Required = True
      Size = 100
    end
    object cdsN11DeduccionesImporteGravado: TBCDField
      FieldName = 'ImporteGravado'
      Required = True
      Precision = 14
    end
    object cdsN11DeduccionesImporteExento: TBCDField
      FieldName = 'ImporteExento'
      Required = True
      Precision = 14
    end
  end
  object dsN11Deducciones: TDataSource
    DataSet = cdsN11Deducciones
    Left = 304
    Top = 80
  end
  object dbpN11Deducciones: TppDBPipeline
    DataSource = dsN11Deducciones
    UserName = 'N11Deducciones'
    Left = 304
    Top = 128
  end
  object cdsN11Incapacidades: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN11Incapacidad
    Params = <>
    Left = 416
    Top = 32
    object cdsN11IncapacidadesDiasIncapacidad: TBCDField
      FieldName = 'DiasIncapacidad'
      Required = True
      Precision = 14
    end
    object cdsN11IncapacidadesTipoIncapacidad: TIntegerField
      FieldName = 'TipoIncapacidad'
      Required = True
    end
    object cdsN11IncapacidadesDescuento: TBCDField
      FieldName = 'Descuento'
      Required = True
      Precision = 14
    end
  end
  object dsN11Incapacidades: TDataSource
    DataSet = cdsN11Incapacidades
    Left = 416
    Top = 80
  end
  object dbpN11Incapacidades: TppDBPipeline
    DataSource = dsN11Incapacidades
    UserName = 'N11Incapacidades'
    Left = 416
    Top = 128
  end
  object cdsN11HorasExtras: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN11HorasExtra
    Params = <>
    Left = 528
    Top = 32
    object cdsN11HorasExtrasDias: TIntegerField
      FieldName = 'Dias'
      Required = True
    end
    object cdsN11HorasExtrasTipoHoras: TStringField
      FieldName = 'TipoHoras'
      Required = True
      Size = 31
    end
    object cdsN11HorasExtrasHorasExtra: TIntegerField
      FieldName = 'HorasExtra'
      Required = True
    end
    object cdsN11HorasExtrasImportePagado: TBCDField
      FieldName = 'ImportePagado'
      Required = True
      Precision = 14
    end
  end
  object dsN11HorasExtras: TDataSource
    DataSet = cdsN11HorasExtras
    Left = 528
    Top = 80
  end
  object dbpN11HorasExtras: TppDBPipeline
    DataSource = dsN11HorasExtras
    UserName = 'N11HorasExtras'
    Left = 528
    Top = 128
  end
  object XMLtN12: TXMLTransform
    Left = 40
    Top = 200
  end
  object XMLtpN12: TXMLTransformProvider
    TransformRead.TransformationFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Doc\cfdv33_N12.xtr'
    XMLDataFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Ejemplo_CFDI32N12.XML'
    Left = 40
    Top = 248
  end
  object cdsCFDI: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 200
    object cdsCFDIVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 31
    end
    object cdsCFDIComplemento: TDataSetField
      FieldName = 'Complemento'
      UnNamed = True
    end
  end
  object dsCFDI: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI
    Left = 136
    Top = 248
  end
  object dppCFDI: TppDBPipeline
    DataSource = dsCFDI
    UserName = 'None'
    Visible = False
    Left = 136
    Top = 296
  end
  object cdsN12: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDIComplemento
    Params = <>
    Left = 200
    Top = 200
    object cdsN12Version: TStringField
      FieldName = 'Version'
      Required = True
      Size = 31
    end
    object cdsN12TipoNomina: TStringField
      FieldName = 'TipoNomina'
      Required = True
      Size = 31
    end
    object cdsN12FechaPago: TDateField
      FieldName = 'FechaPago'
      Required = True
    end
    object cdsN12FechaInicialPago: TDateField
      FieldName = 'FechaInicialPago'
      Required = True
    end
    object cdsN12FechaFinalPago: TDateField
      FieldName = 'FechaFinalPago'
      Required = True
    end
    object cdsN12NumDiasPagados: TBCDField
      FieldName = 'NumDiasPagados'
      Required = True
      Precision = 14
    end
    object cdsN12TotalPercepciones: TBCDField
      FieldName = 'TotalPercepciones'
      Precision = 14
    end
    object cdsN12TotalDeducciones: TBCDField
      FieldName = 'TotalDeducciones'
      Precision = 14
    end
    object cdsN12TotalOtrosPagos: TBCDField
      FieldName = 'TotalOtrosPagos'
      Precision = 14
    end
    object cdsN12Emisor_Curp: TStringField
      FieldName = 'Emisor_Curp'
      Size = 31
    end
    object cdsN12RegistroPatronal: TStringField
      FieldName = 'RegistroPatronal'
    end
    object cdsN12RfcPatronOrigen: TStringField
      FieldName = 'RfcPatronOrigen'
      Size = 13
    end
    object cdsN12OrigenRecurso: TStringField
      FieldName = 'OrigenRecurso'
      Required = True
      Size = 31
    end
    object cdsN12MontoRecursoPropio: TBCDField
      FieldName = 'MontoRecursoPropio'
      Precision = 14
    end
    object cdsN12Receptor_Curp: TStringField
      FieldName = 'Receptor_Curp'
      Size = 31
    end
    object cdsN12NumSeguridadSocial: TStringField
      FieldName = 'NumSeguridadSocial'
      Size = 15
    end
    object cdsN12FechaInicioRelLaboral: TDateField
      FieldName = 'FechaInicioRelLaboral'
    end
    object cdsN12Antigüedad: TStringField
      FieldName = 'Antig'#252'edad'
      Size = 31
    end
    object cdsN12TipoContrato: TStringField
      FieldName = 'TipoContrato'
      Required = True
      Size = 31
    end
    object cdsN12Sindicalizado: TStringField
      FieldName = 'Sindicalizado'
      Size = 31
    end
    object cdsN12TipoJornada: TStringField
      FieldName = 'TipoJornada'
      Size = 31
    end
    object cdsN12TipoRegimen: TStringField
      FieldName = 'TipoRegimen'
      Required = True
      Size = 31
    end
    object cdsN12NumEmpleado: TStringField
      FieldName = 'NumEmpleado'
      Required = True
      Size = 15
    end
    object cdsN12Departamento: TStringField
      FieldName = 'Departamento'
      Size = 100
    end
    object cdsN12Puesto: TStringField
      FieldName = 'Puesto'
      Size = 100
    end
    object cdsN12RiesgoPuesto: TStringField
      FieldName = 'RiesgoPuesto'
      Size = 31
    end
    object cdsN12PeriodicidadPago: TStringField
      FieldName = 'PeriodicidadPago'
      Required = True
      Size = 31
    end
    object cdsN12Banco: TStringField
      FieldName = 'Banco'
      Size = 31
    end
    object cdsN12CuentaBancaria: TIntegerField
      FieldName = 'CuentaBancaria'
    end
    object cdsN12SalarioBaseCotApor: TBCDField
      FieldName = 'SalarioBaseCotApor'
      Precision = 14
    end
    object cdsN12SalarioDiarioIntegrado: TBCDField
      FieldName = 'SalarioDiarioIntegrado'
      Precision = 14
    end
    object cdsN12ClaveEntFed: TStringField
      FieldName = 'ClaveEntFed'
      Required = True
      Size = 31
    end
    object cdsN12TotalSueldos: TBCDField
      FieldName = 'TotalSueldos'
      Precision = 14
    end
    object cdsN12TotalSeparacionIndemnizacion: TBCDField
      FieldName = 'TotalSeparacionIndemnizacion'
      Precision = 14
    end
    object cdsN12TotalJubilacionPensionRetiro: TBCDField
      FieldName = 'TotalJubilacionPensionRetiro'
      Precision = 14
    end
    object cdsN12TotalGravado: TBCDField
      FieldName = 'TotalGravado'
      Required = True
      Precision = 14
    end
    object cdsN12TotalExento: TBCDField
      FieldName = 'TotalExento'
      Required = True
      Precision = 14
    end
    object cdsN12TotalUnaExhibicion: TBCDField
      FieldName = 'TotalUnaExhibicion'
      Precision = 14
    end
    object cdsN12TotalParcialidad: TBCDField
      FieldName = 'TotalParcialidad'
      Precision = 14
    end
    object cdsN12MontoDiario: TBCDField
      FieldName = 'MontoDiario'
      Precision = 14
    end
    object cdsN12IngresoAcumulable1: TBCDField
      FieldName = 'IngresoAcumulable1'
      Required = True
      Precision = 14
    end
    object cdsN12IngresoNoAcumulable1: TBCDField
      FieldName = 'IngresoNoAcumulable1'
      Required = True
      Precision = 14
    end
    object cdsN12TotalPagado: TBCDField
      FieldName = 'TotalPagado'
      Required = True
      Precision = 14
    end
    object cdsN12NumAñosServicio: TIntegerField
      FieldName = 'NumA'#241'osServicio'
      Required = True
    end
    object cdsN12UltimoSueldoMensOrd: TBCDField
      FieldName = 'UltimoSueldoMensOrd'
      Required = True
      Precision = 14
    end
    object cdsN12IngresoAcumulable2: TBCDField
      FieldName = 'IngresoAcumulable2'
      Required = True
      Precision = 14
    end
    object cdsN12IngresoNoAcumulable2: TBCDField
      FieldName = 'IngresoNoAcumulable2'
      Required = True
      Precision = 14
    end
    object cdsN12TotalOtrasDeducciones: TBCDField
      FieldName = 'TotalOtrasDeducciones'
      Precision = 14
    end
    object cdsN12TotalImpuestosRetenidos: TBCDField
      FieldName = 'TotalImpuestosRetenidos'
      Precision = 14
    end
    object cdsN12SubContratacion: TDataSetField
      FieldName = 'SubContratacion'
      UnNamed = True
    end
    object cdsN12Percepcion: TDataSetField
      FieldName = 'Percepcion'
      UnNamed = True
    end
    object cdsN12Deduccion: TDataSetField
      FieldName = 'Deduccion'
      UnNamed = True
    end
    object cdsN12OtroPago: TDataSetField
      FieldName = 'OtroPago'
      UnNamed = True
    end
    object cdsN12Incapacidad: TDataSetField
      FieldName = 'Incapacidad'
      UnNamed = True
    end
  end
  object dsN12: TDataSource
    AutoEdit = False
    DataSet = cdsN12
    Left = 200
    Top = 248
  end
  object dbpN12: TppDBPipeline
    DataSource = dsN12
    UserName = 'N12'
    Left = 200
    Top = 296
  end
  object cdsN12Percepciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN12Percepcion
    Params = <>
    Left = 280
    Top = 200
  end
  object dsN12Percepciones: TDataSource
    AutoEdit = False
    DataSet = cdsN12Percepciones
    Left = 280
    Top = 248
  end
  object dbpN12Percepciones: TppDBPipeline
    DataSource = dsN12Percepciones
    UserName = 'N12Percepciones'
    Left = 280
    Top = 296
  end
  object cdsN12Deducciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN12Deduccion
    Params = <>
    Left = 384
    Top = 200
  end
  object dsN12Deducciones: TDataSource
    AutoEdit = False
    DataSet = cdsN12Deducciones
    Left = 384
    Top = 248
  end
  object dbpN12Deducciones: TppDBPipeline
    DataSource = dsN12Deducciones
    UserName = 'N12Deducciones'
    Left = 384
    Top = 296
  end
  object cdsN12OtroPagos: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN12OtroPago
    Params = <>
    Left = 496
    Top = 200
  end
  object dsN12OtroPagos: TDataSource
    AutoEdit = False
    DataSet = cdsN12OtroPagos
    Left = 496
    Top = 248
  end
  object dbpN12OtroPagos: TppDBPipeline
    DataSource = dsN12OtroPagos
    UserName = 'N12OtroPagos'
    Left = 496
    Top = 296
  end
  object cdsN12Incapacidades: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN12Incapacidad
    Params = <>
    Left = 608
    Top = 200
  end
  object dsN12Incapacidades: TDataSource
    AutoEdit = False
    DataSet = cdsN12Incapacidades
    Left = 608
    Top = 248
  end
  object dbpN12Incapacidades: TppDBPipeline
    DataSource = dsN12Incapacidades
    UserName = 'N12Incapacidades'
    Left = 608
    Top = 296
  end
  object cdsN12SubContrataciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsN12SubContratacion
    Params = <>
    Left = 728
    Top = 200
  end
  object dsN12SubContrataciones: TDataSource
    AutoEdit = False
    DataSet = cdsN12SubContrataciones
    Left = 728
    Top = 248
  end
  object dbpN12SubContrataciones: TppDBPipeline
    DataSource = dsN12SubContrataciones
    UserName = 'N12SubContrataciones'
    Left = 728
    Top = 296
  end
end
