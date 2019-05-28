program Project1;

uses
  Forms,
  FormEventos in 'FormEventos.pas' {FEventos},
  UCalendario in 'UCalendario.pas',
  UFAgregarEvento in 'UFAgregarEvento.pas' {FAgregarEvento},
  UmodConexion in 'Conexion\UmodConexion.pas' {DMConexion: TDataModule},
  UFBPropiedadPropietarioEvento in 'Seleccionar Propietario Propiedad\UFBPropiedadPropietarioEvento.pas' {FBPropiedadPropietarioEvento},
  UmodBuscarPropiedadPropietario in 'Seleccionar Propietario Propiedad\UmodBuscarPropiedadPropietario.pas' {DMBuscarPropiedaPropiedad: TDataModule},
  UFApersona in 'Dialogs Agregar Persona\UFApersona.pas' {FApersona},
  UFBPersona in 'Dialogs Personas\UFBPersona.pas' {FBPersona},
  UCCalendario in 'UCCalendario.pas',
  URegistros in 'URegistros.pas',
  UFimprimirHoja1 in 'ImprimirEventos\UFimprimirHoja1.pas' {RVFImprimirHoja1},
  UFSelectImprimirEvento in 'ImprimirEventos\UFSelectImprimirEvento.pas' {FSelectImprimirEvento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFEventos, FEventos);
  Application.CreateForm(TFAgregarEvento, FAgregarEvento);
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TFBPropiedadPropietarioEvento, FBPropiedadPropietarioEvento);
  Application.CreateForm(TDMBuscarPropiedaPropiedad, DMBuscarPropiedaPropiedad);
  Application.CreateForm(TFApersona, FApersona);
  Application.CreateForm(TFBPersona, FBPersona);
  Application.CreateForm(TRVFImprimirHoja1, RVFImprimirHoja1);
  Application.CreateForm(TFSelectImprimirEvento, FSelectImprimirEvento);
  Application.Run;
end.
