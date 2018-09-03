object dmXMLtoPDFCFDI33: TdmXMLtoPDFCFDI33
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 340
  Width = 651
  object XMLtCFDI: TXMLTransform
    Left = 48
    Top = 24
  end
  object XMLtpCFDI: TXMLTransformProvider
    TransformRead.TransformationFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Doc\cfdv33_TFD11.xtr'
    XMLDataFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Ejemplo_CFDI33N12.XML'
    Left = 48
    Top = 72
  end
  object cdsCFDI33: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XMLtpCFDI'
    OnCalcFields = cdsCFDI33CalcFields
    Left = 136
    Top = 24
    object cdsCFDI33Version: TStringField
      FieldName = 'Version'
      Required = True
      Size = 31
    end
    object cdsCFDI33Serie: TStringField
      FieldName = 'Serie'
      Size = 25
    end
    object cdsCFDI33Folio: TStringField
      FieldName = 'Folio'
      Size = 40
    end
    object cdsCFDI33Fecha: TStringField
      FieldName = 'Fecha'
      Required = True
      Size = 31
    end
    object cdsCFDI33Sello: TStringField
      FieldName = 'Sello'
      Required = True
      Size = 31
    end
    object cdsCFDI33FormaPago: TStringField
      FieldName = 'FormaPago'
      Size = 31
    end
    object cdsCFDI33NoCertificado: TStringField
      FieldName = 'NoCertificado'
      Required = True
      Size = 31
    end
    object cdsCFDI33Certificado: TStringField
      FieldName = 'Certificado'
      Required = True
      Size = 31
    end
    object cdsCFDI33CondicionesDePago: TStringField
      FieldName = 'CondicionesDePago'
      Size = 1000
    end
    object cdsCFDI33SubTotal: TBCDField
      FieldName = 'SubTotal'
      Required = True
      Precision = 14
    end
    object cdsCFDI33Descuento: TBCDField
      FieldName = 'Descuento'
      Precision = 14
    end
    object cdsCFDI33Moneda: TStringField
      FieldName = 'Moneda'
      Required = True
      Size = 31
    end
    object cdsCFDI33TipoCambio: TBCDField
      FieldName = 'TipoCambio'
      Precision = 14
    end
    object cdsCFDI33Total: TBCDField
      FieldName = 'Total'
      Required = True
      Precision = 14
    end
    object cdsCFDI33TipoDeComprobante: TStringField
      FieldName = 'TipoDeComprobante'
      Required = True
      Size = 31
    end
    object cdsCFDI33MetodoPago: TStringField
      FieldName = 'MetodoPago'
      Size = 31
    end
    object cdsCFDI33LugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      Required = True
      Size = 31
    end
    object cdsCFDI33Confirmacion: TStringField
      FieldName = 'Confirmacion'
      Size = 31
    end
    object cdsCFDI33TipoRelacion: TStringField
      FieldName = 'TipoRelacion'
      Required = True
      Size = 31
    end
    object cdsCFDI33Emisor_Rfc: TStringField
      FieldName = 'Emisor_Rfc'
      Required = True
      Size = 13
    end
    object cdsCFDI33Emisor_Nombre: TStringField
      FieldName = 'Emisor_Nombre'
      Size = 254
    end
    object cdsCFDI33RegimenFiscal: TStringField
      FieldName = 'RegimenFiscal'
      Required = True
      Size = 31
    end
    object cdsCFDI33Receptor_Rfc: TStringField
      FieldName = 'Receptor_Rfc'
      Required = True
      Size = 13
    end
    object cdsCFDI33Receptor_Nombre: TStringField
      FieldName = 'Receptor_Nombre'
      Size = 254
    end
    object cdsCFDI33ResidenciaFiscal: TStringField
      FieldName = 'ResidenciaFiscal'
      Size = 31
    end
    object cdsCFDI33NumRegIdTrib: TStringField
      FieldName = 'NumRegIdTrib'
      Size = 40
    end
    object cdsCFDI33UsoCFDI: TStringField
      FieldName = 'UsoCFDI'
      Required = True
      Size = 31
    end
    object cdsCFDI33CfdiRelacionado: TDataSetField
      FieldName = 'CfdiRelacionado'
      UnNamed = True
    end
    object cdsCFDI33Concepto: TDataSetField
      FieldName = 'Concepto'
      UnNamed = True
    end
    object cdsCFDI33Traslado: TDataSetField
      FieldName = 'Traslado'
      UnNamed = True
    end
    object cdsCFDI33Retencion: TDataSetField
      FieldName = 'Retencion'
      UnNamed = True
    end
    object cdsCFDI33Complemento: TDataSetField
      FieldName = 'Complemento'
      UnNamed = True
    end
    object cdsCFDI33ImporteConLetra: TStringField
      FieldKind = fkCalculated
      FieldName = 'ImporteConLetra'
      Size = 255
      Calculated = True
    end
    object cdsCFDI33CadenaOriginal: TStringField
      FieldKind = fkCalculated
      FieldName = 'CadenaOriginal'
      Size = 99999
      Calculated = True
    end
    object cdsCFDI33CadenaOriginalTimbre: TStringField
      FieldKind = fkCalculated
      FieldName = 'CadenaOriginalTimbre'
      Size = 99999
      Calculated = True
    end
    object cdsCFDI33CCB: TStringField
      FieldKind = fkCalculated
      FieldName = 'CCB'
      Size = 255
      Calculated = True
    end
  end
  object dsCFDI33: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI33
    Left = 136
    Top = 72
  end
  object dbpCFDI33: TppDBPipeline
    DataSource = dsCFDI33
    UserName = 'CFDI33'
    Left = 136
    Top = 120
  end
  object cdsTFD11: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI33Complemento
    Params = <>
    Left = 136
    Top = 184
    object cdsTFD11Version: TStringField
      FieldName = 'Version'
      Required = True
      Size = 31
    end
    object cdsTFD11UUID: TStringField
      FieldName = 'UUID'
      Required = True
      Size = 31
    end
    object cdsTFD11FechaTimbrado: TStringField
      FieldName = 'FechaTimbrado'
      Required = True
      Size = 31
    end
    object cdsTFD11RfcProvCertif: TStringField
      FieldName = 'RfcProvCertif'
      Required = True
      Size = 31
    end
    object cdsTFD11Leyenda: TStringField
      FieldName = 'Leyenda'
      Size = 150
    end
    object cdsTFD11SelloCFD: TStringField
      FieldName = 'SelloCFD'
      Required = True
      Size = 500
    end
    object cdsTFD11NoCertificadoSAT: TStringField
      FieldName = 'NoCertificadoSAT'
      Required = True
      Size = 31
    end
    object cdsTFD11SelloSAT: TStringField
      FieldName = 'SelloSAT'
      Required = True
      Size = 500
    end
  end
  object dsTFD11: TDataSource
    AutoEdit = False
    DataSet = cdsTFD11
    Left = 136
    Top = 232
  end
  object dbpTFD11: TppDBPipeline
    DataSource = dsTFD11
    UserName = 'TFD11'
    Left = 136
    Top = 280
  end
  object cdsCFDI33Relacionados: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI33CfdiRelacionado
    Params = <>
    Left = 224
    Top = 24
    object cdsCFDI33RelacionadosUUID: TStringField
      FieldName = 'UUID'
      Required = True
      Size = 31
    end
  end
  object dsCFDI33Relacionados: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI33Relacionados
    Left = 224
    Top = 72
  end
  object dbpCFDI33Relacionados: TppDBPipeline
    DataSource = dsCFDI33Relacionados
    UserName = 'CFDI33Relacionados'
    Left = 224
    Top = 120
  end
  object cdsCFDI33Conceptos: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI33Concepto
    Params = <>
    Left = 336
    Top = 24
    object cdsCFDI33ConceptosClaveProdServ: TStringField
      FieldName = 'ClaveProdServ'
      Required = True
      Size = 31
    end
    object cdsCFDI33ConceptosNoIdentificacion: TStringField
      FieldName = 'NoIdentificacion'
      Size = 100
    end
    object cdsCFDI33ConceptosCantidad: TBCDField
      FieldName = 'Cantidad'
      Required = True
      Precision = 14
    end
    object cdsCFDI33ConceptosClaveUnidad: TStringField
      FieldName = 'ClaveUnidad'
      Required = True
      Size = 31
    end
    object cdsCFDI33ConceptosUnidad: TStringField
      FieldName = 'Unidad'
    end
    object cdsCFDI33ConceptosDescripcion: TStringField
      FieldName = 'Descripcion'
      Required = True
      Size = 1000
    end
    object cdsCFDI33ConceptosValorUnitario: TBCDField
      FieldName = 'ValorUnitario'
      Precision = 14
    end
    object cdsCFDI33ConceptosImporte: TBCDField
      FieldName = 'Importe'
      Precision = 14
    end
    object cdsCFDI33ConceptosDescuento: TBCDField
      FieldName = 'Descuento'
      Precision = 14
    end
    object cdsCFDI33ConceptosNumero: TStringField
      FieldName = 'Numero'
      Required = True
      Size = 150
    end
    object cdsCFDI33ConceptosTraslado: TDataSetField
      FieldName = 'Traslado'
      UnNamed = True
    end
    object cdsCFDI33ConceptosRetencion: TDataSetField
      FieldName = 'Retencion'
      UnNamed = True
    end
    object cdsCFDI33ConceptosInformacionAduanera: TDataSetField
      FieldName = 'InformacionAduanera'
      UnNamed = True
    end
    object cdsCFDI33ConceptosParte: TDataSetField
      FieldName = 'Parte'
      UnNamed = True
    end
  end
  object dsCFDI33Conceptos: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI33Conceptos
    Left = 336
    Top = 72
  end
  object dbpCFDI33Conceptos: TppDBPipeline
    DataSource = dsCFDI33Conceptos
    UserName = 'CFDI33Conceptos'
    Left = 336
    Top = 120
  end
  object cdsCFDI33Retenciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI33Retencion
    Params = <>
    Left = 448
    Top = 24
    object cdsCFDI33RetencionesBase: TBCDField
      FieldName = 'Base'
      Required = True
      Precision = 14
    end
    object cdsCFDI33RetencionesImpuesto: TStringField
      FieldName = 'Impuesto'
      Required = True
      Size = 31
    end
    object cdsCFDI33RetencionesTipoFactor: TStringField
      FieldName = 'TipoFactor'
      Required = True
      Size = 31
    end
    object cdsCFDI33RetencionesTasaOCuota: TBCDField
      FieldName = 'TasaOCuota'
      Precision = 14
    end
    object cdsCFDI33RetencionesImporte: TBCDField
      FieldName = 'Importe'
      Precision = 14
    end
  end
  object dsCFDI33Retenciones: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI33Retenciones
    Left = 448
    Top = 72
  end
  object dbpCFDI33Retenciones: TppDBPipeline
    DataSource = dsCFDI33Retenciones
    UserName = 'CFDI33Retenciones'
    Left = 448
    Top = 120
  end
  object cdsCFDI33Traslados: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI33Traslado
    Params = <>
    Left = 560
    Top = 24
    object cdsCFDI33TrasladosBase: TBCDField
      FieldName = 'Base'
      Required = True
      Precision = 14
    end
    object cdsCFDI33TrasladosImpuesto: TStringField
      FieldName = 'Impuesto'
      Required = True
      Size = 31
    end
    object cdsCFDI33TrasladosTipoFactor: TStringField
      FieldName = 'TipoFactor'
      Required = True
      Size = 31
    end
    object cdsCFDI33TrasladosTasaOCuota: TBCDField
      FieldName = 'TasaOCuota'
      Precision = 14
    end
    object cdsCFDI33TrasladosImporte: TBCDField
      FieldName = 'Importe'
      Precision = 14
    end
  end
  object dsCFDI33Traslados: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI33Traslados
    Left = 560
    Top = 72
  end
  object dbpCFDI33Traslados: TppDBPipeline
    DataSource = dsCFDI33Traslados
    UserName = 'CFDI33Traslados'
    Left = 560
    Top = 120
  end
end
