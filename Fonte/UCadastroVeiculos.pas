unit UCadastroVeiculos;

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
  TFCadastroVeiculos = class(TForm)
    Labveiculos: TLabel;
    SQLCadastro: TUniQuery;
    SQLMax: TUniQuery;
    SQLMaxULTIMO_COD: TIntegerField;
    edtCodUsuario: TEdit;
    LabNome: TLabel;
    LabanoFabrica: TLabel;
    edtNome: TEdit;
    edtAnoFabrica: TEdit;
    btnGravar: TButton;
    edtMarca: TEdit;
    LabMarca: TLabel;
    edtModelo: TEdit;
    LabModelo: TLabel;
    edtFoto: TEdit;
    LabFoto: TLabel;
    LabprecoTabela: TLabel;
    edtPrecoTabela: TEdit;
    LabNumero: TLabel;
    edtNumero: TEdit;
    LabprecoVenda: TLabel;
    edtPrecoVenda: TEdit;
    LabCodcli: TLabel;
    SQLCadastroCOD_VEICULO: TIntegerField;
    SQLCadastroNOME: TStringField;
    SQLCadastroNUMERO: TIntegerField;
    SQLCadastroANO_FABRICACAO: TDateField;
    SQLCadastroANO_MODELO: TDateField;
    SQLCadastroPRECO_TABELA: TFloatField;
    SQLCadastroPRECO_VENDA: TFloatField;
    SQLCadastroCOD_MARCA: TIntegerField;
    SQLCadastroCOD_MODELO: TIntegerField;
    SQLCadastroFOTO_VEICULO: TBlobField;
    Label1: TLabel;
    edtAnoModelo: TEdit;
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
  FCadastroVeiculos: TFCadastroVeiculos;

implementation

{$R *.fmx}

uses UMarca;

procedure TFCadastroVeiculos.btnSalvarClick(Sender: TObject);
begin
  SQLCadastro.Post;
  MessageDlg('Salvo com sucesso!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  Close;
  FMarca.btnCarregarClick(nil);
end;

procedure TFCadastroVeiculos.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroVeiculos.proEditar(Codigo: integer);
begin
  SQLCadastro.Close;
  SQLCadastro.ParamByName('COD').AsInteger := Codigo;
  SQLCadastro.Open;
  SQLCadastro.Edit;
end;

procedure TFCadastroVeiculos.proNovo;
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
