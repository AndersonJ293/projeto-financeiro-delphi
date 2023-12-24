unit ProjetoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProjetoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, ProjetoFinanceiro.Model.Usuarios, Vcl.WinXCtrls;

type
  TFormUsuarios = class(TFormCadastroPadrao)
    DataSource1: TDataSource;
    Panel2: TPanel;
    Shape1: TShape;
    TglStatus: TToggleSwitch;
    Panel5: TPanel;
    Shape4: TShape;
    EditNome: TEdit;
    LblNome: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    LblSenha: TLabel;
    Panel6: TPanel;
    Shape2: TShape;
    EditSenha: TEdit;
    Panel7: TPanel;
    LblLogin: TLabel;
    Panel8: TPanel;
    Shape3: TShape;
    EditLogin: TEdit;
    Panel9: TPanel;
    LblStatus: TLabel;
    LblTitulo: TLabel;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation
{$R *.dfm}

procedure TFormUsuarios.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  DmUsuarios.CdsUsuarios.Edit;

  LblTitulo.Caption := 'Editar Usuário';
  EditNome.Text := DmUsuarios.CdsUsuariosNome.AsString;
  EditLogin.Text := DmUsuarios.CdsUsuariosLogin.AsString;
  EditSenha.Text := DmUsuarios.CdsUsuariosSenha.AsString;

  if DmUsuarios.CdsUsuariosStatus.AsString = 'A' then
  TglStatus.State := tssOn
  else
  TglStatus.State := tssOff


end;

procedure TFormUsuarios.ButtonIncluirClick(Sender: TObject);
begin
  inherited;
  DmUsuarios.CdsUsuarios.Insert;

  LblTitulo.Caption := 'Adicionar Usuário';
  EditNome.Text := '';
  EditLogin.Text := '';
  EditSenha.Text := '';
  TglStatus.State := tssOn
end;

procedure TFormUsuarios.ButtonPesquisarClick(Sender: TObject);
begin
  inherited;
  DmUsuarios.CdsUsuarios.Close;
  DmUsuarios.CdsUsuarios.CommandText := 'Select * from usuarios';
  DmUsuarios.CdsUsuarios.Open;
//  DmUsuarios.FDQuery1.SQL.Clear;
//  DmUsuarios.FDQuery1.SQL.Add('Select * from usuarios');
//  DmUsuarios.FDQuery1.Open;
end;

procedure TFormUsuarios.ButtonSalvarClick(Sender: TObject);
var LStatus : String;

begin
  if Trim(EditNome.Text) = '' then
  begin
    EditNome.SetFocus;
    Application.MessageBox('O campo nome não pode ser vazio.', 'Atenção',
                              MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(EditLogin.Text) = '' then
  begin
    EditNome.SetFocus;
    Application.MessageBox('O campo login não pode ser vazio.', 'Atenção',
                              MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(EditSenha.Text) = '' then
  begin
    EditNome.SetFocus;
    Application.MessageBox('O campo senha não pode ser vazio.', 'Atenção',
                              MB_OK + MB_ICONWARNING);
    abort;
  end;

  LStatus := 'A';

  if TglStatus.State = tssOff then
     LStatus := 'I';

  DmUsuarios.CdsUsuariosNome.AsString := Trim(EditNome.Text);
  DmUsuarios.CdsUsuariosLogin.AsString := Trim(EditLogin.Text);
  DmUsuarios.CdsUsuariosSenha.AsString := Trim(EditSenha.Text);
  DmUsuarios.CdsUsuariosStatus.AsString := LStatus;

  DmUsuarios.CdsUsuarios.Post;
  DmUsuarios.CdsUsuarios.ApplyUpdates(0);
  Application.MessageBox('Registro salvo com sucesso!', 'Aviso',
                                   MB_OK + MB_ICONINFORMATION);

  PnlPrincipal.ActiveCard := CardPesquisa;
  inherited;
end;

procedure TFormUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  PnlPrincipal.ActiveCard := CardPesquisa;
end;

end.
