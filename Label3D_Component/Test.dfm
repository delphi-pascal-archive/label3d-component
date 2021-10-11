object FormTest: TFormTest
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TEST DU COMPOSANT LABEL3D  - (C) GUY BIDI'
  ClientHeight = 391
  ClientWidth = 423
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label3D1: Label3D
    Left = 75
    Top = 32
    Width = 273
    Height = 46
    Ecart3D = 1
    Color1 = clBlack
    Color2 = clRed
    ColorFond = clInactiveCaption
    ColorMouse = clFuchsia
    Interval = 60
    Transparent = True
    Caption = #169' Guy Bidi 2007'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object Groupe: TGroupBox
    Left = 8
    Top = 96
    Width = 407
    Height = 89
    Caption = 'Style de Label 3D'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnClick = GroupeClick
    object Style1: TRadioButton
      Left = 16
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Relief'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = GroupeClick
    end
    object Style2: TRadioButton
      Left = 104
      Top = 40
      Width = 89
      Height = 17
      Caption = 'Clignotant'
      TabOrder = 1
      OnClick = GroupeClick
    end
    object Style3: TRadioButton
      Left = 199
      Top = 40
      Width = 81
      Height = 17
      Caption = 'D'#233'filant'
      TabOrder = 2
      OnClick = GroupeClick
    end
    object Transparent: TCheckBox
      Left = 286
      Top = 40
      Width = 110
      Height = 17
      Caption = 'Transparent'
      TabOrder = 3
      OnClick = TransparentClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 191
    Width = 407
    Height = 90
    Caption = 'Couleurs 1er et 2'#232'me Plan, du Fond et de la Souris'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 28
      Width = 41
      Height = 16
      Caption = 'Color1'
    end
    object Label2: TLabel
      Left = 111
      Top = 28
      Width = 41
      Height = 16
      Caption = 'Color2'
    end
    object Label3: TLabel
      Left = 211
      Top = 28
      Width = 63
      Height = 16
      Caption = 'ColorFond'
    end
    object Label4: TLabel
      Left = 305
      Top = 28
      Width = 75
      Height = 16
      Caption = 'ColorMouse'
    end
    object ColorBox1: TColorBox
      Left = 10
      Top = 50
      Width = 89
      Height = 22
      ItemHeight = 16
      TabOrder = 0
      OnChange = ColorBoxChange
    end
    object ColorBox2: TColorBox
      Left = 110
      Top = 50
      Width = 89
      Height = 22
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBoxChange
    end
    object ColorBoxFond: TColorBox
      Left = 210
      Top = 50
      Width = 89
      Height = 22
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBoxChange
    end
    object ColorBoxMouse: TColorBox
      Left = 310
      Top = 50
      Width = 89
      Height = 22
      ItemHeight = 16
      TabOrder = 3
      OnChange = ColorBoxChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 296
    Width = 407
    Height = 81
    Caption = 'Intervalle et '#201'cart3D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 126
      Top = 17
      Width = 85
      Height = 16
      Alignment = taCenter
      Caption = 'Ecart3D'
    end
    object Label6: TLabel
      Left = 16
      Top = 19
      Width = 83
      Height = 16
      Alignment = taCenter
      Caption = 'Interval'
    end
    object Intervalle: TMaskEdit
      Left = 16
      Top = 41
      Width = 65
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object UDIntervalle: TUpDown
      Left = 79
      Top = 41
      Width = 20
      Height = 24
      Associate = Intervalle
      Max = 1000
      Increment = 10
      TabOrder = 1
      OnChanging = UDIntervalleChanging
    end
    object Sortie: TBitBtn
      Left = 305
      Top = 37
      Width = 91
      Height = 25
      Caption = '&Sortie'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03FF3301BBBBBBBB03FF33011BBBBBBB03FF330111BBBBBB03FF3301110BBBBB
        03FF3301110BBBBB03FF3301110BBBBB03FF3301110BBBBB03FF3301110BBBBB
        03FF3301110BBBBB03FF330111B0BBBB03FF3301110BBBBB03FF3301110BBBBB
        03FF3301E10BBBBB03FF3301EE0BBBBB03FF33000000000003FF}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = SortieClick
    end
    object Ecart: TMaskEdit
      Left = 126
      Top = 39
      Width = 65
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '0'
    end
    object UDEcart: TUpDown
      Left = 191
      Top = 39
      Width = 20
      Height = 24
      Associate = Ecart
      Max = 50
      TabOrder = 4
      OnChanging = UDEcartChanging
    end
    object Help: TBitBtn
      Left = 223
      Top = 37
      Width = 74
      Height = 25
      Caption = '&Aide'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080
        8080800080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000000000808080C0C0C0FFFFFFC0C0C0800080000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000000000808080C0C0C0FFFFFFFFFFFF80
        8080C0C0C0C0C0C0800080000000FFFFFFFFFFFFFFFFFFFFFFFF000000808080
        C0C0C0FFFFFFFFFFFF808080808080000000808080C0C0C0C0C0C08000800000
        00FFFFFFFFFFFFFFFFFF800080808080FFFFFF80808080808000000000000080
        0080000000808080C0C0C0C0C0C0800080000000FFFFFFFFFFFF800080808080
        808080000000000000800080800080800080800080000000808080C0C0C0C0C0
        C0800080000000FFFFFF80008000000000000080008080008080008080008080
        0080800080800080000000808080C0C0C0C0C0C0800080000000800080808080
        80008080008080008080008000FFFF0080808000808000808000800000008080
        80C0C0C0000000000000FFFFFF800080808080800080800080800080800080C0
        C0C000FFFF00FFFF800080800080000000808080000000FFFFFFFFFFFFFFFFFF
        80008080808080008080008000808000808080008000FFFF00FFFF8000808000
        80000000000000FFFFFFFFFFFFFFFFFFFFFFFF80008080808080008080008000
        FFFF00FFFF00FFFF008080800080800080800080000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8000808080808000808000808000808000808000808000808000
        80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80008080808080
        0080800080800080800080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF800080808080800080000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        0080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      OnClick = HelpClick
    end
  end
end
