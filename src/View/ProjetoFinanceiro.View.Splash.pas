unit ProjetoFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFormSplash = class(TForm)
    PnlPrincipal: TPanel;
    ImgLogo: TImage;
    LblStatus: TLabel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    TimerSplash: TTimer;
    procedure TimerSplashTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.dfm}

procedure TFormSplash.TimerSplashTimer(Sender: TObject);
begin

  if ProgressBar1.Position <= 100 then
    begin
      ProgressBar1.StepIt;
      case ProgressBar1.Position of
        10: LblStatus.Caption := 'Carregando depedências';
        25: LblStatus.Caption := 'Conectando ao banco de dados...';
        45: LblStatus.Caption := 'Carregando as configurações...';
        75: LblStatus.Caption := 'Iniciando o sistema...';
      end;
    end;

  if ProgressBar1.Position = 100 then
    Close;

end;

end.
