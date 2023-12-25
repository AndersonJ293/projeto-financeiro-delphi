unit ProjetoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Winapi.CommCtrl,
  ProjetoFinanceiro.View.Usuarios, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    MenuAjuda: TMenuItem;
    CadastroUsuario: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure CadastroUsuarioClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  ProjetoFinanceiro.View.CadastroPadrao,
  ProjetoFinanceiro.View.Splash, ProjetoFinanceiro.View.Login,
  ProjetoFinanceiro.Model.Usuarios,
  ProjetoFinanceiro.View.RedefinirSenha;

{$R *.dfm}

procedure TFormPrincipal.CadastroUsuarioClick(Sender: TObject);
begin
   FormUsuarios.Show;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FormSplash := TFormSplash.Create(nil);
  try
    FormSplash.ShowModal;
  finally
    FreeAndNil(FormSplash);
  end;

  FormLogin := TFormLogin.Create(nil);
  try
    FormLogin.ShowModal;
    if FormLogin.ModalResult <> mrOk then
       Application.Terminate;
  finally
    FreeAndNil(FormLogin);
  end;

  if DmUsuarios.GetUsuarioLogado.SenhaTemporaria then
    begin
      FormRedefinirSenha := TFormRedefinirSenha.Create(nil);
      try
        FormRedefinirSenha.Usuario := DmUsuarios.GetUsuarioLogado;
        FormRedefinirSenha.ShowModal;
        if FormRedefinirSenha.ModalResult <> mrOk then
          Application.Terminate;
      finally
        FreeAndNil(FormRedefinirSenha);
      end;
    end;

  StatusBar1.Panels.Items[1].Text := 'Usuario: ' + dmUsuarios.GetUsuarioLogado.Nome;
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
