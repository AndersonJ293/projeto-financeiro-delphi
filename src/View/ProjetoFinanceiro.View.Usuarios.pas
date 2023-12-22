unit ProjetoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProjetoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels,
  ProjetoFinanceiro.Model.Conexao;

type
  TFormUsuarios = class(TFormCadastroPadrao)
    DataSource1: TDataSource;
    procedure ButtonPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation

{$R *.dfm}

procedure TFormUsuarios.ButtonPesquisarClick(Sender: TObject);
begin
  inherited;
  DmConexao.FDQuery1.Close;
  DmConexao.FDQuery1.SQL.Clear;
  DmConexao.FDQuery1.SQL.Add('Select * from usuarios');
  DmConexao.FDQuery1.Open;
end;

end.
