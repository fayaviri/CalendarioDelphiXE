unit UFBPropiedadPropietarioEvento;

interface

uses
  UmodBuscarPropiedadPropietario,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGrids, ComCtrls, DBCtrls, ExtCtrls, pngimage;

type
  TFBPropiedadPropietarioEvento = class(TForm)
    DSBuscar: TDataSource;
    ebuscar: TEdit;
    DBBuscar: TDBGrid;
    DSManzano: TDataSource;
    DSPropiedad: TDataSource;
    DBlsitamanzanos: TDBGrid;
    dblistapropiedad: TDBGrid;
    Sbotonmanzano: TShape;
    Label1: TLabel;
    Image1: TImage;
    sbotonpropiedad: TShape;
    lbotonpropiedad: TLabel;
    imgbotonpropiedad: TImage;
    Panel3: TPanel;
    Label8: TLabel;
    Shape5: TShape;
    procedure ebuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBBuscarDblClick(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBBuscarCellClick(Column: TColumn);
    procedure ebuscarClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBlsitamanzanosCellClick(Column: TColumn);
    procedure dblistapropiedadCellClick(Column: TColumn);
    procedure DBBuscarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBlsitamanzanosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblistapropiedadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label1Click(Sender: TObject);
    procedure SbotonmanzanoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SbotonmanzanoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure lbotonpropiedadClick(Sender: TObject);
    procedure sbotonpropiedadMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgbotonpropiedadClick(Sender: TObject);
    procedure sbotonpropiedadMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure ClicInDbGrid;
    procedure ClicManzano;
    procedure ClicPropiedad;
  public
    { Public declarations }
    pk_condominio,

    pk_contrato,
    pk_usuario:string;

    pk_manzano,
    manzano,
    pk_propiedad,
    propiedad,
    propietario:string;

    FHeiht:integer;
    op:string;

  end;

var
  FBPropiedadPropietarioEvento: TFBPropiedadPropietarioEvento;

implementation



{$R *.dfm}

procedure TFBPropiedadPropietarioEvento.ClicInDbGrid;
begin

      pk_contrato:=DBBuscar.Fields[0].AsString;
      pk_propiedad:=DSBuscar.DataSet.FieldByName('pk_propiedad').AsString;
      propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      close;

end;

procedure TFBPropiedadPropietarioEvento.ClicManzano;
begin
DBlsitamanzanos.Visible:=True;
dblistapropiedad.Visible:=False;
DBlsitamanzanos.SetFocus;
end;

procedure TFBPropiedadPropietarioEvento.ClicPropiedad;
begin
  DBlsitamanzanos.Visible:=False;
  dblistapropiedad.Visible:=True;
  dblistapropiedad.SetFocus;
end;

procedure TFBPropiedadPropietarioEvento.DBBuscarCellClick(Column: TColumn);
begin
DBlsitamanzanos.Visible:=False;
dblistapropiedad.Visible:=False;
end;

procedure TFBPropiedadPropietarioEvento.DBBuscarDblClick(Sender: TObject);
begin
  ClicInDbGrid;
end;

procedure TFBPropiedadPropietarioEvento.DBBuscarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    //if Odd(DBBuscar.DataSource.DataSet.RecNo) then
    //DBBuscar.Canvas.Brush.Color :=TColor($00F4F4F4);// TColor($00FEE2E8);
  end
  else
  begin
    DBBuscar.Canvas.Brush.Color := $00FFD3A8; //TColor($0080FF00);
  end;
  DBBuscar.DefaultDrawColumnCell(rect,DataCol,Column,State);
end;

procedure TFBPropiedadPropietarioEvento.DBBuscarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=13 then
  begin
    ClicInDbGrid;
  end;

  if key=27 then
  Close;
end;

procedure TFBPropiedadPropietarioEvento.dblistapropiedadCellClick(Column: TColumn);
begin
pk_propiedad:=dblistapropiedad.DataSource.DataSet.FieldByName('pk_propiedad').AsString;
propiedad:=dblistapropiedad.DataSource.DataSet.FieldByName('codigo').AsString;
//btnpropiedad.Caption:=propiedad;
DMBuscarPropiedaPropiedad.buscarporpropiedad( pk_propiedad);
dblistapropiedad.Visible:=False;
end;

procedure TFBPropiedadPropietarioEvento.dblistapropiedadKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=27 then
  Close;
end;

procedure TFBPropiedadPropietarioEvento.DBLookupComboBox1CloseUp(Sender: TObject);
begin
//
end;

procedure TFBPropiedadPropietarioEvento.DBlsitamanzanosCellClick(Column: TColumn);
begin

  pk_manzano:=DBlsitamanzanos.DataSource.DataSet.FieldByName('pk_manzano').AsString;
  manzano:=DBlsitamanzanos.DataSource.DataSet.FieldByName('codigo').AsString;
  //btnmanzano.Caption:=DBlsitamanzanos.DataSource.DataSet.FieldByName('codigo').AsString;
  DMBuscarPropiedaPropiedad.cargarpropiedaddes(pk_manzano);
  DBlsitamanzanos.Visible:=False;
  dblistapropiedad.Visible:=False;
end;

procedure TFBPropiedadPropietarioEvento.DBlsitamanzanosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=27 then
  Close;
end;

procedure TFBPropiedadPropietarioEvento.ebuscarClick(Sender: TObject);
begin
DBlsitamanzanos.Visible:=False;
dblistapropiedad.Visible:=False;
end;

procedure TFBPropiedadPropietarioEvento.ebuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key=13 then
  DMBuscarPropiedaPropiedad.buscar(ebuscar.Text);

  if key=40 then
  DBBuscar.SetFocus;

  if key=27 then
  Close;

end;

procedure TFBPropiedadPropietarioEvento.FormClick(Sender: TObject);
begin
DBlsitamanzanos.Visible:=False;
dblistapropiedad.Visible:=False;
end;

procedure TFBPropiedadPropietarioEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DSManzano.DataSet.Active:=False;
DSBuscar.DataSet.Active:=False;
DSPropiedad.DataSet.Active:=False;
end;

procedure TFBPropiedadPropietarioEvento.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Sbotonmanzano.Pen.Color:=$00E0E0E0;
  Sbotonmanzano.Pen.Width:=3;

  sbotonpropiedad.Pen.Color:=$00E0E0E0;
  sbotonpropiedad.Pen.Width:=3;

end;

procedure TFBPropiedadPropietarioEvento.FormShow(Sender: TObject);
begin
ebuscar.Clear;
ebuscar.SetFocus;
DMBuscarPropiedaPropiedad.cargarmanzano(pk_condominio);
DBlsitamanzanos.Visible:=false;
dblistapropiedad.Visible:=false;
end;

procedure TFBPropiedadPropietarioEvento.Image1Click(Sender: TObject);
begin
  ClicManzano;
end;

procedure TFBPropiedadPropietarioEvento.imgbotonpropiedadClick(Sender: TObject);
begin
ClicPropiedad;
end;

procedure TFBPropiedadPropietarioEvento.Label1Click(Sender: TObject);
begin
  ClicManzano;
end;

procedure TFBPropiedadPropietarioEvento.lbotonpropiedadClick(Sender: TObject);
begin
ClicPropiedad;
end;

procedure TFBPropiedadPropietarioEvento.SbotonmanzanoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Sbotonmanzano.Pen.Color:=clWhite;
  Sbotonmanzano.Pen.Width:=2;
end;

procedure TFBPropiedadPropietarioEvento.SbotonmanzanoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ClicManzano;
end;

procedure TFBPropiedadPropietarioEvento.sbotonpropiedadMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  sbotonpropiedad.Pen.Color:=clWhite;
  sbotonpropiedad.Pen.Width:=2;
end;

procedure TFBPropiedadPropietarioEvento.sbotonpropiedadMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ClicPropiedad;
end;

end.
