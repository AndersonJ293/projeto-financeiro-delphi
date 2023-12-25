unit ProjetoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ProjetoFinanceiro.Model.Conexao, ProjetoFinanceiro.Model.Entidades.Usuario;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario : TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function VerificaLoginCadastrado(Login : String; ID : String) : Boolean;
    procedure EfetuarLogin(Login: String; Senha: String);
    function GetUsuarioLogado : TModelEntidadeUsuario;
  end;

var
  DmUsuarios: TDmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmUsuarios }

procedure TDmUsuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TDmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TDmUsuarios.EfetuarLogin(Login, Senha: String);
var
   SQLConsulta : TFDQuery;
begin
   SQLConsulta := TFDQuery.Create(nil);

   try
       SQLConsulta.Connection := DmConexao.SQLConexao;
       SQLConsulta.SQL.Clear;
       SQLConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = ' +
                                    ':LOGIN and SENHA = :SENHA');
       SQLConsulta.ParamByName('LOGIN').AsString := Login;
       SQLConsulta.ParamByName('SENHA').AsString := Senha;
       SQLConsulta.Open;

       if SQLConsulta.IsEmpty then
         raise Exception.Create('Usuário e/ou senha inválidos.');
       if SQLConsulta.FieldByName('STATUS').AsString <> 'A' then
         raise Exception.Create('Usuário inativo.');

       FEntidadeUsuario.ID := SQLConsulta.FieldByName('ID').AsString;
       FEntidadeUsuario.Login := SQLConsulta.FieldByName('LOGIN').AsString;
       FEntidadeUsuario.Nome := SQLConsulta.FieldByName('NOME').AsString;
   finally
       SQLConsulta.Close;
       SQLConsulta.Free;
   end;
end;

function TDmUsuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

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
