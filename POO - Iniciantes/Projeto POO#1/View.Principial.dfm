object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 277
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Fun'#231#227'o'
  end
  object Label2: TLabel
    Left = 21
    Top = 59
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 16
    Top = 91
    Width = 32
    Height = 13
    Caption = 'Salario'
  end
  object Label4: TLabel
    Left = 241
    Top = 86
    Width = 29
    Height = 13
    Caption = 'Bonus'
  end
  object cbFuncao: TComboBox
    Left = 53
    Top = 21
    Width = 323
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Administrativo'
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcionario')
  end
  object edtNome: TEdit
    Left = 53
    Top = 56
    Width = 323
    Height = 21
    TabOrder = 1
  end
  object edtSalario: TEdit
    Left = 53
    Top = 88
    Width = 100
    Height = 21
    TabOrder = 2
  end
  object edtBonus: TEdit
    Left = 276
    Top = 83
    Width = 100
    Height = 21
    TabOrder = 3
  end
  object btnCadastrar: TButton
    Left = 16
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnCadastrarClick
  end
  object btnAnterior: TButton
    Left = 296
    Top = 121
    Width = 40
    Height = 25
    Caption = '<<'
    TabOrder = 5
    OnClick = btnAnteriorClick
  end
  object btnProximo: TButton
    Left = 341
    Top = 121
    Width = 35
    Height = 25
    Caption = '>>'
    TabOrder = 6
    OnClick = btnProximoClick
  end
  object memInformacoes: TMemo
    Left = 16
    Top = 152
    Width = 360
    Height = 113
    TabOrder = 7
  end
  object btnCalcularSalario: TButton
    Left = 215
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Calcula Salario'
    TabOrder = 8
    OnClick = btnCalcularSalarioClick
  end
end
