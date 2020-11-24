unit UUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Uni, Data.DB, MemDS, DBAccess,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Controls.Presentation;

type
  TFUsuario = class(TForm)
    btnIncluir: TButton;
    btnVoltar: TButton;
    Grid1: TGrid;
    btnCarregar: TButton;
    Labusuários: TLabel;
    btnExcluir: TButton;
    SQLusuario: TUniQuery;
    UniTable1: TUniTable;
    BindingsList1: TBindingsList;
    SQLusuariousuario_id: TIntegerField;
    SQLusuarionome: TStringField;
    SQLusuariosobrenome: TStringField;
    SQLusuarioemail: TStringField;
    SQLusuariousuario: TStringField;
    SQLusuariosenha: TStringField;
    SQLusuarioinfo: TMemoField;
    SQLusuarionivel_usuario: TStringField;
    SQLusuariodta_cadastro: TDateTimeField;
    SQLusuariodta_ultimo_login: TDateTimeField;
    SQLusuarioativado: TStringField;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnCarregarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuario: TFUsuario;

implementation

{$R *.fmx}

uses UModulo, UCadastro_usuario, UPrincipal;

procedure TFUsuario.btnCarregarClick(Sender: TObject);
begin
  SQLusuario.Close;
  SQLusuario.Open;

end;

procedure TFUsuario.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    SQLusuario.Delete;
    MessageDlg('Registro foi deletado com sucesso!', TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbOK], 0);
    SQLusuario.Close;
    SQLusuario.Open;

  end;
end;

procedure TFUsuario.btnIncluirClick(Sender: TObject);
begin
  FCadastro_usuario := TFCadastro_usuario.Create(nil);
  FCadastro_usuario.Show;
  FCadastro_usuario.proNovo;
end;

end.
