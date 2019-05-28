unit UmodBuscarPropiedadPropietario;

interface

uses
  SysUtils, Classes,umodconexion, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TDMBuscarPropiedaPropiedad = class(TDataModule)
    QBuscarpersona: TZQuery;
    Qmanzano: TZQuery;
    QPropiedad: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscar(dato:string);
    procedure buscarporpropiedad(pk_propiedad:string);
    procedure cargarmanzano(pk_condominio:string);
    procedure cargarpropiedaddes(pk_manzano:string);
    
  end;

var
  DMBuscarPropiedaPropiedad: TDMBuscarPropiedaPropiedad;

implementation

{$R *.dfm}


procedure TDMBuscarPropiedaPropiedad.buscar(dato: string);
begin
  with QBuscarpersona do
  begin
    SQL.Text:=''+
    ' select '+
    ' contrato.pk_contrato, '+
    ' nombredueno(contrato.pk_contrato) as propietario, '+
    ' propiedad.codigo '+
    ' from contrato inner join propiedad on contrato.fk_propiedad=propiedad.pk_propiedad '+
    ' where '+
    ' concat(nombredueno(contrato.pk_contrato)," ",propiedad.codigo) like "%'+dato+'%"  limit 50 ';
    Open;
    Active:=True;
  end;
end;



procedure TDMBuscarPropiedaPropiedad.buscarporpropiedad(pk_propiedad: string);
begin
  with QBuscarpersona do
  begin
    SQL.Text:=''+
        ' select    '+
        ' contrato.pk_contrato, '+
        ' nombredueno(contrato.pk_contrato) as propietario, '+
        ' propiedad.codigo                      '+
        ' from contrato inner join propiedad on contrato.fk_propiedad=propiedad.pk_propiedad '+
        ' where '+
        ' contrato.fk_propiedad='+pk_propiedad;
    Open;
    Active:=True;

  end;
end;

procedure TDMBuscarPropiedaPropiedad.cargarmanzano(pk_condominio:string);
begin
  with Qmanzano do
  begin
    SQL.Text:=''+
' select '+
' pk_manzano, '+
' codigo         '+
' from manzano      '+
' where fk_condominio='+pk_condominio;

    open;
    active:=true;
  end;
end;

procedure TDMBuscarPropiedaPropiedad.cargarpropiedaddes(pk_manzano: string);
begin
  with QPropiedad do
  begin
    SQL.Text:=''+
    'select pk_propiedad,codigo from propiedad where fk_manzano='+pk_manzano;
    open;
    Active:=True;
  end;
end;




end.
