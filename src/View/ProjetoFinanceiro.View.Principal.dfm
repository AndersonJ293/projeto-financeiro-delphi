object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Financeiro'
  ClientHeight = 520
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 360
    Top = 96
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
    end
    object Relatórios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object MenuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
end
