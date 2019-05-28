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
    manzano:string;
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
      propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      close;
(*
  if op='cobrar deuda' then
  begin
    try
      FCobrarDeuda.op:='cobrar deuda';
      FCobrarDeuda.pk_contrato:=DBBuscar.Fields[0].AsString;
      FCobrarDeuda.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FCobrarDeuda.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FCobrarDeuda.pk_usuario:=pk_usuario;
      FCobrarDeuda.pk_condominio:=pk_condominio;
      if (FCobrarDeuda.pk_contrato<>'')and(FCobrarDeuda.pk_condominio<>'') then
      begin
      FCobrarDeuda.Height:=FHeiht;
      FCobrarDeuda.Position:=poScreenCenter;
      FCobrarDeuda.ShowModal;
      end;
    except

    end;
  end;

  if op='cobrar deuda sistema' then
  begin
    try
      FCobrarDeuda.op:='cobrar deuda sistema' ;
      FCobrarDeuda.pk_contrato:=DBBuscar.Fields[0].AsString;
      FCobrarDeuda.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FCobrarDeuda.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FCobrarDeuda.pk_usuario:=pk_usuario;
      FCobrarDeuda.pk_condominio:=pk_condominio;
      if (FCobrarDeuda.pk_contrato<>'')and(FCobrarDeuda.pk_condominio<>'') then
      begin
      FCobrarDeuda.Height:=FHeiht;
      FCobrarDeuda.Position:=poScreenCenter;
      FCobrarDeuda.ShowModal;
      end;
    except

    end;
  end;


  if op='avanzadas error' then
  begin
    try
      FOpcionesAvanzadas.op:='Opciones Avanzadas' ;
      FOpcionesAvanzadas.pk_contrato:=DBBuscar.Fields[0].AsString;
      FOpcionesAvanzadas.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FOpcionesAvanzadas.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FOpcionesAvanzadas.pk_usuario:=pk_usuario;
      FOpcionesAvanzadas.pk_condominio:=pk_condominio;
      if (FOpcionesAvanzadas.pk_contrato<>'')and(FOpcionesAvanzadas.pk_condominio<>'') then
      begin
      FOpcionesAvanzadas.Height:=FHeiht;
      FOpcionesAvanzadas.Position:=poScreenCenter;
      FOpcionesAvanzadas.ShowModal;
      end;
    except

    end;
  end;

  if op='agregar deuda' then
  begin
    try
       if DSBuscar.DataSet.FieldByName('pk_contrato').AsString<>'' then
       begin
        FAgregarDeuda.Height:=Height;
        FAgregarDeuda.Position:=poScreenCenter;
        FAgregarDeuda.pk_contrato:=DBBuscar.Fields[0].AsString;
        FAgregarDeuda.propietario:=DBBuscar.Fields[1].AsString;
        FAgregarDeuda.pk_usuario:=pk_usuario;
        FAgregarDeuda.pk_condominio:=pk_condominio;
        FAgregarDeuda.Lpropiedad.Caption:=DBBuscar.Fields[1].AsString;
        FAgregarDeuda.Lpropietario.Caption:=DBBuscar.Fields[2].AsString;
        FAgregarDeuda.ShowModal;
       end;
    except

    end;
  end;

  if op='editar deuda' then
  begin
    try
      FEditarDeuda.pk_contrato:=DBBuscar.Fields[0].AsString;
      FEditarDeuda.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FEditarDeuda.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FEditarDeuda.pk_usuario:=pk_usuario;
      FEditarDeuda.pk_condominio:=pk_condominio;
      if (FEditarDeuda.pk_contrato<>'')and(FEditarDeuda.pk_condominio<>'') then
      begin
      FEditarDeuda.Height:=FHeiht;
      FEditarDeuda.Position:=poScreenCenter;
      FEditarDeuda.ShowModal;
      end;
    except

    end;
  end;

  if op='eliminar deuda' then
  begin
    try
      FEliminarDeuda.pk_contrato:=DBBuscar.Fields[0].AsString;
      FEliminarDeuda.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FEliminarDeuda.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FEliminarDeuda.pk_usuario:=pk_usuario;
      FEliminarDeuda.pk_condominio:=pk_condominio;
      if (FEliminarDeuda.pk_contrato<>'')and(FEliminarDeuda.pk_condominio<>'') then
      begin
      FEliminarDeuda.Height:=FHeiht;
      FEliminarDeuda.Position:=poScreenCenter;
      FEliminarDeuda.ShowModal;
      end;
    except

    end;
  end;

  if op='administrar cuota' then
  begin
    try
      FEditarCuota.pk_contrato:=DBBuscar.Fields[0].AsString;
      FEditarCuota.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FEditarCuota.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FEditarCuota.pk_usuario:=pk_usuario;
      FEditarCuota.pk_condominio:=pk_condominio;
      if (FEditarCuota.pk_contrato<>'')and(FEditarCuota.pk_condominio<>'') then
      begin
      FEditarCuota.Height:=FHeiht;
      FEditarCuota.Position:=poScreenCenter;
      FEditarCuota.ShowModal;
      end;
    except
    end;
  end;

  if op='eliminar cuota' then
  begin
    try
      FEliminarCuota.pk_contrato:=DBBuscar.Fields[0].AsString;
      FEliminarCuota.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FEliminarCuota.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FEliminarCuota.pk_usuario:=pk_usuario;
      FEliminarCuota.pk_condominio:=pk_condominio;
      if (FEliminarCuota.pk_contrato<>'')and(FEliminarCuota.pk_condominio<>'') then
      begin
      FEliminarCuota.Height:=FHeiht;
      FEliminarCuota.Position:=poScreenCenter;
      FEliminarCuota.ShowModal;
      end;
    except
    end;
  end;

  if op='reimprimir pago' then
  begin
    try
      FSeleccionarReciboPago.pk_contrato:=DBBuscar.Fields[0].AsString;
      FSeleccionarReciboPago.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FSeleccionarReciboPago.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FSeleccionarReciboPago.pk_usuario:=pk_usuario;
      FSeleccionarReciboPago.pk_condominio:=pk_condominio;
      if (FSeleccionarReciboPago.pk_contrato<>'')and(FSeleccionarReciboPago.pk_condominio<>'') then
      begin
      FSeleccionarReciboPago.Height:=FHeiht;
      FSeleccionarReciboPago.Position:=poScreenCenter;
      FSeleccionarReciboPago.ShowModal;
      end;
    except
    end;
  end;

  if op='modificar contrato' then
  begin
    try
      FpersonaPropiedad.Height:=FHeiht;
      FpersonaPropiedad.Position:=poScreenCenter;
      FpersonaPropiedad.pk_usuario:=pk_usuario;
      FpersonaPropiedad.pk_condominio:=pk_condominio;
      FpersonaPropiedad.pk_contrato:=DBBuscar.Fields[0].AsString;
      FpersonaPropiedad.ShowModal;
    except
    end;
  end;

  if op='imprimir deudas' then
  begin
    try
      FInformeDeuPropie.pk_contrato:=DBBuscar.Fields[0].AsString;
      FInformeDeuPropie.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FInformeDeuPropie.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FInformeDeuPropie.pk_usuario:=pk_usuario;
      FInformeDeuPropie.pk_condominio:=pk_condominio;
      if (FInformeDeuPropie.pk_contrato<>'')and(FInformeDeuPropie.pk_condominio<>'') then
      begin
      FInformeDeuPropie.Height:=FHeiht-20;
      FInformeDeuPropie.Position:=poScreenCenter;
      FInformeDeuPropie.ShowModal;
      end;
    except
    end;
  end;

  if op='imprimir historial' then
  begin
    try
      FInformeHistorialPagos.pk_contrato:=DBBuscar.Fields[0].AsString;
      FInformeHistorialPagos.propietario:=DSBuscar.DataSet.FieldByName('propietario').AsString;
      FInformeHistorialPagos.propiedad:=DSBuscar.DataSet.FieldByName('codigo').AsString;
      FInformeHistorialPagos.pk_usuario:=pk_usuario;
      FInformeHistorialPagos.pk_condominio:=pk_condominio;
      if (FInformeHistorialPagos.pk_contrato<>'')and(FInformeHistorialPagos.pk_condominio<>'') then
      begin
      FInformeHistorialPagos.Height:=FHeiht-20;
      FInformeHistorialPagos.Position:=poScreenCenter;
      FInformeHistorialPagos.ShowModal;
      end;
    except
    end;
  end;
  *)
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
