unit FormEventos;

interface

uses
  UCalendario,
  DateUtils,
  Umodconexion,
  URegistros,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls,
  ExtCtrls, ComCtrls, JvExControls, JvSpeedButton, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type

CLCalendario=class(CGenerarCalendario)
  public
  procedure HacerClick(Sender: TObject); override;
end;


  TFEventos = class(TForm)
    Button3: TButton;
    Label1: TLabel;
    Cmes: TComboBox;
    cano: TComboBox;
    QSQL: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GenenrarCalendario : CLCalendario;
    procedure Iniciar;

  end;

var
  FEventos: TFEventos;

implementation

uses UFAgregarEvento;

{$R *.dfm}

function NombreMes(mes: Integer): string;
const
  MESES: array[1..12] of string = ('Enero','Febrero','Marzo','Abril','Mayo',
        'Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
begin
  Result:= MESES[mes];
end;

function ObtenerNumeroMes(mes:string):Integer;
const
{}
  MESES: array[1..12] of string = ('Enero','Febrero','Marzo','Abril','Mayo',
        'Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
var i:integer;
begin
  for i := 1 to 12 do
    if MESES[i]=mes then
       Result:=i;
end;

procedure TFEventos.Button3Click(Sender: TObject);
begin
  Iniciar;
end;

procedure TFEventos.FormCreate(Sender: TObject);
begin
  GenenrarCalendario := CLCalendario.Crear(FEventos,FEventos);
end;

procedure TFEventos.FormShow(Sender: TObject);
var
  aNo, Mes, Dia:Word;
begin
  DecodeDate(now(), aNo, Mes, Dia);
  Cmes.Text:=NombreMes(mes);
  cano.Text:=inttostr(ano);
  Iniciar;
end;

procedure TFEventos.Iniciar;
var
anio,mes:Integer;
dia,numero:integer;
begin
  mes:=(ObtenerNumeroMes( Cmes.Text));
  anio:=StrToInt(cano.Text);

  GenenrarCalendario.EliminarComponentes;
  GenenrarCalendario.SetDimencion(anio,mes);
  //GenenrarCalendario.Generar;

  with QSQL do
  begin
    SQL.Text:='SELECT pk_evento,fecha,anio,mes,dia,horainicio,'+
    'horafin,fk_contrato,fk_propietario,'+
    'fk_persona,disponible'+
    ',numero FROM evento where mes='+IntToStr(mes)+' and anio='+IntToStr(anio);
    Open;
    Active:=True;

    while not(eof) do
    begin
      dia :=FieldByName('dia').AsInteger;

      GenenrarCalendario.Lista[dia].Anio := StrToInt(cano.Text);
      GenenrarCalendario.Lista[dia].Mes:=mes;
      GenenrarCalendario.Lista[dia].Dia:=FieldByName('dia').Value;
      GenenrarCalendario.Lista[dia].Numero:=FieldByName('numero').AsString;

        numero := FieldByName('numero').AsInteger;

          if FieldByName('disponible').AsString='Libre' then
          begin
            GenenrarCalendario.Lista[dia].Parrillas[numero].Color:= ColorLibre;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Numero := FieldByName('numero').Value;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Codigo:= FieldByName('pk_evento').value;
          end;
          if FieldByName('disponible').AsString='Solicitada' then
          begin
            GenenrarCalendario.Lista[dia].Parrillas[numero].Color:=ColorPendiente;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Numero := FieldByName('numero').Value;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Codigo:= FieldByName('pk_evento').value;          end;
          if FieldByName('disponible').AsString='Reservada' then
          begin
            GenenrarCalendario.Lista[dia].Parrillas[numero].Color:=ColorReservado;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Numero := FieldByName('numero').Value;
            GenenrarCalendario.Lista[dia].Parrillas[numero].Codigo:= FieldByName('pk_evento').value;
          end;

        QSQL.Next;
    end;

  end;

  GenenrarCalendario.Construir;
end;

{ CCalendario }

procedure CLCalendario.HacerClick(Sender: TObject);
begin
  inherited;
  //ShowMessage('Hola');


  with  (Sender as TPanel) do
  begin
    FAgregarEvento.Dato:=Hint;
    FAgregarEvento.ShowModal;
  end;

  FEventos.Iniciar;

end;

end.
