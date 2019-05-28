object FEventos: TFEventos
  Left = 0
  Top = 0
  Caption = 'Eventos'
  ClientHeight = 561
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 209
    Top = 10
    Width = 29
    Height = 18
    Caption = 'A'#209'O'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Button3: TButton
    Left = 553
    Top = 6
    Width = 75
    Height = 29
    Caption = 'Generar'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Cmes: TComboBox
    Left = 350
    Top = 6
    Width = 179
    Height = 26
    TabOrder = 1
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
  end
  object cano: TComboBox
    Left = 252
    Top = 6
    Width = 90
    Height = 26
    TabOrder = 2
    Items.Strings = (
      '2019'
      '2020'
      '2021'
      '2022'
      '2023'
      '2024'
      '2025'
      '2026'
      '2027'
      '2028'
      '2029'
      '2030')
  end
  object QSQL: TZQuery
    Connection = DMConexion.Conexion
    Params = <>
    Left = 520
    Top = 104
  end
end
