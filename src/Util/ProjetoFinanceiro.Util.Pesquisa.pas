unit ProjetoFinanceiro.Util.Pesquisa;

interface

uses
  Vcl.DBGrids;
type
  TPesquisaUtil = class
    class function LikeFind(Pesquisa: String; Grid: TDBGrid) : String;
  end;
implementation

uses
  System.SysUtils;

{ TUtilitarios }

class function TPesquisaUtil.LikeFind(Pesquisa: String; Grid: TDBGrid): String;
var
  LContador: integer;
begin
  Result := '';
  if Trim(Pesquisa).IsEmpty then
    exit;

  for LContador := 0 to Pred(Grid.Columns.Count) do
    Result := Result + Grid.Columns.Items[LContador].FieldName +
     ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';

    Result := ' AND (' + Copy(Result, 1, Length(Result) - 4) + ') ';
end;

end.
