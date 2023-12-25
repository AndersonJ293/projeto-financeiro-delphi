unit ProjetoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, ProjetoFinanceiro.Model.Usuarios,
  ProjetoFinanceiro.Model.Sistema;

type
  TFormLogin = class(TForm)
    PnlEsquerda: TPanel;
    ImgLogin: TImage;
    PnlPrincipal: TPanel;
    PnlTitulo: TPanel;
    PnlForm: TPanel;
    LblTitulo: TLabel;
    Label1: TLabel;
    Panel5: TPanel;
    LblUsuario: TLabel;
    Panel3: TPanel;
    Shape4: TShape;
    EditUsuario: TEdit;
    Panel1: TPanel;
    LblSenha: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    EditSenha: TEdit;
    Panel4: TPanel;
    Shape2: TShape;
    LblButton: TLabel;
    procedure LblButtonMouseLeave(Sender: TObject);
    procedure LblButtonMouseEnter(Sender: TObject);
    procedure LblButtonClick(Sender: TObject);
    procedure EditSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation
{$R *.dfm}

procedure TFormLogin.EditSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
     LblButtonClick(Sender);
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  EditUsuario.Text := dmSistema.UsuarioUltimoAcesso;
end;

procedure TFormLogin.LblButtonClick(Sender: TObject);
begin
  if Trim(EditUsuario.Text) = '' then
    begin
      EditUsuario.SetFocus;
      Application.MessageBox('Informe o seu usuário.', 'Atenção',
                                      MB_OK + MB_ICONWARNING);
      Abort;
    end;
  if Trim(EditSenha.Text) = '' then
    begin
      EditSenha.SetFocus;
      Application.MessageBox('Informe a sua senha.', 'Atenção',
                                      MB_OK + MB_ICONWARNING);
      Abort;
    end;

  try
     DmUsuarios.EfetuarLogin(Trim(EditUsuario.Text),
                             Trim(EditSenha.Text));
     dmSistema.GravaDataUltimoAcesso(now);
     dmSistema.GravaUsuarioUltimoAcesso(DmUsuarios.GetUsuarioLogado.Login);
     ModalResult := mrok;
  except
    on Erro: Exception do
      begin
        Application.MessageBox(PwideChar(Erro.Message), 'Atenção',
                                      MB_OK + MB_ICONWARNING);
        EditUsuario.SetFocus;
      end;
  end;
end;

procedure TFormLogin.LblButtonMouseEnter(Sender: TObject);
begin
  Shape2.Brush.Color := $00238A00;
end;

procedure TFormLogin.LblButtonMouseLeave(Sender: TObject);
begin
  Shape2.Brush.Color := $00279D00;
end;

end.
