unit UCalendario;

interface

uses
  DateUtils,
  URegistros,
  UCCalendario,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls,
  ExtCtrls, ComCtrls;

type
  CGenerarCalendario = class(CCalendario)
    private
    //Calendario:CCalendario;
    public
    Dias:integer;
    Lista:array[1..40] of  Registro;
    constructor Crear(_Padre:TComponent;_PadrePrincipal:TWinControl);

    procedure SetDimencion(Anio,Mes:Integer);
    procedure Generar;
    Procedure Construir;

  end;

implementation

{ CCalendario }

{ CGenerarCalendario }

procedure CGenerarCalendario.Construir;
var
i:integer;
begin
  for i := 1 to Dias do
  begin
      AgregarItem(lista[i]);
  end;
end;

constructor CGenerarCalendario.Crear(_Padre: TComponent;
  _PadrePrincipal: TWinControl);
begin
    Padre:=_Padre;
    PadrePrincipal:=_PadrePrincipal;
end;


procedure CGenerarCalendario.Generar;
var
R:Registro;
i:integer;
begin


  R.Anio := 2019;
  R.Mes := 5;
  R.Dia :=1;
  R.Estado:='L';

  Lista[1]:=R;

//  Clendario.AgregarItem(R);

  R.Anio := 2019;
  R.Mes := 5;
  R.Dia :=2;
  R.Estado:='L';

  Lista[2]:=R;
//  Clendario.AgregarItem(R);

  R.Anio := 2019;
  R.Mes := 5;
  R.Dia :=3;
  R.Estado:='L';

  Lista[3]:=R;
//  Clendario.AgregarItem(R);

  for i := 1 to Dias do
  begin
    Lista[i].Dia:=i;
    Lista[i].Parrillas[1].Color:=ColorLibre;
    Lista[i].Parrillas[1].Numero:=1;
    Lista[i].Parrillas[1].Codigo:='123';

    Lista[i].Parrillas[2].Color:=ColorPendiente;
    Lista[i].Parrillas[2].Numero:=1;
    Lista[i].Parrillas[1].Codigo:='123';

    Lista[i].Parrillas[3].Color:=ColorReservado;
    Lista[i].Parrillas[3].Numero:=1;
    Lista[i].Parrillas[1].Codigo:='123';

    Lista[i].Parrillas[4].Color:=ColorLibre;
    Lista[i].Parrillas[4].Numero:=1;
    Lista[i].Parrillas[1].Codigo:='123';
  end;

end;

procedure CGenerarCalendario.SetDimencion(Anio,Mes:integer);
var i:integer;
begin
  Dias:=DaysInAMonth(Anio,Mes);
  for i := 1 to Dias do
  begin
    Lista[i].Dia:=i;
    Lista[i].Estado:='DISPONIBLE';
    Lista[i].Parrillas[1].Color:=ColorLibre;
    Lista[i].Parrillas[1].Numero:=0;
    Lista[i].Parrillas[1].Codigo:='';
    Lista[i].Anio:=Anio;
    Lista[i].Mes:=Mes;
    Lista[i].Estado:='Libre';

    Lista[i].Parrillas[2].Color:=ColorLibre;
    Lista[i].Parrillas[2].Numero:=0;
    Lista[i].Parrillas[3].Codigo:='';
    Lista[i].Anio:=Anio;
    Lista[i].Mes:=Mes;
    Lista[i].Estado:='Libre';


    Lista[i].Parrillas[3].Color:=ColorLibre;
    Lista[i].Parrillas[3].Numero:=0;
    Lista[i].Parrillas[3].Codigo:='';
    Lista[i].Anio:=Anio;
    Lista[i].Mes:=Mes;
    Lista[i].Estado:='Libre';

    Lista[i].Parrillas[4].Color:=ColorLibre;
    Lista[i].Parrillas[4].Numero:=0;
    Lista[i].Parrillas[4].Codigo:='';
    Lista[i].Anio:=Anio;
    Lista[i].Mes:=Mes;
    Lista[i].Estado:='Libre';

  end;
end;

end.
