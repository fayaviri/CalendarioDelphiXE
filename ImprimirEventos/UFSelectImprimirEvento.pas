unit UFSelectImprimirEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons;

type
  TFSelectImprimirEvento = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pk_evento,pk_condominio:string;
  end;

var
  FSelectImprimirEvento: TFSelectImprimirEvento;

implementation

uses UFimprimirHoja1;

{$R *.dfm}

procedure TFSelectImprimirEvento.SpeedButton1Click(Sender: TObject);
begin
  RVFImprimirHoja1.Imprimir(pk_evento, pk_condominio);
end;

end.
