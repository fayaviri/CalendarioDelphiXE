unit UFApersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  StdCtrls, DBCtrls, Mask, Buttons, pngimage, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFApersona = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    JvDBDateTimePicker1: TJvDBDateTimePicker;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    dspropietario: TDataSource;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Image1: TImage;
    QPropietario: TZQuery;
    QPropietariopk_persona: TIntegerField;
    QPropietarionombre: TWideStringField;
    QPropietarioci: TWideStringField;
    QPropietariosexo: TWideStringField;
    QPropietariofechanac: TDateField;
    QPropietarioestadocivil: TWideStringField;
    QPropietariodireccion: TWideStringField;
    QPropietariorelacion: TWideStringField;
    QPropietarioactivo: TWideStringField;
    QPropietariofk_persona: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    op:string;
    pk_propietario,
    nombre:string;
    procedure listarpropietario(pk_propietario:string);
  end;

var
  FApersona: TFApersona;

implementation

{$R *.dfm}

procedure TFApersona.listarpropietario(pk_propietario:string);
begin
  with QPropietario do
  begin
    SQL.Text:='select * from persona where pk_persona ='+pk_propietario;
    Open;
    Active:=True;
  end;
end;
procedure TFApersona.BitBtn1Click(Sender: TObject);
begin
  try
    with dspropietario.DataSet do
    begin
    Post;
    pk_propietario:=FieldByName('pk_persona').AsString;
    nombre:=FieldByName('nombre').AsString;
    end;
    close;
  except

  end;
end;

procedure TFApersona.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFApersona.FormShow(Sender: TObject);
begin
  if op='nuevo' then
  begin
     dspropietario.DataSet.Insert;
     DBEdit1.SetFocus;
  end
  else
  dspropietario.DataSet.Edit;
end;

end.
