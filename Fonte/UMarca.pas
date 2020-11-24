unit UMarca;

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
  TFMarca = class(TForm)
    btnIncluir: TButton;
    btnVoltar: TButton;
    Grid1: TGrid;
    btnCarregar: TButton;
    Labusuários: TLabel;
    btnExcluir: TButton;
    SQLListar: TUniQuery;
    SQLListarCOD_MARCA: TIntegerField;
    SQLListarDESCRICAO: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnEditar: TButton;
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
  FMarca: TFMarca;

implementation

{$R *.fmx}

uses UCadastroMarca;

procedure TFMarca.btnCarregarClick(Sender: TObject);
begin
  SQLListar.close;
  SQLListar.Open;
end;

procedure TFMarca.btnEditarClick(Sender: TObject);
begin
  FCadastroMarca := TFCadastroMarca.Create(nil);
  FCadastroMarca.Show;
  FCadastroMarca.proEditar(SQLListarCOD_MARCA.AsInteger);
end;

procedure TFMarca.btnExcluirClick(Sender: TObject);
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

procedure TFMarca.btnIncluirClick(Sender: TObject);
begin
  FCadastroMarca := TFCadastroMarca.Create(nil);
  FCadastroMarca.Show;
  FCadastroMarca.proNovo;
end;

procedure TFMarca.btnVoltarClick(Sender: TObject);
begin
  close;
end;

end.
