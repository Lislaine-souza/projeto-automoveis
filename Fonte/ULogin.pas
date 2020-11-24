unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, Data.DB, MemDS, DBAccess, Uni,
  FMX.Layouts, FMX.ExtCtrls;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    lbTitulo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    btnEntrar: TButton;
    qAux: TUniQuery;
    ImageControl1: TImageControl;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.fmx}

uses UPrincipal;


procedure TFLogin.btnEntrarClick(Sender: TObject);
var
  Texto: String;
  Tentativas: Integer;
begin
  ModalResult:=-1;

  // Verifica o “usuário” Vazio
  If (edtUsuario.Text = '') Then
  Begin
    ShowMessage('"Usuário" Inválido!');
    edtUsuario.SetFocus; // Manda digitar novamente
    Exit;
  End;
  // Verifica “Senha” vazia
  If (edtSenha.Text = '') Then
  Begin
    ShowMessage('"Senha" Inválida!');
    edtSenha.SetFocus;
    // Sai da procedure
    Exit;
  End;

  // Montagem do texto da query (SQL – Consulta)
  Texto := ' SELECT * FROM usuarios ' + // String
  // QuotedStr coloca aspas duplas na string
    'WHERE usuario = ' + QuotedStr(edtUsuario.Text) + // String
    'AND senha = ' + QuotedStr(edtSenha.Text); // String

  { Verificar se existe o usuario e a senha no banco
    executando a consulta no banco pelo componente qAux
    Que retornará com valor maior que 0 se encontrar }

  qAux.Close; // Fecha a consulta
  qAux.SQL.Clear; // Limpa a Consulta
  qAux.SQL.ADD(Texto); // Joga a consulta (sql) na query
  qAux.Open; // Executa a consulta

  // Verifica se os dados estão corretos
  If qAux.Fields[0].AsInteger > 0 Then
  Begin
    ModalResult:=1;
    close;
    FPrincipal.penMenu.Visible:=true;
  End
  Else
  Begin
    // Não libera
    Inc(Tentativas); // Incrementa em 1 o valor da variável tentativas
    If Tentativas < 3 Then
    Begin
      ShowMessage(Format('Tentativa %d de 3', [Tentativas]));
      If edtUsuario.CanFocus then
        edtUsuario.SetFocus;
    End
    Else
    Begin

      // Esgotou as tentativas
      ShowMessage(Format('%dª tentativa de acesso', [Tentativas]) + #13 +
        // Nova linha
        'Restaure sua senha!');
    End;
  End;




end; // Final da Procedure

procedure TFLogin.FormCreate(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

end.
