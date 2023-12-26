unit ProjetoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPanels, System.ImageList, Vcl.ImgList;

type
  TFormCadastroPadrao = class(TForm)
    PnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    PnlPesquisa: TPanel;
    PnlPesquisaBotoes: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    EditPesquisar: TEdit;
    Label1: TLabel;
    ButtonPesquisar: TButton;
    ImageList1: TImageList;
    ButtonFechar: TButton;
    ButtonAlterar: TButton;
    ButtonIncluir: TButton;
    ButtonExcluir: TButton;
    ButtonImprimir: TButton;
    Panel1: TPanel;
    ButtonCancelar: TButton;
    ButtonSalvar: TButton;
    DataSource1: TDataSource;
    procedure ButtonIncluirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonFecharClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes;
    procedure LimparCampos;
  public
    { Public declarations }
  protected
    { Protected declarations }
    procedure Pesquisar; virtual;
  end;

var
  FormCadastroPadrao: TFormCadastroPadrao;

implementation

uses
  Datasnap.DBClient, Vcl.WinXCtrls;

{$R *.dfm}

procedure TFormCadastroPadrao.ButtonAlterarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Edit;
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TFormCadastroPadrao.ButtonCancelarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Cancel;
  PnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TFormCadastroPadrao.ButtonExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta',
       MB_YESNO + MB_ICONQUESTION) <> mrYes
  then exit;

  try
     TClientDataSet(DataSource1.DataSet).Delete;
     TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
     Application.MessageBox('Registro excluído com sucesso!', 'Aviso',
       MB_OK + MB_ICONINFORMATION);
     Pesquisar;
  except on E : Exception do
     Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir o registro',
       MB_OK + MB_ICONERROR);
  end;
end;

procedure TFormCadastroPadrao.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroPadrao.ButtonIncluirClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardCadastro;
  LimparCampos;
  TClientDataSet(DataSource1.DataSet).Insert;
end;

procedure TFormCadastroPadrao.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFormCadastroPadrao.ButtonSalvarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Post;
  TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
  Application.MessageBox('Registro salvo com sucesso!', 'Aviso',
                                   MB_OK + MB_ICONINFORMATION);
  Pesquisar;
  PnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TFormCadastroPadrao.FormShow(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardPesquisa;
  Pesquisar;
end;

procedure TFormCadastroPadrao.HabilitarBotoes;
begin
  ButtonExcluir.Enabled := not DataSource1.DataSet.IsEmpty;
  ButtonAlterar.Enabled := not DataSource1.DataSet.IsEmpty;
end;

procedure TFormCadastroPadrao.LimparCampos;
var Contador : integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
    begin
      if Components[Contador] is TCustomEdit then
         TCustomEdit(Components[Contador]).Clear
      else if Components[Contador] is TToggleSwitch then
         TToggleSwitch(Components[Contador]).State := tssON
      else if Components[Contador] is TRadioGroup then
         TRadioGroup(Components[Contador]).ItemIndex := -1;
    end;
end;

procedure TFormCadastroPadrao.Pesquisar;
begin
  HabilitarBotoes;
end;

end.
