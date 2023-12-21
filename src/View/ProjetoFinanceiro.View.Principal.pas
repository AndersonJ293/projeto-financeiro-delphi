unit ProjetoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Relatórios: TMenuItem;
    MenuAjuda: TMenuItem;
    CadastroPadrao: TMenuItem;
    procedure CadastroPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TFormPrincipal.CadastroPadraoClick(Sender: TObject);
begin
  FormCadastroPadrao.Show;
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
