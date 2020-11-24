unit UCadastroMarca;

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
  TFCadastroMarca = class(TForm)
    btnVoltar: TButton;
    btnSalvar: TButton;
    Labusuários: TLabel;
    SQLCadastro: TUniQuery;
    SQLCadastroCOD_MARCA: TIntegerField;
    SQLCadastroDESCRICAO: TStringField;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    SQLMax: TUniQuery;
    SQLMaxULTIMO_COD: TIntegerField;
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
  FCadastroMarca: TFCadastroMarca;

implementation

{$R *.fmx}

uses UMarca;

procedure TFCadastroMarca.btnSalvarClick(Sender: TObject);
begin
  SQLCadastro.Post;
  MessageDlg('Salvo com sucesso!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  Close;
  FMarca.btnCarregarClick(nil);
end;

procedure TFCadastroMarca.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroMarca.proEditar(Codigo: integer);
begin
  SQLCadastro.Close;
  SQLCadastro.ParamByName('COD').AsInteger := Codigo;
  SQLCadastro.Open;
  SQLCadastro.Edit;
end;

procedure TFCadastroMarca.proNovo;
begin
  SQLCadastro.Close;
  SQLCadastro.Open;
  SQLCadastro.append;

  // gera novo codigo
  SQLMax.Close;
  SQLMax.Open;
  SQLCadastroCOD_MARCA.AsInteger := SQLMaxULTIMO_COD.AsInteger + 1;

end;

end.
