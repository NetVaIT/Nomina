object dmXMLtoPDFCFDI33: TdmXMLtoPDFCFDI33
  OldCreateOrder = False
  Height = 409
  Width = 595
  object cdsCFDI33: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 72
  end
  object dsCFDI33: TDataSource
    DataSet = cdsCFDI33
    Left = 64
    Top = 120
  end
  object ppDBPipelineCFDI33: TppDBPipeline
    DataSource = dsCFDI33
    UserName = 'DBPipelineCFDI33'
    Left = 64
    Top = 184
  end
end
