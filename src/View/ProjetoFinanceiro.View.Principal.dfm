object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Financeiro'
  ClientHeight = 522
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 503
    Width = 720
    Height = 19
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 200
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 200
      end>
    ExplicitWidth = 689
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 248
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object CadastroUsuario: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = CadastroUsuarioClick
      end
    end
    object Relatórios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object MenuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 384
    Top = 248
  end
end
