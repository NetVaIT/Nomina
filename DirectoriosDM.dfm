object dmDirectorios: TdmDirectorios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 319
  Width = 215
  object ActionList: TActionList
    Left = 136
    Top = 32
    object actCrearINI: TAction
      Caption = 'Crear INI'
      OnExecute = actCrearINIExecute
    end
    object actCrearXML: TAction
      Caption = 'Crear XML'
      OnExecute = actCrearXMLExecute
    end
    object actCrearPDF: TAction
      Caption = 'Crear PDF'
      OnExecute = actCrearPDFExecute
    end
    object actFDOBtenerPDF: TAction
      Caption = 'Obtener PDF'
      Visible = False
      OnExecute = actFDOBtenerPDFExecute
    end
    object actTimbrar: TAction
      Caption = 'Timbrar ECEODEX'
      Visible = False
      OnExecute = actTimbrarExecute
    end
    object actFDTimbrar: TAction
      Caption = 'FD Timbrar'
      Visible = False
      OnExecute = actFDTimbrarExecute
    end
    object actFDObtener: TAction
      Caption = 'FD Obtener'
      Visible = False
      OnExecute = actFDObtenerExecute
    end
  end
  object adoqryPDF: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Mes'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT IdCFDILog, TFD2Referencia, TFD2UUID'
      'FROM CFDILog'
      
        'WHERE TFD2OperacionExitosa = 1 AND XMLError IS NULL AND PDFObten' +
        'ido = 0'
      'AND Periodo = :Mes'
      'ORDER BY IdCFDILog')
    Left = 40
    Top = 152
    object adoqryPDFIdCFDILog: TAutoIncField
      FieldName = 'IdCFDILog'
      ReadOnly = True
    end
    object adoqryPDFTFD2Referencia: TStringField
      FieldName = 'TFD2Referencia'
      Size = 255
    end
    object adoqryPDFTFD2UUID: TStringField
      FieldName = 'TFD2UUID'
      Size = 36
    end
  end
  object adoqryPDFCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Mes'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) AS CUENTA '
      'FROM CFDILog'
      
        'WHERE TFD2OperacionExitosa = 1 AND XMLError IS NULL AND PDFObten' +
        'ido = 0'
      'AND Periodo = :Mes'
      ''
      '')
    Left = 136
    Top = 152
    object adoqryPDFCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
  object adocUptLog: TADOCommand
    CommandText = 'UPDATE CFDILog SET PDFObtenido = 1 WHERE IdCFDILog = :IdCFDILog'
    Connection = frmMain.ADOConnection
    Parameters = <
      item
        Name = 'IdCFDILog'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 208
  end
end
