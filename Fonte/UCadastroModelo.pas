unit UCadastroModelo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.DB, MemDS, DBAccess, Uni, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Edit;

type
  TFCadastroModelo = class(TForm)
    btnVoltar: TButton;
    btnSalvar: TButton;
    Labusuários: TLabel;
    SQLCadastro: TUniQuery;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    SQLMax: TUniQuery;
    SQLMaxULTIMO_COD: TIntegerField;
    SQLCadastroCOD_MODELO: TIntegerField;
    SQLCadastroDESCRICAO: TStringField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure proNovo;
    procedure proEditar(Codigo: integer);
  end;

var
  FCadastroModelo: TFCadastroModelo;

implementation

{$R *.fmx}

uses UModelo;

procedure TFCadastroModelo.btnSalvarClick(Sender: TObject);
begin
  SQLCadastro.Post;
  MessageDlg('Salvo com sucesso!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  Close;
  FModelo.btnCarregarClick(nil);
end;

procedure TFCadastroModelo.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroModelo.proEditar(Codigo: integer);
begin
  SQLCadastro.Close;
  SQLCadastro.ParamByName('COD').AsInteger := Codigo;
  SQLCadastro.Open;
  SQLCadastro.Edit;
end;

procedure TFCadastroModelo.proNovo;
begin
  SQLCadastro.Close;
  SQLCadastro.Open;
  SQLCadastro.append;

  // gera novo codigo
  SQLMax.Close;
  SQLMax.Open;
  SQLCadastroCOD_MODELO.AsInteger := SQLMaxULTIMO_COD.AsInteger + 1;

end;

end.
