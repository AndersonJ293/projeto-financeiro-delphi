object FormRedefinirSenha: TFormRedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Redefinir Senha'
  ClientHeight = 312
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 312
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 284
    ExplicitHeight = 311
    object PnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 288
      Height = 63
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Padding.Top = 5
      Padding.Bottom = 5
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 284
      object LblSubtitulo: TLabel
        Left = 0
        Top = 37
        Width = 288
        Height = 21
        Align = alTop
        Alignment = taCenter
        Caption = 'Informe sua nova senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 182
      end
      object LblUsuario: TLabel
        Left = 0
        Top = 5
        Width = 288
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Usu'#225'rio'
        ExplicitWidth = 88
      end
    end
    object PnlEdits: TPanel
      Left = 0
      Top = 63
      Width = 288
      Height = 162
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 284
      ExplicitHeight = 248
      object PnlNovaSenha: TPanel
        Left = 19
        Top = 0
        Width = 250
        Height = 73
        BevelOuter = bvNone
        Color = clNone
        TabOrder = 0
        object LblNovaSenha: TLabel
          Left = 0
          Top = 0
          Width = 250
          Height = 28
          Align = alTop
          Alignment = taCenter
          Caption = 'Nova Senha'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 113
        end
        object PnlEditNovaSenha: TPanel
          Left = 0
          Top = 32
          Width = 250
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 250
            Height = 41
            Align = alClient
            Pen.Color = clNone
            Pen.Style = psClear
            Pen.Width = 0
            Shape = stRoundRect
            ExplicitLeft = 3
            ExplicitTop = 44
          end
          object EditNovaSenha: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 243
            Height = 34
            Cursor = crIBeam
            Margins.Top = 4
            Margins.Right = 4
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ImeName = 'Portuguese (Brazilian ABNT)'
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
            TextHint = 'Nova senha'
          end
        end
      end
      object PnlConfirmarSenha: TPanel
        Left = 19
        Top = 86
        Width = 250
        Height = 73
        BevelOuter = bvNone
        Color = clNone
        TabOrder = 1
        object LblConfirmarSenha: TLabel
          Left = 0
          Top = 0
          Width = 250
          Height = 28
          Align = alTop
          Alignment = taCenter
          Caption = 'Confirme a Senha'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 167
        end
        object PnlEditConfirmarSenha: TPanel
          Left = 0
          Top = 32
          Width = 250
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 250
            Height = 41
            Align = alClient
            Pen.Color = clNone
            Pen.Style = psClear
            Pen.Width = 0
            Shape = stRoundRect
            ExplicitLeft = 3
            ExplicitTop = 44
          end
          object EditConfirmarSenha: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 243
            Height = 34
            Cursor = crIBeam
            Margins.Top = 4
            Margins.Right = 4
            Align = alClient
            AutoSelect = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
            TextHint = 'Confirme a senha'
            OnKeyDown = EditConfirmarSenhaKeyDown
          end
        end
      end
    end
    object PnlBotoes: TPanel
      Left = 0
      Top = 225
      Width = 288
      Height = 87
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object PnlBotaoFechar: TPanel
        Left = 223
        Top = 23
        Width = 40
        Height = 40
        Cursor = crHandPoint
        Alignment = taRightJustify
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        TabStop = True
        StyleName = 'Windows'
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 40
          Height = 40
          Align = alClient
          Brush.Color = clMaroon
          Pen.Color = clNone
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitHeight = 81
        end
        object LblFechar: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 34
          Height = 32
          Margins.Bottom = 5
          Align = alClient
          Alignment = taCenter
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = LblFecharClick
          ExplicitTop = 4
          ExplicitHeight = 33
        end
      end
      object PnlBotao: TPanel
        Left = 26
        Top = 23
        Width = 185
        Height = 41
        Cursor = crHandPoint
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        TabStop = True
        StyleName = 'Windows'
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 41
          Align = alClient
          Brush.Color = 2596096
          Pen.Color = clNone
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = -32
          ExplicitTop = -16
        end
        object LblButton: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 179
          Height = 33
          Margins.Bottom = 5
          Align = alClient
          Alignment = taCenter
          Caption = 'Redefinir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = LblButtonClick
          ExplicitWidth = 89
          ExplicitHeight = 30
        end
      end
    end
  end
end
