﻿object FormPrincipal: TFormPrincipal
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
  OnCreate = FormCreate
  TextHeight = 15
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
end
