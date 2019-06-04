object FConfiguracionEvento: TFConfiguracionEvento
  Left = 0
  Top = 0
  Caption = 'Configuracion'
  ClientHeight = 424
  ClientWidth = 450
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 125
    Height = 18
    Caption = 'Precio Churrasquera'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 64
    Top = 75
    Width = 76
    Height = 18
    Caption = 'Precio Salon'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 64
    Top = 120
    Width = 162
    Height = 18
    Caption = 'Precio Salon Churrasquera'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 64
    Top = 168
    Width = 95
    Height = 18
    Caption = 'Monto Garantia'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 64
    Top = 212
    Width = 98
    Height = 18
    Caption = 'Numero Cuenta'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 64
    Top = 256
    Width = 37
    Height = 18
    Caption = 'Banco'
    FocusControl = DBEdit6
  end
  object DBEdit1: TDBEdit
    Left = 64
    Top = 48
    Width = 134
    Height = 26
    DataField = 'PrecioChurrasquera'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 64
    Top = 94
    Width = 134
    Height = 26
    DataField = 'PrecioSalon'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 139
    Width = 134
    Height = 26
    DataField = 'PrecioSalonChurrasquera'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 64
    Top = 184
    Width = 134
    Height = 26
    DataField = 'MontoGarantia'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 64
    Top = 228
    Width = 134
    Height = 26
    DataField = 'NumeroCuenta'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 64
    Top = 276
    Width = 209
    Height = 26
    DataField = 'Banco'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBNavigator1: TDBNavigator
    Left = 56
    Top = 328
    Width = 222
    Height = 33
    DataSource = DataSource1
    VisibleButtons = [nbEdit, nbPost, nbCancel]
    TabOrder = 6
  end
  object QSQL: TZQuery
    Connection = DMConexion.Conexion
    SQL.Strings = (
      'SELECT * FROM configuracionevento;')
    Params = <>
    Left = 352
    Top = 48
    object QSQLid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object QSQLPrecioChurrasquera: TFloatField
      FieldName = 'PrecioChurrasquera'
    end
    object QSQLPrecioSalon: TFloatField
      FieldName = 'PrecioSalon'
    end
    object QSQLPrecioSalonChurrasquera: TFloatField
      FieldName = 'PrecioSalonChurrasquera'
    end
    object QSQLMontoGarantia: TFloatField
      FieldName = 'MontoGarantia'
    end
    object QSQLNumeroCuenta: TFloatField
      FieldName = 'NumeroCuenta'
    end
    object QSQLBanco: TWideStringField
      FieldName = 'Banco'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = QSQL
    Left = 328
    Top = 112
  end
end
