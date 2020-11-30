unit UAutomoveis;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.DB, MemDS, DBAccess, Uni, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFAutomoveis = class(TForm)
    btnIncluir: TButton;
    btnVoltar: TButton;
    Grid1: TGrid;
    btnCarregar: TButton;
    Labautomoveis: TLabel;
    btnExcluir: TButton;
    SQLListar: TUniQuery;
    btnEditar: TButton;
    SQLListarCOD_VEICULO: TIntegerField;
    SQLListarNOME: TStringField;
    SQLListarNUMERO: TIntegerField;
    SQLListarANO_FABRICACAO: TDateField;
    SQLListarANO_MODELO: TDateField;
    SQLListarPRECO_TABELA: TFloatField;
    SQLListarPRECO_VENDA: TFloatField;
    SQLListarCOD_MARCA: TIntegerField;
    SQLListarCOD_MODELO: TIntegerField;
    SQLListarFOTO_VEICULO: TBlobField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnCarregarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAutomoveis: TFAutomoveis;

implementation

{$R *.fmx}

uses UCadastroVeiculos;

procedure TFAutomoveis.btnCarregarClick(Sender: TObject);
begin
  SQLListar.close;
  SQLListar.Open;
end;

procedure TFAutomoveis.btnEditarClick(Sender: TObject);
begin
  FAutomoveis := TFAutomoveis.Create(nil);
  FAutomoveis.Show;
//  FAutomoveis.proEditar(SQLListarCOD_MARCA.AsInteger);
end;

procedure TFAutomoveis.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    SQLListar.Delete;
    MessageDlg('Registro foi deletado com sucesso!', TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbOK], 0);
    SQLListar.close;
    SQLListar.Open;
  end;
end;

procedure TFAutomoveis.btnIncluirClick(Sender: TObject);
begin
  FCadastroVeiculos := TFCadastroVeiculos.Create(nil);
  FCadastroVeiculos.Show;
//  FAutomoveis.proNovo;
end;

procedure TFAutomoveis.btnVoltarClick(Sender: TObject);
begin
  close;
end;

end.
