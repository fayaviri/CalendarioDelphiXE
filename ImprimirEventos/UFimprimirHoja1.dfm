object RVFImprimirHoja1: TRVFImprimirHoja1
  Left = 0
  Top = 0
  Caption = 'Imprimir Hoja 1'
  ClientHeight = 448
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FImprimirHoja1: TRvProject
    Engine = RvSystem1
    Left = 136
    Top = 56
  end
  object RDSFImprimirHoja1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QSQLHoja1
    Left = 136
    Top = 128
  end
  object QSQLHoja1: TZQuery
    Connection = DMConexion.Conexion
    Active = True
    SQL.Strings = (
      'SELECT  '
      'evento.fecha, '
      'persona.nombre, '
      'persona.ci, '
      'persona.direccion, '
      'evento.numero, '
      'evento.horainicio, '
      'evento.horafin, '
      'evento.PropietarioInquilino,'
      'evento.colorChurrasquera, '
      'evento.checkChurrasquera, '
      'evento.checkSalon, '
      'evento.MotivoEvento, '
      'evento.NumeroInvitados, '
      'evento.CelularContacto, '
      'evento.Amenizado, '
      
        '(select nombre from condominio where pk_condominio=1) as Condomi' +
        'nio '
      'FROM  '
      
        'evento inner join persona on evento.fk_persona=persona.pk_person' +
        'a '
      'where '
      'evento.pk_evento=23')
    Params = <>
    Left = 296
    Top = 128
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 288
    Top = 56
  end
  object QConfiguracion: TZQuery
    Connection = DMConexion.Conexion
    Active = True
    SQL.Strings = (
      'select * from configuracionevento;')
    Params = <>
    Left = 296
    Top = 192
  end
  object RVFImprimirHoja1Configuracion: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QConfiguracion
    Left = 136
    Top = 192
  end
end
