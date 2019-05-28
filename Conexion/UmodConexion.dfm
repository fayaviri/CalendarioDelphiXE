object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 406
  Width = 442
  object Conexion: TZConnection
    ControlsCodePage = cCP_UTF16
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    HostName = 'localhost'
    Port = 3306
    Database = 'sysconsu_bdmacororo'
    User = 'root'
    Password = 'root'
    Protocol = 'mysql'
    Left = 208
    Top = 120
  end
  object ADOconexion: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 208
    Top = 192
  end
  object QConexion: TZQuery
    Connection = Conexion
    Params = <>
    Left = 208
    Top = 248
  end
  object conexionContable: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 304
    Top = 192
  end
  object CBasedebase: TZConnection
    ControlsCodePage = cCP_UTF16
    Port = 0
    Left = 208
    Top = 64
  end
end
