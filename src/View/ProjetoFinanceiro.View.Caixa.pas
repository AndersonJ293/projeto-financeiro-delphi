unit ProjetoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList,
  ProjetoFinanceiro.View.CadastroPadrao, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls,
  ProjetoFinanceiro.Model.Caixa;

type
  TFormCaixa = class(TFormCadastroPadrao)
    LblTitulo: TLabel;
    PnlNumDocumento: TPanel;
    LblNumDocumento: TLabel;
    Panel3: TPanel;
    Shape4: TShape;
    PnlDescricao: TPanel;
    LblDescricao: TLabel;
    Panel8: TPanel;
    Shape3: TShape;
    EditDescricao: TEdit;
    EditNumDocumento: TEdit;
    PnlValor: TPanel;
    LblValor: TLabel;
    Panel4: TPanel;
    Shape1: TShape;
    EditValor: TEdit;
    RadioTipo: TRadioGroup;
    PnlRadio: TPanel;
    PnlEdits: TPanel;
    CbTipo: TComboBox;
    Label2: TLabel;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  FormCaixa: TFormCaixa;

implementation

uses
  ProjetoFinanceiro.Util.Pesquisa, ProjetoFinanceiro.Util.GeradorId;

{$R *.dfm}

{ TFormCadastroPadrao1 }

procedure TFormCaixa.ButtonAlterarClick(Sender: TObject);
begin
  inherited;
  LblTitulo.Caption := 'Editar Caixa';
  EditNumDocumento.Text := DmCaixa.CdsCaixaNumero_Doc.AsString;
  EditValor.Text := DmCaixa.CdsCaixaValor.AsString;
  EditDescricao.Text := DmCaixa.CdsCaixaDescricao.AsString;

  if DmCaixa.CdsCaixaTipo.AsString = 'R' then
    RadioTipo.ItemIndex := 0
  else
    RadioTipo.ItemIndex := 1;
end;

procedure TFormCaixa.ButtonSalvarClick(Sender: TObject);
var
  LTipo: string;
begin
  if Trim(EditNumDocumento.Text) = '' then
  begin
    EditNumDocumento.SetFocus;
    Application.MessageBox('O campo número documento não pode ser vazio.',
     'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(EditValor.Text) = '' then
  begin
    EditValor.SetFocus;
    Application.MessageBox('O campo valor não pode ser vazio.',
     'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if RadioTipo.ItemIndex = -1 then
  begin
    RadioTipo.SetFocus;
    Application.MessageBox('Selecione um tipo de lançamento.',
     'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  LTipo := 'R';
  if RadioTipo.ItemIndex = 1 then
    LTipo := 'D';

  if DataSource1.State in [dsInsert] then
    begin
      DmCaixa.CdsCaixaID.AsString := TUtilitario.GetID;
      DmCaixa.CdsCaixaData_Cadastro.AsDateTime := now;
    end;

  DmCaixa.CdsCaixaNumero_Doc.AsString := Trim(EditNumDocumento.Text);
  DmCaixa.CdsCaixaDescricao.AsString := Trim(EditDescricao.Text);
  DmCaixa.CdsCaixaValor.AsCurrency := StrToFloat(EditValor.Text);
  DmCaixa.CdsCaixaTipo.AsString := LTipo;

  inherited;
end;

procedure TFormCaixa.Pesquisar;
var
  FiltroPesquisa : string;
  FiltroTipo : string;
begin
  case CbTipo.ItemIndex of
    1 : FiltroTipo := ' AND TIPO = ''R''';
    2 : FiltroTipo := ' AND TIPO = ''D''';
  end;
  FiltroPesquisa := TPesquisaUtil.LikeFind(EditPesquisar.Text, DBGrid1);
  DmCaixa.CdsCaixa.Close;
  DmCaixa.CdsCaixa.CommandText := 'Select * from caixa where 1 = 1' +
    FiltroPesquisa + FiltroTipo;
  DmCaixa.CdsCaixa.Open;
  inherited;
end;
end.
