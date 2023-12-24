program ProjetoFinanceiro;

uses
  Vcl.Forms,
  ProjetoFinanceiro.View.Principal in 'src\View\ProjetoFinanceiro.View.Principal.pas' {FormPrincipal},
  ProjetoFinanceiro.View.CadastroPadrao in 'src\View\ProjetoFinanceiro.View.CadastroPadrao.pas' {FormCadastroPadrao},
  ProjetoFinanceiro.View.Splash in 'src\View\ProjetoFinanceiro.View.Splash.pas' {FormSplash},
  ProjetoFinanceiro.Model.Conexao in 'src\Model\ProjetoFinanceiro.Model.Conexao.pas' {DmConexao: TDataModule},
  ProjetoFinanceiro.View.Usuarios in 'src\View\ProjetoFinanceiro.View.Usuarios.pas' {FormUsuarios},
  ProjetoFinanceiro.Model.Usuarios in 'src\Model\ProjetoFinanceiro.Model.Usuarios.pas' {DmUsuarios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadastroPadrao, FormCadastroPadrao);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.CreateForm(TDmUsuarios, DmUsuarios);
  Application.Run;
end.
