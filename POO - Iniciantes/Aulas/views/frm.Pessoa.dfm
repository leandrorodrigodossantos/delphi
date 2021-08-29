object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 505
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
  object Button1: TButton
    Left = 184
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtNomePessoa: TEdit
    Left = 138
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtNomeCliente: TEdit
    Left = 138
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtNomeCliente'
  end
  object Button2: TButton
    Left = 184
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button2Click
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 312
    Top = 72
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 376
    Top = 128
  end
end
