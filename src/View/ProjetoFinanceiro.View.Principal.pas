unit ProjetoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Winapi.CommCtrl,
  ProjetoFinanceiro.View.Usuarios;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    MenuAjuda: TMenuItem;
    CadastroUsuario: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroUsuarioClick(Sender: TObject);
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
  ProjetoFinanceiro.View.Splash;

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

end;

end.
