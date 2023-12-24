unit ProjetoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ProjetoFinanceiro.Model.Conexao;

type
  TDmUsuarios = class(TDataModule)
    SqlUsuarios: TFDQuery;
    CdsUsuarios: TClientDataSet;
    DspUsuarios: TDataSetProvider;
    CdsUsuariosID: TStringField;
    CdsUsuariosNome: TStringField;
    CdsUsuariosLogin: TStringField;
    CdsUsuariosSenha: TStringField;
    CdsUsuariosStatus: TStringField;
    CdsUsuariosData_Cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificaLoginCadastrado(Login : String; ID : String) : Boolean;
  end;

var
  DmUsuarios: TDmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmUsuarios }

function TDmUsuarios.VerificaLoginCadastrado(Login, ID: String): Boolean;
var
   SQLConsulta : TFDQuery;
begin
     Result := false;
     SQLConsulta := TFDQuery.Create(nil);
     try
       SQLConsulta.Connection := DmConexao.SQLConexao;
       SQLConsulta.SQL.Clear;
       SQLConsulta.SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
       SQLConsulta.ParamByName('LOGIN').AsString := Login;
       SQLConsulta.Open;

       if not SQLConsulta.IsEmpty then
          Result := SQLConsulta.FieldByName('ID').AsString <> ID;

     finally
       SQLConsulta.Close;
       SQLConsulta.Free;
     end;
end;

end.
