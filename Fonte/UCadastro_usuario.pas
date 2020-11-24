unit UCadastro_usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, MemDS, DBAccess, Uni;

type
  TFCadastro_usuario = class(TForm)
    edtCodUsuario: TEdit;
    LabCodcli: TLabel;
    LabNome: TLabel;
    LabEmail: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    btnGravar: TButton;
    edtSobrenome: TEdit;
    LabSobrenome: TLabel;
    edtUsuario: TEdit;
    LabUsuario: TLabel;
    edtSenha: TEdit;
    LabSenha: TLabel;
    LabDataCadastro: TLabel;
    edtDataCadastro: TEdit;
    LabNivelUsuario: TLabel;
    edtNivel: TEdit;
    LabAtivado: TLabel;
    edtAtivo: TEdit;
    LabUltimoLogin: TLabel;
    edtUltimoLogin: TEdit;
    LabInfo: TLabel;
    edtInfo: TEdit;
    LabCadastro_usuario: TLabel;
    SQLCadastro_usuario: TUniQuery;
    SQLCadastro_usuariousuario_id: TIntegerField;
    SQLCadastro_usuarionome: TStringField;
    SQLCadastro_usuariosobrenome: TStringField;
    SQLCadastro_usuarioemail: TStringField;
    SQLCadastro_usuariousuario: TStringField;
    SQLCadastro_usuariosenha: TStringField;
    SQLCadastro_usuarioinfo: TMemoField;
    SQLCadastro_usuarionivel_usuario: TStringField;
    SQLCadastro_usuariodta_cadastro: TDateTimeField;
    SQLCadastro_usuariodta_ultimo_login: TDateTimeField;
    SQLCadastro_usuarioativado: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    SQLmax: TUniQuery;
    SQLmaxUSUARIO_ID: TIntegerField;
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure proNovo;
  end;

var
  FCadastro_usuario: TFCadastro_usuario;

implementation

{$R *.fmx}

uses UModulo, UUsuario;

{ TFCadastro_usuario }

procedure TFCadastro_usuario.btnGravarClick(Sender: TObject);
begin
//  SQLmax.close;
//  SQLmax.Open;
//  SQLCadastro_usuariousuario_id.AsInteger := SQLmaxUSUARIO_ID.AsInteger +1;
  SQLCadastro_usuario.Post;
  MessageDlg('Usuário gravado com sucesso!', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
  close;
  FUsuario.btnCarregarClick(nil);
end;

procedure TFCadastro_usuario.proNovo;
begin
   SQLCadastro_usuario.Close;
   SQLCadastro_usuario.Open;
   SQLCadastro_usuario.Append;
   edtNome.SetFocus;
   SQLCadastro_usuariousuario_id.AsInteger := 0;
end;

end.
