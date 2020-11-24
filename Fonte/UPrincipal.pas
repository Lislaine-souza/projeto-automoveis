unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ListBox, Data.DB, MemDS, DBAccess, Uni, FMX.Layouts,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, System.Rtti,
  FMX.Grid.Style, FMX.Grid, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Menus, System.Actions, FMX.ActnList;

type
  TFPrincipal = class(TForm)
    penMenu: TPanel;
    MainMenu1: TMainMenu;
    Usuarios: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}

uses UModulo, USplash, ULogin, UUsuario;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  penMenu.Visible := false;
  Modulo := TModulo.Create(nil);
  FSplash := TFSplash.Create(nil);
  FSplash.ShowModal;
  FLogin := TFLogin.Create(nil);
  FLogin.ShowModal;

end;

procedure TFPrincipal.UsuariosClick(Sender: TObject);
begin
  FUsuario := TFUsuario.Create(nil);
  FUsuario.ShowModal;
end;

end.
