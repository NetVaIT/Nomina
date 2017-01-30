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
      end
      item
        Name = '@Periodo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@PeriodoAnio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@XMLNombre'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@XMLCreado'
        Attributes = [paNullable]
        DataType = ftBoolean
      end
      item
        Name = '@XMLFecha'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = '@XMLError'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@XMLSelloDigital'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2Referencia'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2CodigoRespuesta'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@TFD2CreditosRestantes'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@TFD2MensajeError'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2MensajeErrorDetallado'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2OperacionExitosa'
        Attributes = [paNullable]
        DataType = ftBoolean
      end
      item
        Name = '@TFD2Estado'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
      end
      item
        Name = '@TFD2FechaTimbrado'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = '@TFD2NumeroCertificadoSAT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
      end
      item
        Name = '@TFD2SelloCFD'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2SelloSAT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TFD2UUID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 36
      end
      item
        Name = '@IdCFDILog'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Left = 96
    Top = 176
  end
end
