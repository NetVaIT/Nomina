object _frmMain: T_frmMain
  Left = 0
  Top = 0
  Caption = '_frmMain'
  ClientHeight = 566
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 566
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object StatusBar: TStatusBar
      Left = 0
      Top = 547
      Width = 792
      Height = 19
      AutoHint = True
      Panels = <>
    end
  end
  object ActionList1: TActionList
    Images = ilSmall
    Left = 432
    object actAbout: TAction
      Category = 'Ayuda'
      Caption = '&Acerca de ...'
      Hint = 'Acerca de...|Acerca del sistema'
      ImageIndex = 3
      OnExecute = actAboutExecute
    end
    object actExit: TFileExit
      Category = 'Archivo'
      Caption = '&Salir'
      Hint = 'Salir|Salir del sistema'
      ImageIndex = 0
    end
    object actConect: TAction
      Category = 'Archivo'
      Caption = '&Conectar'
      Hint = 'Conectar|Ingresar a la sesi'#243'n de un usuario'
      ImageIndex = 1
      OnExecute = actConectExecute
    end
    object actDesconect: TAction
      Category = 'Archivo'
      Caption = '&Desconectar'
      Enabled = False
      Hint = 'Dedsconectar|Salir de la sesi'#243'n de un usuario'
      ImageIndex = 2
      OnExecute = actDesconectExecute
    end
  end
  object ilSmall: TImageList
    Left = 464
    Bitmap = {
      494C0101040009000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000A5000000
      A5000000000000000000000000000000000000000000000000000000AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009486840073717300000000000000
      000000000000000000000000000000000000000000000000AD001849FF001041
      EF000818B500000000000000000000000000000000000000B5000838F7000028
      C6000000A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094868400FFE7E700C6A6A5000000
      000000000000000000000000000000000000000000002149F7002151FF001849
      FF001849F7001038CE000000B500000000000000B5001041F7000841F7000838
      F7000830EF000008A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFCFCE00EFC7C600BD9E
      9C0000000000000000000000000000000000000000000000B5002961FF002151
      FF002151FF001849FF001041DE000000A5001849FF001041FF001041F7000838
      F7000838F7000830E70000009C00000000000000000000000000000000000000
      000000000000009E000010A6180021BE310018AE2100008E0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000008C6000828DE001041FF000830F7000008AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B59E9C00AD9694009C8E8C00FFDFDE00FFCFCE00FFEF
      EF0073696B00000000000000000000000000000000000000BD003969FF002959
      FF002959FF002959FF002151FF001849F7001849FF001849FF001041FF001041
      F7001041F7000008B50000000000000000000000000000000000000000000000
      00000096000031CF4A0029CF420029C7420021C7390021BE310010A618000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000008C6002961FF002959FF002151FF001849FF001041FF000028E7000000
      000000000000000000000000000000000000000000000000000000000000CEAE
      AD00D6BEBD00FFEFEF00FFE7E700FFE7E700FFDFDE00FFD7D600FFCFCE00FFC7
      C600C6AEAD0000000000000000000000000000000000000000000000B5004279
      FF003161FF002959FF002959FF002151FF001851FF001849FF001849FF001049
      FF000000A5000000000000000000000000000000000000000000000000000000
      000039D75A0039D75A0039D7520031CF520031CF4A0029C7390021BE3100008E
      0000000000000000000000000000000000000000000000000000000000000000
      00004271FF004269FF003969FF003961FF002959FF001851FF001041FF000008
      AD00000000000000000000000000000000000000000000000000D6B6B500FFF7
      F700FFEFEF00FFEFF700FF9E1000FF9E1800FF9E1800FFBE7B00FFD7D600FFCF
      CE00FFE7E7000000000000000000000000000000000000000000000000000000
      00002138DE003969FF003161FF002959FF002151FF001851FF001849FF000000
      A50000000000000000000000000000000000000000000000000000000000009E
      000042DF6B0042DF6B0042DF630039DF5A0039D7520031CF4A0021C7390018AE
      2100000000000000000000000000000000000000000000000000000000000010
      D6005286FF005286FF004A79FF004A71FF003969FF002959FF001849FF000830
      F7000000000000000000000000000000000000000000DEBEBD00FFF7F700FFF7
      F700FFEFEF00FFF7F700F7BE8400E7860000E7790000FFCFAD00FFD7D600FFD7
      D600FFE7E700DEB6B50000000000000000000000000000000000000000000000
      0000000000004271FF003161FF003161FF002959FF002151FF001038D6000000
      000000000000000000000000000000000000000000000000000000000000009E
      08004AEF730052EF7B004AE7730042E76B0039DF5A0031CF520029C7420021BE
      3100000000000000000000000000000000000000000000000000000000000018
      DE005A8EFF005A96FF005A8EFF005286FF004A71FF003161FF002151FF001041
      FF0000000000000000000000000000000000E7BEBD00FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700FFFFFF00D6690000D6710000FFE7E700FFDFDE00FFD7
      D600FFCFCE00FFE7E7008C797B00000000000000000000000000000000000000
      00000808C6004271FF003969FF003161FF003161FF002959FF001851FF000818
      B5000000000000000000000000000000000000000000000000000000000008A6
      18005AF784005AF78C0052EF84004AE7730042DF630039D7520029C7420010A6
      1800000000000000000000000000000000000000000000000000000000000020
      E70063A6FF00639EFF00639EFF005A8EFF004A79FF003969FF002959FF000828
      DE0000000000000000000000000000000000EFBEBD00FFFFFF00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFFFFF00CE610000CE610800FFE7E700FFDFDE00FFDF
      DE00FFD7D600FFCFCE00EFC7C600000000000000000000000000000000000000
      00005286FF004271FF004271FF003969FF004271FF003161FF002959FF001849
      F7000000AD000000000000000000000000000000000000000000000000000000
      000031D75A0063FF94005AF784004AEF730042DF630039D7520031CF4A00009E
      0000000000000000000000000000000000000000000000000000000000000000
      00003161FF0063A6FF0063A6FF005A8EFF005279FF003969FF002961FF000008
      C60000000000000000000000000000000000F7BEBD00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFFFFF00CE793900D68E5200CE864A00FFEFEF00FFE7E700FFDF
      DE00FFD7D600FFCFCE00FFD7D600000000000000000000000000000000000000
      C6005286FF004A79FF004271FF000000BD000000BD004271FF002959FF002151
      FF001841DE000000BD0000000000000000000000000000000000000000000000
      00000000000031CF5A005AF784004AE7730042DF630039D75A00009600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003161FF00639EFF005A8EFF004A79FF003971FF000010C6000000
      000000000000000000000000000000000000FFC7C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFFF00FFFFFF00F7D7CE00FFEFEF00FFE7E700FFDF
      DE00FFDFDE00FFD7D600C6A6A500000000000000000000000000000000003149
      E7005286FF005279FF003159F70000000000000000000000C6003971FF002151
      FF001849FF000820BD0000000000000000000000000000000000000000000000
      0000000000000000000008A61800009E0800009E000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000020EF000018DE000018D60000000000000000000000
      00000000000000000000000000000000000000000000FFD7D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7C7B500A530000094200000FFF7F700FFE7E700FFE7
      E700FFDFDE00FFEFEF00B59E9C00000000000000000000000000000000003951
      E7006396FF005286FF000000C6000000000000000000000000000000B5003169
      FF001851FF001849FF000000B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFDFDE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE967B00E7BEB500FFF7F700FFEFEF00FFE7
      E700FFEFEF00AD96940000000000000000000000000000000000000000000000
      00000000CE001820D60000000000000000000000000000000000000000000000
      BD000810CE000000BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFC7
      C600FFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700D6B6
      B500E7BEBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7C7C600EFBEBD00E7B6B500DEB6B500D6AEAD00000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFCFDFFFFFFFFFFF3F
      8787FFFFFFFFFF1F8103FFFFFFFFFF8F8001F83FF83FFC078003F01FF01FE007
      C007F00FF00FC007F00FE00FE00F8003F81FE00FE00F0001F00FE00FE00F0001
      F007F00FF00F0001E003F81FF81F0001E183FC7FFC7F8001E1C1FFFFFFFFC003
      F3E3FFFFFFFFE007FFFFFFFFFFFFF83F00000000000000000000000000000000
      000000000000}
  end
end
