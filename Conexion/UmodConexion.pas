unit UmodConexion;

interface

uses
dialogs,
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB, ADODB, ZSqlMonitor,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBXMySQL, SqlExpr;

type
  TDMConexion = class(TDataModule)
    Conexion: TZConnection;
    ADOconexion: TADOConnection;
    QConexion: TZQuery;
    conexionContable: TADOConnection;
    CBasedebase: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    servidor:string;
    puerto:integer;
    usuario:string;
    contrasena:string;
    basedatos:string;


    cuenta_expensa:string;
    procedure abrircerrarconexio ;
    procedure mantenerconexion;
    procedure CargarCuentas;
    procedure ConectarAbasededtosAccses;
    procedure ConectarZeosConexion;
    procedure conectar;
    procedure ConexionConexion;
  end;

var
  DMConexion: TDMConexion;

implementation

//uses Umodmoneda;

{$R *.dfm}

procedure TDMConexion.abrircerrarconexio;
begin
(*
  Conexion.Connected:=False;
  Conexion.Connected:=True;
*)
end;

procedure TDMConexion.CargarCuentas;
begin
{
  with QCuentas do
  begin
    SQL.Text:='select * from cuenta';
    Open;
    active:=True;

    cuenta_expensa:=FieldByName('Expensa').AsString;
    Active:=False;
  end;
  }
end;


procedure TDMConexion.ConectarAbasededtosAccses;
var
dirdbvirtual:string;
begin
  dirdbvirtual:=ExtractFilePath(ExpandFileName('EgresoDiez.exe'))+'virtual.mdb';
  ADOconexion.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dirdbvirtual+'; Persist Security Info=False';//C:\Users\Ing. Philip\Documents\RAD Studio\Projects\Condominio SERV\Debug\Win32\virtual.mdb
  ADOconexion.Connected:=True;

  dirdbvirtual:=ExtractFilePath(ExpandFileName('Administracion.exe'))+'VirtualContable.mdb';
  conexionContable.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dirdbvirtual+'; Persist Security Info=False';//C:\Users\Ing. Philip\Documents\RAD Studio\Projects\Condominio SERV\Debug\Win32\virtual.mdb
  conexionContable.Connected:=True;
end;

procedure TDMConexion.ConectarZeosConexion;
begin
  try
    with Conexion do
    begin
      Connected:=False;
      HostName:=servidor;
      Port:=puerto;
      User:=usuario;
      Password:=contrasena;
      Database:=basedatos;
      Protocol:='mysql';
      Connected:=True;
    end;

  except
    ShowMessage('ERROR: Acceso denegado al servidor de Internet :) ');
  end;
end;

{Sistema de Gabriel}
procedure TDMConexion.ConexionConexion;
begin
  with CBasedebase do
  begin
        HostName:='localhost';
        Database:='sysconsu_basebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

      {

        HostName:='sysconsulcon.com';
        Database:='sysconsu_basebase';
        User:='sysconsu_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='consulco_basebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';


        HostName:='192.185.138.25';
        Database:='consulco_basebase';
        User:='consulco_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';



        HostName:='192.185.138.25';
        Database:='consulco_basebase';
        User:='consulco_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';


        HostName:='consulconcck.com';
        Database:='consulco_basebase';
        User:='consulco_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';


        HostName:='localhost';
        Database:='consulco_basebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='basedebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

        HostName:='consulconcck.com';
        Database:='consulco_basebase';
        User:='consulco_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='basedebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

        HostName:='casacondominio.com.bo';
        Database:='casacond_basebase';
        User:='casacond_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='condoserv.com.bo';
        Database:='condoser_basedebase';
        User:='condoser_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='basedebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

        HostName:='administradoracatel.com';
        Database:='administ_basebase';
        User:='administ_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='condoserv.com.bo';
        Database:='condoser_basedebase';
        User:='condoser_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='basedebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';

        HostName:='administradoracatel.com';
        Database:='administ_basebase';
        User:='administ_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='consulconcck.com';
        Database:='consulco_basebase';
        User:='consulco_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='administradoracatel.com';
        Database:='administ_basebase';
        User:='administ_admin';
        Password:='admin';
        Port:=0;
        Protocol:='mysql';

        HostName:='localhost';
        Database:='basedebase';
        User:='root';
        Password:='root';
        Port:=0;
        Protocol:='mysql';
      }
  end;
end;

procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin
//  ConectarAbasededtosAccses;
  ConexionConexion;
end;

procedure TDMConexion.conectar;
begin


  ADOconexion.Connected:=False;
//  Conexion.Connected:=False;
//  ConectarAbasededtosAccses;
  ConectarZeosConexion;
  CargarCuentas;       //lista las cuenta sprincipales
  //Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Users\Ing. Philip\Documents\RAD Studio\Projects\SISTEMA CONDOMINIO\Debug\Win32\virtual.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;
  //  localhost

  {programsa que deben iniciar}
  //DMMoneda.cargartipocambiomoneda;
end;

procedure TDMConexion.mantenerconexion;
begin
  with QConexion do
  begin
    Active:=False;
    SQL.Text:='select * from telefono';
    Open;
    Active:=True;
  end;
end;

(*

database: consulco_bdcondominio
hostname: shx2.guebs.com
password: =?iU8vd_e]
user: consulco_bdcondo

*)
end.





