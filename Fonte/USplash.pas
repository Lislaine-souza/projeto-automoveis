unit USplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFSplash = class(TForm)
    Progresso: TProgressBar;
    Tempo: TTimer;
    Label2: TLabel;
    procedure TempoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

{$R *.fmx}
Uses ULogin;

procedure TFSplash.FormActivate(Sender: TObject);
begin
  Tempo.Enabled := True;
end;

procedure TFSplash.TempoTimer(Sender: TObject);
begin
  //verifica se chegou a 100
  if Progresso.Value = 100
            then Begin
                   //fecha o relogio
                   Tempo.Enabled := False;
                   //esconde a tela splash
                   FSplash.Hide;
                   //carrega a tela Login
//                   FLogin.ShowModal;
                   //Libera a tela principal
                   FSplash.ReleaseForm;
                   //Fecha a tela splash
                   FSplash.Close;
                 End;

         //Vai contando
         Progresso.Value := Progresso.Value + 1;
         //quantidade já percorrida
         Label2.Text := 'Aguarde. Carregando ... '
                        + Progresso.Value.ToString
                        + '%';
end;

end.
