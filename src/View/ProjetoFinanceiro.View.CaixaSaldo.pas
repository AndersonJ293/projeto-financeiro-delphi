unit ProjetoFinanceiro.View.CaixaSaldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.WinXPanels, Vcl.ComCtrls,
  ProjetoFinanceiro.Model.Entidades.CaixaResumo, ProjetoFinanceiro.Model.Caixa;

type
  TFormCaixaSaldo = class(TForm)
    PnlPrincipal: TPanel;
    PnlPesquisar: TPanel;
    PnlContent: TPanel;
    ButtonPesquisar: TButton;
    ImageList1: TImageList;
    DateInicial: TDateTimePicker;
    DateFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    Label3: TLabel;
    LblSaldoFinal: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    LblTotalParcial: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    LblTotalSaidas: TLabel;
    Panel4: TPanel;
    Label9: TLabel;
    LblTotalEntradas: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    LblSaldoInicial: TLabel;
    PnlLinha: TPanel;
    PnlLinha2: TPanel;
    procedure FormShow(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  FormCaixaSaldo: TFormCaixaSaldo;

implementation
uses
  System.DateUtils;
{$R *.dfm}

{ TFormCaixaSaldo }

procedure TFormCaixaSaldo.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFormCaixaSaldo.FormShow(Sender: TObject);
begin
  DateInicial.Date := IncDay(Now, -7);
  Pesquisar;
end;

procedure TFormCaixaSaldo.Pesquisar;
var
  ResumoCaixa: TModelResumoCaixa;
begin
  LblSaldoInicial.Caption := '';
  LblTotalEntradas.Caption := '';
  LblTotalSaidas.Caption := '';
  LblTotalParcial.Caption := '';
  LblSaldoFinal.Caption := '';

  ResumoCaixa := DmCaixa.ResumoCaixa(DateInicial.Date, DateFinal.Date);

  try
    LblSaldoInicial.Caption := 'R$ ' + FormatCurr('0.00', ResumoCaixa.SaldoInicial);
    LblTotalEntradas.Caption := 'R$ ' + FormatCurr('0.00', ResumoCaixa.TotalEntradas);
    LblTotalSaidas.Caption := 'R$ ' + FormatCurr('0.00', ResumoCaixa.TotalSaidas);
    LblTotalParcial.Caption := 'R$ ' + FormatCurr('0.00', ResumoCaixa.SaldoParcial);
    LblSaldoFinal.Caption := 'R$ ' + FormatCurr('0.00', ResumoCaixa.SaldoFinal);
  finally
    ResumoCaixa.Free;
  end;

end;

end.
