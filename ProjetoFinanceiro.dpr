program ProjetoFinanceiro;

uses
  Vcl.Forms,
  ProjetoFinanceiro.View.Principal in 'src\View\ProjetoFinanceiro.View.Principal.pas' {FormPrincipal},
  ProjetoFinanceiro.View.CadastroPadrao in 'src\View\ProjetoFinanceiro.View.CadastroPadrao.pas' {FormCadastroPadrao},
  ProjetoFinanceiro.View.Splash in 'src\View\ProjetoFinanceiro.View.Splash.pas' {FormSplash},
  ProjetoFinanceiro.Model.Conexao in 'src\Model\ProjetoFinanceiro.Model.Conexao.pas' {DmConexao: TDataModule},
  ProjetoFinanceiro.View.Usuarios in 'src\View\ProjetoFinanceiro.View.Usuarios.pas' {FormUsuarios},
  ProjetoFinanceiro.Model.Usuarios in 'src\Model\ProjetoFinanceiro.Model.Usuarios.pas' {DmUsuarios: TDataModule},
  ProjetoFinanceiro.Util.GeradorId in 'src\Util\ProjetoFinanceiro.Util.GeradorId.pas',
  ProjetoFinanceiro.View.Login in 'src\View\ProjetoFinanceiro.View.Login.pas' {FormLogin},
  ProjetoFinanceiro.Model.Entidades.Usuario in 'src\Model\Entidades\ProjetoFinanceiro.Model.Entidades.Usuario.pas',
  ProjetoFinanceiro.Model.Sistema in 'src\Model\ProjetoFinanceiro.Model.Sistema.pas' {dmSistema: TDataModule},
  ProjetoFinanceiro.View.RedefinirSenha in 'src\View\ProjetoFinanceiro.View.RedefinirSenha.pas' {FormRedefinirSenha},
  ProjetoFinanceiro.Util.Pesquisa in 'src\Util\ProjetoFinanceiro.Util.Pesquisa.pas',
  ProjetoFinanceiro.Model.Caixa in 'src\Model\ProjetoFinanceiro.Model.Caixa.pas' {DmCaixa: TDataModule},
  ProjetoFinanceiro.View.Caixa in 'src\View\ProjetoFinanceiro.View.Caixa.pas' {FormCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmUsuarios, DmUsuarios);
  Application.CreateForm(TDmCaixa, DmCaixa);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadastroPadrao, FormCadastroPadrao);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.CreateForm(TdmSistema, dmSistema);
  Application.CreateForm(TFormCaixa, FormCaixa);
  Application.Run;
end.
