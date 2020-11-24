unit UModulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  MySQLUniProvider, MemDS;

type
  TModulo = class(TDataModule)
    conexao: TUniConnection;
    Provider: TMySQLUniProvider;
    transacao: TUniTransaction;
    Procedimentos: TUniStoredProc;
    ConsultaOff: TUniSQL;
    tbUsuarios: TUniQuery;
    dsUsuarios: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo: TModulo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
