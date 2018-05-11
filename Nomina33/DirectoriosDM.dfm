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
      Caption = 'Timbrar Ecodex'
      Visible = False
      OnExecute = actTimbrarExecute
    end
    object actFDObtenerPDF: TAction
      Caption = 'FD Obtener PDF'
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
    object actCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelarExecute
    end
    object actCancelarMarcados: TAction
      Caption = 'Cancelar marcados'
      OnExecute = actCancelarMarcadosExecute
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
    Top = 104
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
    Top = 104
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
    Top = 160
  end
  object adoqCancelar: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT IdCFDILog, TFD2UUID FROM CFDILog'
      'WHERE Cancelar = 1 AND TFD2Estado = '#39'Vigente'#39)
    Left = 40
    Top = 224
    object adoqCancelarIdCFDILog: TAutoIncField
      FieldName = 'IdCFDILog'
      ReadOnly = True
    end
    object adoqCancelarTFD2UUID: TStringField
      FieldName = 'TFD2UUID'
      Size = 36
    end
  end
  object adoqCancelarCount: TADOQuery
    Connection = frmMain.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT COUNT(*) AS CUENTA '
      'FROM CFDILog'
      'WHERE Cancelar = 1 AND TFD2Estado = '#39'Vigente'#39)
    Left = 128
    Top = 224
    object adoqCancelarCountCUENTA: TIntegerField
      FieldName = 'CUENTA'
      ReadOnly = True
    end
  end
end
