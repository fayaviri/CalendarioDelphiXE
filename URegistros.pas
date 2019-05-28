unit URegistros;

interface

uses
  DateUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls,
  ExtCtrls, ComCtrls;

const
  InicioTop=40;
  InicioLeft=40;

  Ancho=95;
  Alto=102;
  Espacio=5;

  Fila = 5;
  ColorLibre = $50DB03;
  ColorPendiente = $008EEB;
  ColorReservado = $1A13F2;

type

  Parrillas = record
    Color : TColor;//Colro de  disponibilidad
    Numero : Integer; // 1,2,3,4
    Codigo : string; //Codifo de id de la base de datos
  end;


  Registro=record
    Anio : Integer;
    Mes : Integer;
    Dia : Integer;
    Estado:string;
    Numero:string;
    Parrillas : array[1..4] of Parrillas;
  end;



  Componentes = record
    Panel:TPanel;
    Image:TImage;
    LNumeroDia:TLabel;
    Btn1 : TPanel;
    Btn2 : TPanel;
    Btn3 : TPanel;
    Btn4 : TPanel;
  end;

implementation

end.
