object FBPersona: TFBPersona
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 503
  ClientWidth = 459
  Color = 6994790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 18
    Caption = 'Buscar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Ebuscar: TEdit
    Left = 54
    Top = 8
    Width = 363
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = EbuscarKeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 460
    Height = 463
    DataSource = DSPropietario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Calibri'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'pk_persona'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nombre'
        Title.Caption = 'Nombre'
        Width = 259
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ci'
        Title.Caption = 'CI'
        Width = 100
        Visible = True
      end>
  end
  object DSPropietario: TDataSource
    DataSet = Qpropietario
    Left = 232
    Top = 168
  end
  object Qpropietario: TZQuery
    Connection = DMConexion.Conexion
    SQL.Strings = (
      'select pk_persona,nombre,ci from persona')
    Params = <>
    Left = 336
    Top = 104
  end
end
