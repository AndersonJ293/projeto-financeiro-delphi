inherited FormUsuarios: TFormUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientWidth = 720
  ExplicitHeight = 571
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 720
    inherited CardCadastro: TCard
      inherited Panel1: TPanel
        Top = 451
        Width = 712
      end
    end
    inherited CardPesquisa: TCard
      Width = 718
      inherited PnlPesquisa: TPanel
        Width = 718
        inherited ButtonPesquisar: TButton
          OnClick = ButtonPesquisarClick
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Width = 718
      end
      inherited PnlGrid: TPanel
        Width = 718
        inherited DBGrid1: TDBGrid
          Height = 369
          DataSource = DataSource1
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DmConexao.FDQuery1
    Left = 680
    Top = 416
  end
end
