﻿unit ProjetoFinanceiro.Model.Entidades.Usuario;

interface
  type
    TModelEntidadeUsuario = class
  private
    FLogin : String;
    FNome : String;
    FID : String;
    procedure SetID(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
  public
      property Nome : String read FNome write SetNome;
      property Login : String read FLogin write SetLogin;
      property ID : String read FID write SetID;
    end;
implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelEntidadeUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TModelEntidadeUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.