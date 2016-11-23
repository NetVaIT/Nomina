object frmDirectorios: TfrmDirectorios
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'frmDirectorios'
  ClientHeight = 613
  ClientWidth = 972
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
    Width = 972
    Height = 613
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 972
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Mes:'
      end
      object btnCrearINI: TcxButton
        Left = 16
        Top = 42
        Width = 75
        Height = 25
        Caption = 'btnCrearINI'
        TabOrder = 0
      end
      object btnCrearXML: TcxButton
        Left = 97
        Top = 42
        Width = 75
        Height = 25
        Caption = 'btnCrearXML'
        TabOrder = 1
      end
      object btnTimbrar: TcxButton
        Left = 259
        Top = 42
        Width = 75
        Height = 25
        Caption = 'btnTimbrar'
        TabOrder = 2
      end
      object btnFDTimbrar: TcxButton
        Left = 340
        Top = 42
        Width = 75
        Height = 25
        Caption = 'btnFDTimbrar'
        TabOrder = 3
      end
      object btnFDObtener: TcxButton
        Left = 755
        Top = 11
        Width = 75
        Height = 25
        Caption = 'btnFDObtener'
        TabOrder = 4
      end
      object edtmes: TcxSpinEdit
        Left = 51
        Top = 15
        Properties.MaxValue = 14.000000000000000000
        Properties.MinValue = 1.000000000000000000
        TabOrder = 5
        Value = 1
        Width = 121
      end
      object Edit1: TEdit
        Left = 580
        Top = 12
        Width = 169
        Height = 21
        TabOrder = 6
        Text = 'LUIY500222000_104803'
        Visible = False
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 81
      Width = 464
      Height = 532
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = cxtsInbox
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 528
      ClientRectLeft = 4
      ClientRectRight = 460
      ClientRectTop = 24
      object cxtsInbox: TcxTabSheet
        Caption = 'INI'
        ImageIndex = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 456
          Height = 504
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object cxslvInbox: TcxShellListView
            Left = 0
            Top = 0
            Width = 456
            Height = 346
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
            Top = 354
            Width = 456
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
            Top = 346
            Width = 456
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
          Width = 456
          Height = 504
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
          Width = 456
          Height = 504
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
    end
    object mBitacora: TcxMemo
      Left = 472
      Top = 81
      Align = alRight
      Properties.ScrollBars = ssBoth
      TabOrder = 2
      Height = 532
      Width = 500
    end
    object cxSplitter1: TcxSplitter
      Left = 464
      Top = 81
      Width = 8
      Height = 532
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salRight
      Control = mBitacora
    end
  end
  object btnFDObtenerPDF: TcxButton
    Left = 178
    Top = 42
    Width = 75
    Height = 25
    Caption = 'btnFDObtenerPDF'
    TabOrder = 1
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = edtmes
        Properties.Strings = (
          'Value')
      end>
    StorageName = '\Software\PDS\frmDirectorios'
    StorageType = stRegistry
    Left = 376
    Top = 56
  end
end
