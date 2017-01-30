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
    object actTimbrar: TAction
      Caption = 'Timbrar'
      Visible = False
      OnExecute = actTimbrarExecute
    end
    object actFDObtenerPDF: TAction
      Caption = 'Obtener PDF'
      Visible = False
      OnExecute = actFDObtenerPDFExecute
    end
    object actFDObtener: TAction
      Caption = 'FD Obtener'
      Visible = False
      OnExecute = actFDObtenerExecute
    end
    object actFDConsultarCreditos: TAction
      Caption = 'FD Creditos'
      OnExecute = actFDConsultarCreditosExecute
    end
  end
  object adoqryPDF: TADOQuery
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
      'SELECT IdCFDILog, XMLNombre, TFD2Referencia, TFD2UUID'
      'FROM CFDILog'
      
        'WHERE TFD2OperacionExitosa = 1 AND XMLError IS NULL AND PDFObten' +
        'ido = 0'
      'AND (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (Periodo = :Mes1 OR :Mes2 = 0)'
      'ORDER BY IdCFDILog')
    Left = 40
    Top = 152
    object adoqryPDFIdCFDILog: TAutoIncField
      FieldName = 'IdCFDILog'
      ReadOnly = True
    end
    object adoqryPDFXMLNombre: TStringField
      FieldName = 'XMLNombre'
      Size = 255
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
      'select COUNT(*) AS CUENTA '
      'FROM CFDILog'
      
        'WHERE TFD2OperacionExitosa = 1 AND XMLError IS NULL AND PDFObten' +
        'ido = 0'
      'AND (PeriodoAnio = :Anio1 OR :Anio2 = 0)'
      'AND (Periodo = :Mes1 OR :Mes2 = 0)')
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
