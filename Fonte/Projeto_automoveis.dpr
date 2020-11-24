program Vendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  USplash in 'USplash.pas' {FSplash},
  ULogin in 'ULogin.pas' {FLogin},
  UModulo in 'UModulo.pas' {Modulo: TDataModule},
  UUsuario in 'UUsuario.pas' {FUsuario},
  UCadastro_usuario in 'UCadastro_usuario.pas' {FCadastro_usuario};

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;

end.
