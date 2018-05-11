object dmCFDI: TdmCFDI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 258
  Width = 361
  object adopSetCFDILog: TADOStoredProc
    Connection = frmMain.ADOConnection
    ProcedureName = 'p_SetCFDILog;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Periodo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PeriodoAnio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@XMLNombre'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@XMLCreado'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@XMLFecha'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@XMLError'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@XMLSelloDigital'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2Referencia'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2CodigoRespuesta'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@TFD2CreditosRestantes'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@TFD2MensajeError'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2MensajeErrorDetallado'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2OperacionExitosa'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@TFD2Estado'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@TFD2FechaTimbrado'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@TFD2NumeroCertificadoSAT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@TFD2SelloCFD'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2SelloSAT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@TFD2UUID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 36
        Value = Null
      end
      item
        Name = '@ID_CFDI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IdCFDILog'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 56
    Top = 24
  end
  object adocUpdCFDILogCancelar: TADOCommand
    CommandText = 
      'DECLARE @IdCFDILog int;'#13#10'SELECT @IdCFDILog = IdCFDILog FROM CFDI' +
      'Log WHERE TFD2UUID = :UUID;'#13#10'UPDATE CFDILog'#13#10'SET TFD2OperacionEx' +
      'itosa = :TFD2OperacionExitosa'#13#10',TFD2Estado = '#39'Cancelado'#39#13#10',TFD2M' +
      'ensajeError = NULL'#13#10',TFD2MensajeErrorDetallado = NULL'#13#10',TFD2XMLA' +
      'cuse = :TFD2XMLAcuse'#13#10'WHERE IdCFDILog = @IdCFDILog; '#13#10
    Connection = frmMain.ADOConnection
    Parameters = <
      item
        Name = 'UUID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 36
        Value = Null
      end
      item
        Name = 'TFD2OperacionExitosa'
        Attributes = [paNullable]
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'TFD2XMLAcuse'
        Attributes = [paNullable, paLong]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1073741823
        Value = Null
      end>
    Left = 56
    Top = 80
  end
  object adocUpdCFDILogCancelarError: TADOCommand
    CommandText = 
      'DECLARE @IdCFDILog int;'#13#10'SELECT @IdCFDILog = IdCFDILog FROM CFDI' +
      'Log WHERE TFD2UUID = :UUID;'#13#10'UPDATE CFDILog'#13#10'SET TFD2MensajeErro' +
      'r = :TFD2MensajeError'#13#10',TFD2MensajeErrorDetallado = :TFD2Mensaje' +
      'ErrorDetallado'#13#10',TFD2OperacionExitosa = :TFD2OperacionExitosa'#13#10'W' +
      'HERE IdCFDILog = @IdCFDILog; '#13#10
    Connection = frmMain.ADOConnection
    Parameters = <
      item
        Name = 'UUID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 36
        Value = Null
      end
      item
        Name = 'TFD2MensajeError'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'TFD2MensajeErrorDetallado'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'TFD2OperacionExitosa'
        Attributes = [paNullable]
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    Left = 56
    Top = 136
  end
end
