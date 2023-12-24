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
    procedure ButtonIncluirClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonFecharClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPadrao: TFormCadastroPadrao;

implementation

{$R *.dfm}

procedure TFormCadastroPadrao.ButtonAlterarClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TFormCadastroPadrao.ButtonCancelarClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TFormCadastroPadrao.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroPadrao.ButtonIncluirClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardCadastro;
end;
end.
