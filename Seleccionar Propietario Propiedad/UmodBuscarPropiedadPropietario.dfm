object DMBuscarPropiedaPropiedad: TDMBuscarPropiedaPropiedad
  OldCreateOrder = False
  Height = 487
  Width = 514
  object QBuscarpersona: TZQuery
    Connection = DMConexion.Conexion
    SQL.Strings = (
      'select '
      'persona_contrato.fk_contrato,'
      'persona.nombre,'
      'persona.ci,'
      'propiedad.codigo,'
      'persona.pk_persona'
      'from '
      
        '((persona_contrato inner join persona on persona_contrato.fk_per' +
        'sona=persona.pk_persona) inner join'
      
        'contrato on persona_contrato.fk_contrato=contrato.pk_contrato) i' +
        'nner join '
      'propiedad on contrato.fk_propiedad=propiedad.pk_propiedad'
      
        'where persona_contrato.tipo='#39'PROPIETARIO'#39' and persona.nombre lik' +
        'e '#39'%juan%'#39';')
    Params = <>
    Left = 216
    Top = 144
  end
  object Qmanzano: TZQuery
    Connection = DMConexion.Conexion
    SQL.Strings = (
      'select'
      'pk_manzano,'
      'codigo'
      'from manzano'
      'where fk_condominio=1')
    Params = <>
    Left = 216
    Top = 224
  end
  object QPropiedad: TZQuery
    Connection = DMConexion.Conexion
    SQL.Strings = (
      'select'
      'pk_propiedad,'
      'codigo'
      'from propiedad'
      'where fk_manzano=4;')
    Params = <>
    Left = 224
    Top = 288
  end
end
