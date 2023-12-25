unit ProjetoFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  ProjetoFinanceiro.Model.Entidades.Usuario, ProjetoFinanceiro.Model.Usuarios;

type
  TFormRedefinirSenha = class(TForm)
    PnlPrincipal: TPanel;
    PnlTitulo: TPanel;
    PnlEdits: TPanel;
    PnlConfirmarSenha: TPanel;
    LblConfirmarSenha: TLabel;
    PnlEditConfirmarSenha: TPanel;
    Shape1: TShape;
    EditConfirmarSenha: TEdit;
    PnlNovaSenha: TPanel;
    LblNovaSenha: TLabel;
    PnlEditNovaSenha: TPanel;
    Shape2: TShape;
    EditNovaSenha: TEdit;
    PnlBotao: TPanel;
    Shape3: TShape;
    LblButton: TLabel;
    LblSubtitulo: TLabel;
    LblUsuario: TLabel;
    PnlBotaoFechar: TPanel;
    Shape4: TShape;
    LblFechar: TLabel;
    PnlBotoes: TPanel;
    procedure FormShow(Sender: TObject);
    procedure LblButtonClick(Sender: TObject);
    procedure EditConfirmarSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LblFecharClick(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    { Public declarations }
    property Usuario : TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  FormRedefinirSenha: TFormRedefinirSenha;

implementation
uses
  BCrypt;
{$R *.dfm}

procedure TFormRedefinirSenha.EditConfirmarSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    LblButtonClick(Sender);
end;

procedure TFormRedefinirSenha.FormShow(Sender: TObject);
begin
  LblUsuario.Caption := FUsuario.Nome;
  EditNovaSenha.SetFocus;
end;

procedure TFormRedefinirSenha.LblButtonClick(Sender: TObject);
begin
  EditNovaSenha.Text := Trim(EditNovaSenha.Text);
  EditConfirmarSenha.Text := Trim(EditConfirmarSenha.Text);

  if EditNovaSenha.Text = '' then
    begin
    EditNovaSenha.SetFocus;
      Application.MessageBox('Informe a sua nova senha.', 'Atenção',
        MB_OK + MB_ICONWARNING);
      abort;
    end;

  if EditConfirmarSenha.Text = '' then
    begin
      EditConfirmarSenha.SetFocus;
      Application.MessageBox('Confirme a sua nova senha.', 'Atenção',
        MB_OK + MB_ICONWARNING);
      abort;
    end;

  if EditNovaSenha.Text <> EditConfirmarSenha.Text then
    begin
      EditConfirmarSenha.SetFocus;
      Application.MessageBox('Confirmação diferente da nova senha.',
       'Atenção', MB_OK + MB_ICONWARNING);
      abort;
    end;
  
  FUsuario.Senha := EditNovaSenha.Text;
  DmUsuarios.RedefinirSenha(Usuario);
  Application.MessageBox('Senha alterada com sucesso.',
       'Sucesso', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TFormRedefinirSenha.LblFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormRedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
