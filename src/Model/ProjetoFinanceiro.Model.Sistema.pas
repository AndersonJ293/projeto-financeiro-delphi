unit ProjetoFinanceiro.Model.Sistema;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmSistema = class(TDataModule)
  private
    { Private declarations }
    function GetConfiguracao(Secao, Parametro, ValorPadrao: String) : String;
    procedure SetConfiguracao(Secao, Parametro, Valor: String);
    const ARQUIVOCONFIGURACAO = 'ProjetoFinanceiro.cfg';
  public
    { Public declarations }
    function DataUltimoAcesso : String; overload;
    procedure GravaDataUltimoAcesso(aValue: TDateTime); overload;
    function UsuarioUltimoAcesso: String; overload;
    procedure GravaUsuarioUltimoAcesso(aValue: String); overload;
  end;

var
  dmSistema: TdmSistema;

implementation

uses
  System.IniFiles, Vcl.Forms;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TdmSistema.DataUltimoAcesso: String;
begin
  Result := GetConfiguracao('ACESSO', 'Data', '');
end;

function TdmSistema.GetConfiguracao(Secao, Parametro,
  ValorPadrao: String): String;
var
  LArquivoConfig: TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName)
                                    + ARQUIVOCONFIGURACAO);
  try
    Result := LArquivoConfig.ReadString(Secao, Parametro, ValorPadrao);
  finally
    LArquivoConfig.Free;
  end;
end;

procedure TdmSistema.GravaDataUltimoAcesso(aValue: TDateTime);
begin
  SetConfiguracao('ACESSO', 'Data' ,DateTimeToStr(aValue));
end;

procedure TdmSistema.GravaUsuarioUltimoAcesso(aValue: String);
begin
  SetConfiguracao('ACESSO', 'Usuario', aValue);
end;

procedure TdmSistema.SetConfiguracao(Secao, Parametro, Valor: String);
var
  LArquivoConfig: TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName)
                                    + ARQUIVOCONFIGURACAO);
  try
    LArquivoConfig.WriteString(Secao, Parametro, Valor);
  finally
    LArquivoConfig.Free;
  end;
end;

function TdmSistema.UsuarioUltimoAcesso: String;
begin
  Result := GetConfiguracao('ACESSO', 'Usuario', '');
end;

end.
