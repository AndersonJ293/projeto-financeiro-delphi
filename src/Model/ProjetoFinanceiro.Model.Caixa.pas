unit ProjetoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ProjetoFinanceiro.Model.Conexao;

type
  TDmCaixa = class(TDataModule)
    SqlCaixa: TFDQuery;
    CdsCaixa: TClientDataSet;
    DspCaixa: TDataSetProvider;
    CdsCaixaID: TStringField;
    CdsCaixaNumero_Doc: TStringField;
    CdsCaixaDescricao: TStringField;
    CdsCaixaValor: TFMTBCDField;
    CdsCaixaTipo: TStringField;
    CdsCaixaData_Cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCaixa: TDmCaixa;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
