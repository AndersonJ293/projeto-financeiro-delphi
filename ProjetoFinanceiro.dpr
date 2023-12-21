program ProjetoFinanceiro;

uses
  Vcl.Forms,
  ProjetoFinanceiro.View.Principal in 'src\View\ProjetoFinanceiro.View.Principal.pas' {FormPrincipal},
  ProjetoFinanceiro.View.CadastroPadrao in 'src\View\ProjetoFinanceiro.View.CadastroPadrao.pas' {FormCadastroPadrao},
  ProjetoFinanceiro.View.Splash in 'src\View\ProjetoFinanceiro.View.Splash.pas' {FormSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadastroPadrao, FormCadastroPadrao);
  Application.Run;
end.
