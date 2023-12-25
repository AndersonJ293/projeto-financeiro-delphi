unit ProjetoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProjetoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, ProjetoFinanceiro.Model.Usuarios, Vcl.WinXCtrls,
  ProjetoFinanceiro.Util.GeradorId, ProjetoFinanceiro.Util.Pesquisa, Vcl.Menus;

type
  TFormUsuarios = class(TFormCadastroPadrao)
    Panel2: TPanel;
    Shape1: TShape;
    TglStatus: TToggleSwitch;
    Panel5: TPanel;
    Shape4: TShape;
    EditNome: TEdit;
    LblNome: TLabel;
    Panel3: TPanel;
    Panel7: TPanel;
    LblLogin: TLabel;
    Panel8: TPanel;
    Shape3: TShape;
    EditLogin: TEdit;
    Panel9: TPanel;
    LblStatus: TLabel;
    LblTitulo: TLabel;
    PopupMenu1: TPopupMenu;
    menuLimparSenha: TMenuItem;
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure menuLimparSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  FormUsuarios: TFormUsuarios;

implementation
uses
  BCrypt;
{$R *.dfm}

procedure TFormUsuarios.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  LblTitulo.Caption := 'Editar Usuário';
  EditNome.Text := DmUsuarios.CdsUsuariosNome.AsString;
  EditLogin.Text := DmUsuarios.CdsUsuariosLogin.AsString;

  if DmUsuarios.CdsUsuariosStatus.AsString = 'A' then
  TglStatus.State := tssOn
  else
  TglStatus.State := tssOff
end;

procedure TFormUsuarios.ButtonIncluirClick(Sender: TObject);
begin
  inherited;
  LblTitulo.Caption := 'Adicionar Usuário';
end;

procedure TFormUsuarios.ButtonSalvarClick(Sender: TObject);
var
  LStatus : String;
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
    EditLogin.SetFocus;
    Application.MessageBox('O campo login não pode ser vazio.', 'Atenção',
                              MB_OK + MB_ICONWARNING);
    abort;
  end;

  if DmUsuarios.VerificaLoginCadastrado(Trim(EditLogin.Text),
  DmUsuarios.CdsUsuarios.FieldByName('ID').AsString) then
  begin
    EditLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado.',
     [EditLogin.Text])), 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  LStatus := 'A';

  if TglStatus.State = tssOff then
     LStatus := 'I';

  if DmUsuarios.CdsUsuarios.State in [dsInsert] then
  begin
    DmUsuarios.CdsUsuariosID.AsString := TUtilitario.GetID;
    DmUsuarios.CdsUsuariosData_Cadastro.AsDateTime := now;
    DmUsuarios.CdsUsuariosSenha.AsString := TBCrypt.GenerateHash(
      DmUsuarios.TEMP_PASSWORD);
    DmUsuarios.CdsUsuariosSenha_Temporaria.AsString := 'S';
  end;

  DmUsuarios.CdsUsuariosNome.AsString := Trim(EditNome.Text);
  DmUsuarios.CdsUsuariosLogin.AsString := Trim(EditLogin.Text);
  DmUsuarios.CdsUsuariosStatus.AsString := LStatus;
  inherited;
end;

procedure TFormUsuarios.menuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
    DmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWideChar(Format('Foi definida a senha padrão "123456" ' +
      'para o usuário "%s".', [DataSource1.DataSet.FieldByName('NOME').AsString])),
        'Atenção', MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TFormUsuarios.Pesquisar;
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TPesquisaUtil.LikeFind(EditPesquisar.Text, DBGrid1);
  DmUsuarios.CdsUsuarios.Close;
  DmUsuarios.CdsUsuarios.CommandText := 'Select * from usuarios' + FiltroPesquisa;
  DmUsuarios.CdsUsuarios.Open;
  inherited;
end;

end.
