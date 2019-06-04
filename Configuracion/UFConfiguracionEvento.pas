unit UFConfiguracionEvento;

interface

uses
umodconexion,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Mask,
  DBCtrls, ExtCtrls;

type
  TFConfiguracionEvento = class(TForm)
    QSQL: TZQuery;
    QSQLid: TIntegerField;
    QSQLPrecioChurrasquera: TFloatField;
    QSQLPrecioSalon: TFloatField;
    QSQLPrecioSalonChurrasquera: TFloatField;
    QSQLMontoGarantia: TFloatField;
    QSQLNumeroCuenta: TFloatField;
    QSQLBanco: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguracionEvento: TFConfiguracionEvento;

implementation

{$R *.dfm}

procedure TFConfiguracionEvento.FormShow(Sender: TObject);
begin
  with QSQL do
  begin
    sql.Text:='SELECT * FROM configuracionevento;';
    Open;
    Active:=True;
  end;
end;

end.
