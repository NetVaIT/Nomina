object frmDirectorios: TfrmDirectorios
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'frmDirectorios'
  ClientHeight = 613
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 613
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 844
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 120
        Top = 11
        Width = 23
        Height = 13
        Caption = 'A'#241'o:'
      end
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 23
        Height = 13
        Caption = 'Mes:'
      end
      object btnCrearINI: TcxButton
        Left = 16
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnCrearINI'
        TabOrder = 2
      end
      object btnCrearXML: TcxButton
        Left = 96
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnCrearXML'
        TabOrder = 3
      end
      object btnFDObtenerPDF: TcxButton
        Left = 416
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnFDObtenerPDF'
        TabOrder = 7
      end
      object btnFDObtener: TcxButton
        Left = 752
        Top = 6
        Width = 75
        Height = 25
        Caption = 'btnFDObtener'
        TabOrder = 8
      end
      object Edit1: TEdit
        Left = 577
        Top = 8
        Width = 169
        Height = 21
        TabOrder = 9
        Text = 'LUIY500222000_104803'
        Visible = False
      end
      object btnFDConsultarCreditos: TcxButton
        Left = 256
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnFDConsultarCreditos'
        TabOrder = 5
      end
      object edtAnio: TcxSpinEdit
        Left = 144
        Top = 8
        Properties.MaxValue = 2050.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        TabOrder = 1
        Value = 2017
        Width = 51
      end
      object edtmes: TcxSpinEdit
        Left = 40
        Top = 8
        Properties.AssignedValues.MaxValue = True
        Properties.MinValue = 1.000000000000000000
        TabOrder = 0
        Value = 1
        Width = 74
      end
      object btnTimbrar: TcxButton
        Left = 336
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnTimbrar'
        TabOrder = 6
      end
      object btnCrearPDF: TcxButton
        Left = 176
        Top = 32
        Width = 75
        Height = 25
        Caption = 'btnCrearPDF'
        TabOrder = 4
      end
      object cbFiltrar: TcxCheckBox
        Left = 201
        Top = 5
        Caption = 'Filtrar'
        State = cbsChecked
        TabOrder = 10
        Width = 53
      end
      object cbDetener: TcxCheckBox
        Left = 273
        Top = 5
        Caption = 'Detener en error'
        State = cbsChecked
        TabOrder = 11
        Width = 112
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 64
      Width = 436
      Height = 549
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = cxtsInbox
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 545
      ClientRectLeft = 4
      ClientRectRight = 432
      ClientRectTop = 24
      object cxtsInbox: TcxTabSheet
        Caption = 'INI'
        ImageIndex = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 428
          Height = 521
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object cxslvInbox: TcxShellListView
            Left = 0
            Top = 0
            Width = 428
            Height = 363
            Align = alClient
            IconOptions.WrapText = False
            MultiSelect = True
            Options.ShowFolders = False
            Options.ContextMenus = False
            Options.TrackShellChanges = False
            Sorting = False
            TabOrder = 0
            ViewStyle = vsList
          end
          object cxslvError: TcxShellListView
            Left = 0
            Top = 371
            Width = 428
            Height = 150
            Align = alBottom
            IconOptions.WrapText = False
            MultiSelect = True
            Options.ShowFolders = False
            Options.ContextMenus = False
            Options.TrackShellChanges = False
            Sorting = False
            TabOrder = 1
            ViewStyle = vsList
          end
          object cxSplitter3: TcxSplitter
            Left = 0
            Top = 363
            Width = 428
            Height = 8
            HotZoneClassName = 'TcxSimpleStyle'
            AlignSplitter = salBottom
            Control = cxslvError
          end
          object cxscbInbox: TcxShellComboBox
            Left = 152
            Top = 40
            ShellListView = cxslvInbox
            TabOrder = 3
            Visible = False
            Width = 121
          end
          object cxscbError: TcxShellComboBox
            Left = 136
            Top = 477
            ShellListView = cxslvError
            TabOrder = 4
            Visible = False
            Width = 121
          end
        end
      end
      object cxtsSalida: TcxTabSheet
        Caption = 'XML'
        ImageIndex = 1
        object cxslvOutbox: TcxShellListView
          Left = 0
          Top = 0
          Width = 428
          Height = 521
          Align = alClient
          IconOptions.WrapText = False
          MultiSelect = True
          Options.ShowFolders = False
          Options.ContextMenus = False
          Options.TrackShellChanges = False
          Sorting = False
          TabOrder = 0
          ViewStyle = vsList
        end
        object cxscbOutbox: TcxShellComboBox
          Left = 32
          Top = 40
          ShellListView = cxslvOutbox
          TabOrder = 1
          Visible = False
          Width = 121
        end
      end
      object cxtsProcess: TcxTabSheet
        Caption = 'XML FD'
        ImageIndex = 2
        object cxslvProcess: TcxShellListView
          Left = 0
          Top = 0
          Width = 428
          Height = 521
          Align = alClient
          IconOptions.WrapText = False
          MultiSelect = True
          Options.ShowFolders = False
          Options.ContextMenus = False
          Options.TrackShellChanges = False
          Sorting = False
          TabOrder = 0
          ViewStyle = vsList
        end
        object cxscbProcess: TcxShellComboBox
          Left = 32
          Top = 88
          ShellListView = cxslvProcess
          TabOrder = 1
          Visible = False
          Width = 121
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'Cancelar'
        ImageIndex = 3
        object edtUUID: TcxTextEdit
          Left = 12
          Top = 19
          TabOrder = 0
          Width = 332
        end
        object btnCancelar: TcxButton
          Left = 350
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
        end
        object btnCancelarMarcados: TcxButton
          Left = 144
          Top = 104
          Width = 129
          Height = 25
          Caption = 'Cancelar marcados'
          TabOrder = 2
        end
      end
    end
    object mBitacora: TcxMemo
      Left = 444
      Top = 64
      Align = alRight
      Properties.ScrollBars = ssBoth
      TabOrder = 2
      Height = 549
      Width = 400
    end
    object cxSplitter1: TcxSplitter
      Left = 436
      Top = 64
      Width = 8
      Height = 549
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salRight
      Control = mBitacora
    end
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = cbDetener
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbFiltrar
        Properties.Strings = (
          'Checked')
      end
      item
        Component = edtAnio
        Properties.Strings = (
          'Value')
      end
      item
        Component = edtmes
        Properties.Strings = (
          'Value')
      end>
    StorageName = '\Software\PDS\frmDirectorios'
    StorageType = stRegistry
    Left = 352
    Top = 112
  end
end
