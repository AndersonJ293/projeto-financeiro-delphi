unit ProjetoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPanels;

type
  TForm1 = class(TForm)
    PnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    Card1: TCard;
    PnlPesquisa: TPanel;
    PnlPesquisaBotoes: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
