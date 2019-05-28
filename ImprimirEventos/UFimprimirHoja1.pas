unit UFimprimirHoja1;

interface

uses
  umodconexion,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RpCon, RpConDS,
  RpDefine, RpRave, RpBase, RpSystem, Buttons, RpRenderPrinter, RpRender,
  RpRenderCanvas, RpRenderPreview, RpConBDE, RpFiler;

type
  TRVFImprimirHoja1 = class(TForm)
    FImprimirHoja1: TRvProject;
    RDSFImprimirHoja1: TRvDataSetConnection;
    QSQLHoja1: TZQuery;
    RvSystem1: TRvSystem;
    QConfiguracion: TZQuery;
    RVFImprimirHoja1Configuracion: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }


    procedure Cargar(pk_evento,pk_condominio:string);
    procedure Imprimir(pk_evento,pk_condominio:string);
  end;

var
  RVFImprimirHoja1: TRVFImprimirHoja1;

implementation

{$R *.dfm}

procedure TRVFImprimirHoja1.Cargar(pk_evento,pk_condominio:string);
begin
  with QSQLHoja1 do
  begin
    SQL.Text:=''+
    ' SELECT  '+
' evento.fecha,  '+
' persona.nombre,  '+
' persona.ci,  '+
' persona.direccion,  '+
' evento.numero,  '+
' evento.horainicio,  '+
' evento.horafin,  '+
' evento.PropietarioInquilino, '+
' evento.colorChurrasquera,  '+
' evento.checkChurrasquera,  '+
' evento.checkSalon,  '+
' evento.MotivoEvento,  '+
' evento.NumeroInvitados,  '+
' evento.CelularContacto,  '+
' evento.Amenizado,  '+
' (select nombre from condominio where pk_condominio=1) as Condominio  '+

    ' (select nombre from condominio where pk_condominio=1) as Condominio '+
    ' FROM  '+
    ' evento inner join persona on evento.fk_persona=persona.pk_persona '+
    ' where '+
    ' evento.pk_evento='+pk_evento+'; ';
    Open;
    Active:=True;

  end;

  with QConfiguracion do
  begin
    SQL.Text:='select * from configuracionevento;';
    Open;
    Active:=True;

  end;

end;

procedure TRVFImprimirHoja1.Imprimir(pk_evento, pk_condominio: string);
begin
    FImprimirHoja1.ProjectFile:=ExtractFilePath(ExpandFileName('vizat.exe'))+'ImprimirHoja1.rav';
    Cargar(pk_evento, pk_condominio);
    FImprimirHoja1.Open;
    FImprimirHoja1.ExecuteReport('Report2');
    FImprimirHoja1.Close;
end;

end.
