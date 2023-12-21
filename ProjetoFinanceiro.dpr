program ProjetoFinanceiro;

uses
  Vcl.Forms,
  ProjetoFinanceiro.View.Principal in 'src\View\ProjetoFinanceiro.View.Principal.pas' {FormPrincipal},
  ProjetoFinanceiro.View.CadastroPadrao in 'src\View\ProjetoFinanceiro.View.CadastroPadrao.pas' {PanelPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TPanelPrincipal, PanelPrincipal);
  Application.Run;
end.
