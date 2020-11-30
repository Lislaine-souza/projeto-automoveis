program Vendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  USplash in 'USplash.pas' {FSplash},
  ULogin in 'ULogin.pas' {FLogin},
  UModulo in 'UModulo.pas' {Modulo: TDataModule},
  UUsuario in 'UUsuario.pas' {FUsuario},
  UCadastro_usuario in 'UCadastro_usuario.pas' {FCadastro_usuario},
  UMarca in 'UMarca.pas' {FMarca},
  UCadastroMarca in 'UCadastroMarca.pas' {FCadastroMarca},
  UModelo in 'UModelo.pas' {FModelo},
  UCadastroModelo in 'UCadastroModelo.pas' {FCadastroModelo},
  UAutomoveis in 'UAutomoveis.pas' {FAutomoveis},
  UCadastroVeiculos in 'UCadastroVeiculos.pas' {FCadastroVeiculos};

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFAutomoveis, FAutomoveis);
  Application.CreateForm(TFCadastroVeiculos, FCadastroVeiculos);
  Application.Run;

end.
