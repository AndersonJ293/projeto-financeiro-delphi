unit ProjetoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ProjetoFinanceiro.Model.Conexao, ProjetoFinanceiro.Model.Entidades.CaixaResumo;

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
    function GetSaldoAnterior (Data: TDate) : Currency;
    function GetTotalEntradasCaixa (DataInicial, DataFinal : TDate) : Currency;
    function GetTotalSaidasCaixa (DataInicial, DataFinal : TDate) : Currency;
  public
    { Public declarations }
    function ResumoCaixa(DataInicial, DataFinal : TDate) : TModelResumoCaixa;
  end;

var
  DmCaixa: TDmCaixa;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmCaixa }

function TDmCaixa.GetSaldoAnterior(Data: TDate): Currency;
var
  SQLConsulta : TFDQuery;
  TotalEntradas : Currency;
  TotalSaidas : Currency;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := DmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE ' +
      'TIPO = ''R''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO < :DATA');
    SQLConsulta.Params.ParamByName('DATA').AsDate := Data;
    SQLConsulta.Open;
    TotalEntradas := SQLConsulta.FieldByName('VALOR').AsCurrency;

    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE ' +
      'TIPO = ''D''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO < :DATA');
    SQLConsulta.Params.ParamByName('DATA').AsDate := Data;
    SQLConsulta.Open;
    TotalSaidas := SQLConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
  Result := TotalEntradas - TotalSaidas;
end;

function TDmCaixa.GetTotalEntradasCaixa(DataInicial,
  DataFinal: TDate): Currency;
var
  SQLConsulta : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := DmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE ' +
      'TIPO = ''R''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLConsulta.Params.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLConsulta.Params.ParamByName('DATAFINAL').AsDate := DataFinal;
    SQLConsulta.Open;
    Result := SQLConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
end;

function TDmCaixa.GetTotalSaidasCaixa(DataInicial, DataFinal: TDate): Currency;
var
  SQLConsulta : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := DmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE ' +
      'TIPO = ''D''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLConsulta.Params.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLConsulta.Params.ParamByName('DATAFINAL').AsDate := DataFinal;
    SQLConsulta.Open;
    Result := SQLConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
end;

function TDmCaixa.ResumoCaixa(DataInicial, DataFinal: TDate): TModelResumoCaixa;
begin
  if DataInicial > DataFinal then
    raise Exception.Create('Periodo Invalido');
  Result := TModelResumoCaixa.Create;

  try
    Result.SaldoInicial := GetSaldoAnterior(DataInicial);
    Result.TotalEntradas := GetTotalEntradasCaixa(DataInicial, DataFinal);
    Result.TotalSaidas := GetTotalSaidasCaixa(DataInicial, DataFinal);
  except
    Result.Free;
    raise;
  end;
end;

end.
