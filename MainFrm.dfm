object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    TabOrder = 0
    object Button1: TButton
      Left = 272
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      Visible = False
      OnClick = Button2Click
    end
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=ICATMI;Data Source=NAS4\NOMINASV12;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Use Encryption for Data=False;Tag with column collation when pos' +
      'sible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 31
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 48
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object COBAEM1: TMenuItem
        Tag = 1
        Caption = 'COBAEM'
        OnClick = COBAEM1Click
      end
      object ICATMI1: TMenuItem
        Tag = 2
        Caption = 'ICATMI'
        OnClick = COBAEM1Click
      end
    end
  end
end
