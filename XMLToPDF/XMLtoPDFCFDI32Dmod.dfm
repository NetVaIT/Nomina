object dmXMLtoPDFCFDI32: TdmXMLtoPDFCFDI32
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 345
  Width = 761
  object XMLtCFDI: TXMLTransform
    Left = 48
    Top = 24
  end
  object XMLtpCFDI: TXMLTransformProvider
    TransformRead.TransformationFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Doc\cfdv32_TFD10.xtr'
    XMLDataFile = 
      'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Nomina' +
      's\XMLToPDF\Ejemplo_CFDI32N12.XML'
    Left = 48
    Top = 72
  end
  object cdsCFDI32: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsCFDI32CalcFields
    Left = 136
    Top = 24
    object cdsCFDI32version1: TStringField
      FieldName = 'version1'
      Required = True
      Size = 31
    end
    object cdsCFDI32serie: TStringField
      FieldName = 'serie'
      Size = 25
    end
    object cdsCFDI32folio: TStringField
      FieldName = 'folio'
    end
    object cdsCFDI32fecha: TDateField
      FieldName = 'fecha'
      Required = True
    end
    object cdsCFDI32sello: TStringField
      FieldName = 'sello'
      Required = True
      Size = 500
    end
    object cdsCFDI32formaDePago: TStringField
      FieldName = 'formaDePago'
      Required = True
      Size = 31
    end
    object cdsCFDI32noCertificado: TStringField
      FieldName = 'noCertificado'
      Required = True
      Size = 31
    end
    object cdsCFDI32certificado: TStringField
      FieldName = 'certificado'
      Required = True
      Size = 31
    end
    object cdsCFDI32condicionesDePago: TStringField
      FieldName = 'condicionesDePago'
      Size = 31
    end
    object cdsCFDI32subTotal: TBCDField
      FieldName = 'subTotal'
      Required = True
      Precision = 14
    end
    object cdsCFDI32descuento: TBCDField
      FieldName = 'descuento'
      Precision = 14
    end
    object cdsCFDI32motivoDescuento: TStringField
      FieldName = 'motivoDescuento'
      Size = 31
    end
    object cdsCFDI32TipoCambio: TStringField
      FieldName = 'TipoCambio'
      Size = 31
    end
    object cdsCFDI32Moneda: TStringField
      FieldName = 'Moneda'
      Size = 31
    end
    object cdsCFDI32total: TBCDField
      FieldName = 'total'
      Required = True
      Precision = 14
    end
    object cdsCFDI32tipoDeComprobante: TStringField
      FieldName = 'tipoDeComprobante'
      Required = True
      Size = 31
    end
    object cdsCFDI32metodoDePago: TStringField
      FieldName = 'metodoDePago'
      Required = True
      Size = 31
    end
    object cdsCFDI32LugarExpedicion: TStringField
      FieldName = 'LugarExpedicion'
      Required = True
      Size = 31
    end
    object cdsCFDI32NumCtaPago: TStringField
      FieldName = 'NumCtaPago'
      Size = 31
    end
    object cdsCFDI32FolioFiscalOrig: TStringField
      FieldName = 'FolioFiscalOrig'
      Size = 31
    end
    object cdsCFDI32SerieFolioFiscalOrig: TStringField
      FieldName = 'SerieFolioFiscalOrig'
      Size = 31
    end
    object cdsCFDI32FechaFolioFiscalOrig: TStringField
      FieldName = 'FechaFolioFiscalOrig'
      Size = 31
    end
    object cdsCFDI32MontoFolioFiscalOrig: TBCDField
      FieldName = 'MontoFolioFiscalOrig'
      Precision = 14
    end
    object cdsCFDI32Emisor_rfc: TStringField
      FieldName = 'Emisor_rfc'
      Required = True
      Size = 13
    end
    object cdsCFDI32Emisor_nombre: TStringField
      FieldName = 'Emisor_nombre'
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_calle: TStringField
      FieldName = 'DomicilioFiscal_calle'
      Required = True
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_noExterior: TStringField
      FieldName = 'DomicilioFiscal_noExterior'
      Size = 31
    end
    object cdsCFDI32DomicilioFiscal_noInterior: TStringField
      FieldName = 'DomicilioFiscal_noInterior'
      Size = 31
    end
    object cdsCFDI32DomicilioFiscal_colonia: TStringField
      FieldName = 'DomicilioFiscal_colonia'
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_localidad: TStringField
      FieldName = 'DomicilioFiscal_localidad'
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_referencia: TStringField
      FieldName = 'DomicilioFiscal_referencia'
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_municipio: TStringField
      FieldName = 'DomicilioFiscal_municipio'
      Required = True
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_estado: TStringField
      FieldName = 'DomicilioFiscal_estado'
      Required = True
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_pais: TStringField
      FieldName = 'DomicilioFiscal_pais'
      Required = True
      Size = 254
    end
    object cdsCFDI32DomicilioFiscal_codigoPostal: TStringField
      FieldName = 'DomicilioFiscal_codigoPostal'
      Required = True
      Size = 31
    end
    object cdsCFDI32ExpedidoEn_calle: TStringField
      FieldName = 'ExpedidoEn_calle'
      Required = True
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_noExterior: TStringField
      FieldName = 'ExpedidoEn_noExterior'
      Size = 31
    end
    object cdsCFDI32ExpedidoEn_noInterior: TStringField
      FieldName = 'ExpedidoEn_noInterior'
      Size = 31
    end
    object cdsCFDI32ExpedidoEn_colonia: TStringField
      FieldName = 'ExpedidoEn_colonia'
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_localidad: TStringField
      FieldName = 'ExpedidoEn_localidad'
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_referencia: TStringField
      FieldName = 'ExpedidoEn_referencia'
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_municipio: TStringField
      FieldName = 'ExpedidoEn_municipio'
      Required = True
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_estado: TStringField
      FieldName = 'ExpedidoEn_estado'
      Required = True
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_pais: TStringField
      FieldName = 'ExpedidoEn_pais'
      Required = True
      Size = 254
    end
    object cdsCFDI32ExpedidoEn_codigoPostal: TStringField
      FieldName = 'ExpedidoEn_codigoPostal'
      Required = True
      Size = 31
    end
    object cdsCFDI32Receptor_rfc: TStringField
      FieldName = 'Receptor_rfc'
      Required = True
      Size = 13
    end
    object cdsCFDI32Receptor_nombre: TStringField
      FieldName = 'Receptor_nombre'
      Size = 254
    end
    object cdsCFDI32Domicilio_calle: TStringField
      FieldName = 'Domicilio_calle'
      Required = True
      Size = 254
    end
    object cdsCFDI32Domicilio_noExterior: TStringField
      FieldName = 'Domicilio_noExterior'
      Size = 31
    end
    object cdsCFDI32Domicilio_noInterior: TStringField
      FieldName = 'Domicilio_noInterior'
      Size = 31
    end
    object cdsCFDI32Domicilio_colonia: TStringField
      FieldName = 'Domicilio_colonia'
      Size = 254
    end
    object cdsCFDI32Domicilio_localidad: TStringField
      FieldName = 'Domicilio_localidad'
      Size = 254
    end
    object cdsCFDI32Domicilio_referencia: TStringField
      FieldName = 'Domicilio_referencia'
      Size = 254
    end
    object cdsCFDI32Domicilio_municipio: TStringField
      FieldName = 'Domicilio_municipio'
      Required = True
      Size = 254
    end
    object cdsCFDI32Domicilio_estado: TStringField
      FieldName = 'Domicilio_estado'
      Required = True
      Size = 254
    end
    object cdsCFDI32Domicilio_pais: TStringField
      FieldName = 'Domicilio_pais'
      Required = True
      Size = 254
    end
    object cdsCFDI32Domicilio_codigoPostal: TStringField
      FieldName = 'Domicilio_codigoPostal'
      Required = True
      Size = 31
    end
    object cdsCFDI32totalImpuestosRetenidos: TBCDField
      FieldName = 'totalImpuestosRetenidos'
      Precision = 14
    end
    object cdsCFDI32totalImpuestosTrasladados: TBCDField
      FieldName = 'totalImpuestosTrasladados'
      Precision = 14
    end
    object cdsCFDI32version2: TStringField
      FieldName = 'version2'
      Required = True
      Size = 31
    end
    object cdsCFDI32UUID: TStringField
      FieldName = 'UUID'
      Required = True
      Size = 31
    end
    object cdsCFDI32FechaTimbrado: TStringField
      FieldName = 'FechaTimbrado'
      Required = True
      Size = 31
    end
    object cdsCFDI32selloCFD: TStringField
      FieldName = 'selloCFD'
      Required = True
      Size = 500
    end
    object cdsCFDI32noCertificadoSAT: TStringField
      FieldName = 'noCertificadoSAT'
      Required = True
      Size = 31
    end
    object cdsCFDI32selloSAT: TStringField
      FieldName = 'selloSAT'
      Required = True
      Size = 500
    end
    object cdsCFDI32RegimenFiscal: TDataSetField
      FieldName = 'RegimenFiscal'
      UnNamed = True
    end
    object cdsCFDI32Concepto: TDataSetField
      FieldName = 'Concepto'
      UnNamed = True
    end
    object cdsCFDI32Retencion: TDataSetField
      FieldName = 'Retencion'
      UnNamed = True
    end
    object cdsCFDI32Traslado: TDataSetField
      FieldName = 'Traslado'
      UnNamed = True
    end
    object cdsCFDI32ImporteConLetra: TStringField
      FieldKind = fkCalculated
      FieldName = 'ImporteConLetra'
      Size = 255
      Calculated = True
    end
    object cdsCFDI32CadenaOriginal: TStringField
      FieldKind = fkCalculated
      FieldName = 'CadenaOriginal'
      Size = 99999
      Calculated = True
    end
    object cdsCFDI32CadenaOriginalTimbre: TStringField
      FieldKind = fkCalculated
      FieldName = 'CadenaOriginalTimbre'
      Size = 99999
      Calculated = True
    end
    object cdsCFDI32CCB: TStringField
      FieldKind = fkCalculated
      FieldName = 'CCB'
      Size = 255
      Calculated = True
    end
  end
  object dsCFDI32: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32
    Left = 136
    Top = 72
  end
  object dbpCFDI32: TppDBPipeline
    DataSource = dsCFDI32
    UserName = 'CFDI32'
    Left = 136
    Top = 120
  end
  object cdsCFDI32Conceptos: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI32Concepto
    Params = <>
    Left = 256
    Top = 24
    object cdsCFDI32Conceptoscantidad: TBCDField
      FieldName = 'cantidad'
      Required = True
      Precision = 14
    end
    object cdsCFDI32Conceptosunidad: TStringField
      FieldName = 'unidad'
      Size = 31
    end
    object cdsCFDI32ConceptosnoIdentificacion: TStringField
      FieldName = 'noIdentificacion'
      Size = 31
    end
    object cdsCFDI32Conceptosdescripcion: TStringField
      FieldName = 'descripcion'
      Required = True
      Size = 1000
    end
    object cdsCFDI32ConceptosvalorUnitario: TBCDField
      FieldName = 'valorUnitario'
      Precision = 14
    end
    object cdsCFDI32Conceptosimporte: TBCDField
      FieldName = 'importe'
      Precision = 14
    end
    object cdsCFDI32Conceptosnumero: TStringField
      FieldName = 'numero'
      Required = True
      Size = 31
    end
    object cdsCFDI32ConceptosInformacionAduanera: TDataSetField
      FieldName = 'InformacionAduanera'
      UnNamed = True
    end
    object cdsCFDI32ConceptosParte: TDataSetField
      FieldName = 'Parte'
      UnNamed = True
    end
  end
  object dsCFDI32Conceptos: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32Conceptos
    Left = 256
    Top = 72
  end
  object dbpCFDI32Conceptos: TppDBPipeline
    DataSource = dsCFDI32Conceptos
    UserName = 'CFDI32Conceptos'
    Left = 256
    Top = 120
  end
  object cdsCFDI32Retenciones: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI32Retencion
    Params = <>
    Left = 368
    Top = 24
    object cdsCFDI32Retencionesimpuesto: TStringField
      FieldName = 'impuesto'
      Required = True
      Size = 31
    end
    object cdsCFDI32Retencionesimporte: TBCDField
      FieldName = 'importe'
      Precision = 14
    end
  end
  object dsCFDI32Retenciones: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32Retenciones
    Left = 368
    Top = 72
  end
  object dbpCFDI32Retenciones: TppDBPipeline
    DataSource = dsCFDI32Retenciones
    UserName = 'CFDI32Retenciones'
    Left = 368
    Top = 120
  end
  object cdsCFDI32Traslados: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI32Traslado
    Params = <>
    Left = 480
    Top = 24
    object cdsCFDI32Trasladosimpuesto: TStringField
      FieldName = 'impuesto'
      Required = True
      Size = 31
    end
    object cdsCFDI32Trasladostasa: TBCDField
      FieldName = 'tasa'
      Required = True
      Precision = 14
    end
    object cdsCFDI32Trasladosimporte: TBCDField
      FieldName = 'importe'
      Precision = 14
    end
  end
  object dsCFDI32Traslados: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32Traslados
    Left = 480
    Top = 72
  end
  object dbpCFDI32Traslados: TppDBPipeline
    DataSource = dsCFDI32Traslados
    UserName = 'CFDI32Traslados'
    Left = 480
    Top = 120
  end
  object cdsCFDI32InfoAduanera: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI32ConceptosInformacionAduanera
    Params = <>
    Left = 256
    Top = 176
    object cdsCFDI32InfoAduaneranumero: TStringField
      FieldName = 'numero'
      Required = True
      Size = 31
    end
    object cdsCFDI32InfoAduanerafecha: TDateField
      FieldName = 'fecha'
      Required = True
    end
    object cdsCFDI32InfoAduaneraaduana: TStringField
      FieldName = 'aduana'
      Size = 31
    end
  end
  object dsCFDI32InfoAduanera: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32InfoAduanera
    Left = 256
    Top = 224
  end
  object dbpCFDI32InfoAduanera: TppDBPipeline
    DataSource = dsCFDI32InfoAduanera
    UserName = 'CFDI32InfoAduanera'
    Left = 256
    Top = 272
  end
  object cdsCFDI32Parte: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCFDI32ConceptosParte
    Params = <>
    Left = 360
    Top = 176
  end
  object dsCFDI32Parte: TDataSource
    AutoEdit = False
    DataSet = cdsCFDI32Parte
    Left = 360
    Top = 224
  end
  object dbpCFDI32Parte: TppDBPipeline
    DataSource = dsCFDI32Parte
    UserName = 'CFDI32Parte'
    Left = 360
    Top = 272
  end
end
