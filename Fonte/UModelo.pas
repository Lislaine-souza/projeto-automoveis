unit UModelo;

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
  TFModelo = class(TForm)
    btnIncluir: TButton;
    btnVoltar: TButton;
    Grid1: TGrid;
    btnCarregar: TButton;
    Labusuários: TLabel;
    btnExcluir: TButton;
    btnEditar: TButton;
    SQLListar: TUniQuery;
    SQLListarCOD_MODELO: TIntegerField;
    SQLListarDESCRICAO: TStringField;
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
  FModelo: TFModelo;

implementation

{$R *.fmx}

uses UCadastroModelo, UModulo;

procedure TFModelo.btnCarregarClick(Sender: TObject);
begin
  SQLListar.close;
  SQLListar.Open;
end;

procedure TFModelo.btnEditarClick(Sender: TObject);
begin
  FCadastroModelo := TFCadastroModelo.Create(nil);
  FCadastroModelo.Show;
  FCadastroModelo.proEditar(SQLListarCOD_MODELO.AsInteger);
end;

procedure TFModelo.btnExcluirClick(Sender: TObject);
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

procedure TFModelo.btnIncluirClick(Sender: TObject);
begin
  FCadastroModelo := TFCadastroModelo.Create(nil);
  FCadastroModelo.Show;
  FCadastroModelo.proNovo;
end;

procedure TFModelo.btnVoltarClick(Sender: TObject);
begin
  close;
end;

end.
