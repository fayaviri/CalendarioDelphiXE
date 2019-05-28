unit UFBPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFBPersona = class(TForm)
    Label1: TLabel;
    Ebuscar: TEdit;
    DBGrid1: TDBGrid;
    DSPropietario: TDataSource;
    Qpropietario: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure EbuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscar(nombre: string);
    procedure ClicAcept;
  public
    { Public declarations }
    pk_persona,
    nombre:string;
  end;

var
  FBPersona: TFBPersona;

implementation

{$R *.dfm}
procedure TFBPersona.buscar(nombre: string);
begin
  with Qpropietario do
  begin
    SQL.Text:='select pk_persona,nombre,ci from persona WHERE nombre like ''%'+nombre+'%'' limit 10';
    Open;
    Active:=True;
  end;
end;

procedure TFBPersona.ClicAcept;
begin
  try
    with DSPropietario.DataSet do
    begin
      pk_persona:=FieldByName('pk_persona').AsString;
      nombre:=FieldByName('nombre').AsString;
    end;
    close;
  except

  end;
end;

procedure TFBPersona.DBGrid1DblClick(Sender: TObject);
begin
  ClicAcept;
end;

procedure TFBPersona.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
  ClicAcept;

  if key=27 then
  Close;
end;

procedure TFBPersona.EbuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
  begin
    buscar(Ebuscar.Text);
  end;

  if key=40 then
  DBGrid1.SetFocus;

  if key=27 then
  Close;
end;

procedure TFBPersona.FormShow(Sender: TObject);
begin
  Ebuscar.Clear;
  Ebuscar.SetFocus;
end;

end.
