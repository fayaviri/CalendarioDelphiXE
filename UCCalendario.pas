unit UCCalendario;

interface

uses
  DateUtils,
  URegistros,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls,
  ExtCtrls, ComCtrls;

type
  CCalendario = class

    private
      n:Integer;
      ptop:Integer;
      pleft:Integer;

      f,c : Integer;
    public

    Padre:TComponent;
    PadrePrincipal:TWinControl;
    ListaComponentes:array[1..100]of Componentes;
    constructor Crear(_Padre:TComponent;_PadrePrincipal:TWinControl);
    procedure Inicializar;
    procedure AgregarItem(Reg:Registro);//Item:Componentes
    procedure EliminarComponentes;
    procedure HacerClick(Sender: TObject); virtual;

  end;

implementation

{ CCalendario }

procedure CCalendario.AgregarItem(Reg: Registro);
begin

    inc(n);
    c:=c+1;

    ListaComponentes[n].panel:=TPanel.Create( Padre); //PanelLeft
    ListaComponentes[n].panel.Parent:=PadrePrincipal;//;Finicio;
    ListaComponentes[n].panel.Left:=pleft;//40;

    ListaComponentes[n].panel.Top:=ptop; //50;
    //ListaComponentes[n].panel.BevelOuter:=bvNone;
    ListaComponentes[n].panel.Width:=Ancho;
    ListaComponentes[n].panel.Height := Alto;
    ListaComponentes[n].panel.Name := 'n'+IntToStr(n);
    ListaComponentes[n].panel.Caption := IntToStr(Reg.Dia); //'12345678910111213141516171819';
    //ListaComponentes[n].panel.Cursor := crHandPoint;
    ListaComponentes[n].panel.Color := $004A4A4A;
    ListaComponentes[n].Panel.ParentBackground := False;
    //ListaComponentes[n].panel.OnClick:=OnClickButonPanel;
    pleft := pleft + ListaComponentes[n].panel.Width + Espacio;
    //ptop:=ptop+45;


    ListaComponentes[n].LNumeroDia :=  TLabel.Create(ListaComponentes[n].Panel);
    ListaComponentes[n].LNumeroDia.Parent := ListaComponentes[n].Panel;
    ListaComponentes[n].LNumeroDia.Caption:= IntToStr(Reg.Dia);
    ListaComponentes[n].LNumeroDia.Align := alTop;
    ListaComponentes[n].LNumeroDia.Alignment := taCenter;
    ListaComponentes[n].LNumeroDia.Font.Size:=12;
    ListaComponentes[n].LNumeroDia.Font.Style := [fsBold];
    ListaComponentes[n].LNumeroDia.Font.Color:=clWhite;
    ListaComponentes[n].LNumeroDia.Top := 20;

    ListaComponentes[n].Btn1 := TPanel.Create(ListaComponentes[n].Panel);
    ListaComponentes[n].Btn1.Top:=ListaComponentes[n].lnumerodia.Height;
    ListaComponentes[n].Btn1.Width:=(ListaComponentes[n].panel.Width div 2);
    ListaComponentes[n].Btn1.Parent := ListaComponentes[n].Panel;
    ListaComponentes[n].Btn1.color := reg.Parrillas[1].Color;
    ListaComponentes[n].Btn1.Hint := reg.Parrillas[1].Codigo+'|'+IntToStr(reg.Dia)+'/'+IntToStr(reg.Mes)+'/'+IntToStr(Reg.Anio)+'|1';
    ListaComponentes[n].Btn1.ParentBackground:=False;
    ListaComponentes[n].Btn1.Caption:='1';
    ListaComponentes[n].Btn1.Font.Size:=12;
    ListaComponentes[n].Btn1.Font.Color:=clWhite;
    ListaComponentes[n].Btn1.OnClick := HacerClick;
    ListaComponentes[n].Btn1.Font.Size:=15;


    ListaComponentes[n].Btn2 := TPanel.Create(ListaComponentes[n].Panel);
    ListaComponentes[n].Btn2.Left:=ListaComponentes[n].Btn1.Width;
    ListaComponentes[n].Btn2.Top:=ListaComponentes[n].lnumerodia.Height;
    ListaComponentes[n].Btn2.Width:=(ListaComponentes[n].panel.Width div 2);
    ListaComponentes[n].Btn2.Parent := ListaComponentes[n].Panel;
    ListaComponentes[n].Btn2.color := reg.Parrillas[2].Color;
    ListaComponentes[n].Btn2.Hint := reg.Parrillas[2].Codigo+'|'+IntToStr(reg.Dia)+'/'+IntToStr(reg.Mes)+'/'+IntToStr(Reg.Anio)+'|2';
    ListaComponentes[n].Btn2.ParentBackground:=False;
    ListaComponentes[n].Btn2.Caption:='2';
    ListaComponentes[n].Btn2.Font.Size:=12;
    ListaComponentes[n].Btn2.Font.Color:=clWhite;
    ListaComponentes[n].Btn2.OnClick := HacerClick;
    ListaComponentes[n].Btn2.Font.Size:=15;


    ListaComponentes[n].Btn3 := TPanel.Create(ListaComponentes[n].Panel);
    //ListaComponentes[n].Btn3.Left:=ListaComponentes[n].Btn1.Width;
    ListaComponentes[n].Btn3.Top:=ListaComponentes[n].lnumerodia.Height + ListaComponentes[n].Btn1.Height;
    ListaComponentes[n].Btn3.Width:=(ListaComponentes[n].panel.Width div 2);
    ListaComponentes[n].Btn3.Parent := ListaComponentes[n].Panel;
    ListaComponentes[n].Btn3.color := reg.Parrillas[3].Color;
    ListaComponentes[n].Btn3.Hint := reg.Parrillas[3].Codigo+'|'+IntToStr(reg.Dia)+'/'+IntToStr(reg.Mes)+'/'+IntToStr(Reg.Anio)+'|3';
    ListaComponentes[n].Btn3.ParentBackground:=False;
    ListaComponentes[n].Btn3.Caption:='3';
    ListaComponentes[n].Btn3.Font.Size:=12;
    ListaComponentes[n].Btn3.Font.Color:=clWhite;
    ListaComponentes[n].Btn3.OnClick := HacerClick;
    ListaComponentes[n].Btn3.Font.Size:=15;


    ListaComponentes[n].Btn4 := TPanel.Create(ListaComponentes[n].Panel);
    ListaComponentes[n].Btn4.Left:=ListaComponentes[n].Btn3.Width;
    ListaComponentes[n].Btn4.Top:=ListaComponentes[n].lnumerodia.Height + ListaComponentes[n].Btn1.Height;
    ListaComponentes[n].Btn4.Width:=(ListaComponentes[n].panel.Width div 2);
    ListaComponentes[n].Btn4.Parent := ListaComponentes[n].Panel;
    ListaComponentes[n].Btn4.color := reg.Parrillas[4].Color;
    ListaComponentes[n].Btn4.Hint := reg.Parrillas[4].Codigo+'|'+IntToStr(reg.Dia)+'/'+IntToStr(reg.Mes)+'/'+IntToStr(Reg.Anio)+'|4';
    ListaComponentes[n].Btn4.ParentBackground:=False;
    ListaComponentes[n].Btn4.Caption:='4';
    ListaComponentes[n].Btn4.Font.Size:=12;
    ListaComponentes[n].Btn4.Font.Color:=clWhite;
    ListaComponentes[n].Btn4.OnClick := HacerClick;
    ListaComponentes[n].Btn4.Font.Size:=15;



    if (c=7) then
    begin
      //  ptop := 10;
      //  pleft := 15;
      pleft:=InicioLeft;
      ptop:=ptop+Alto+ Espacio ;
      c:=0;
    end;

end;

constructor CCalendario.Crear(_Padre: TComponent; _PadrePrincipal: TWinControl);
begin
  Inicializar;
end;

procedure CCalendario.EliminarComponentes;
var
i:Integer;
begin
  for i := 1 to n do
  begin
    ListaComponentes[i].Panel.Destroy;
  end;
  Inicializar;
end;

procedure CCalendario.HacerClick(Sender: TObject);
begin
(*
  with  (Sender as TPanel) do
  begin
    FAgregarEvento.Dato:=Hint;
    FAgregarEvento.ShowModal;
  end;

  EliminarComponentes;
  *)
end;

procedure CCalendario.Inicializar;
begin
  ptop := InicioTop;
  pleft := InicioLeft;
  n:=0;
  c:=0;
end;

end.
