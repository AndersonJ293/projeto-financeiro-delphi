unit ProjetoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProjetoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, ProjetoFinanceiro.Model.Usuarios, Vcl.WinXCtrls,
  ProjetoFinanceiro.Util.GeradorId, Vcl.Menus;

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
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure menuLimparSenhaClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
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
  DmUsuarios.CdsUsuarios.Edit;

  LblTitulo.Caption := 'Editar Usuário';
  EditNome.Text := DmUsuarios.CdsUsuariosNome.AsString;
  EditLogin.Text := DmUsuarios.CdsUsuariosLogin.AsString;

  if DmUsuarios.CdsUsuariosStatus.AsString = 'A' then
  TglStatus.State := tssOn
  else
  TglStatus.State := tssOff


end;

procedure TFormUsuarios.ButtonCancelarClick(Sender: TObject);
begin
  DmUsuarios.CdsUsuarios.Cancel;
  inherited;
end;

procedure TFormUsuarios.ButtonExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta',
                                    MB_YESNO + MB_ICONQUESTION) <> mrYes
  then exit;

  try
     DmUsuarios.CdsUsuarios.Delete;
     DmUsuarios.CdsUsuarios.ApplyUpdates(0);
     Application.MessageBox('Registro excluído com sucesso!', 'Aviso',
                                   MB_OK + MB_ICONINFORMATION);
  except on E : Exception do
     Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir o registro',
                                                  MB_OK + MB_ICONERROR);
  end;

end;

procedure TFormUsuarios.ButtonIncluirClick(Sender: TObject);
begin
  inherited;
  LblTitulo.Caption := 'Adicionar Usuário';
  LimparCampos;
  DmUsuarios.CdsUsuarios.Insert;
end;

procedure TFormUsuarios.ButtonPesquisarClick(Sender: TObject);
begin
  inherited;
  DmUsuarios.CdsUsuarios.Close;
  DmUsuarios.CdsUsuarios.CommandText := 'Select * from usuarios';
  DmUsuarios.CdsUsuarios.Open;
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

procedure TFormUsuarios.LimparCampos;
var Contador : integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
    begin
      if Components[Contador] is TCustomEdit then
         TCustomEdit(Components[Contador]).Clear
      else if Components[Contador] is TToggleSwitch then
         TToggleSwitch(Components[Contador]).State := tssON
    end;

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

end.
