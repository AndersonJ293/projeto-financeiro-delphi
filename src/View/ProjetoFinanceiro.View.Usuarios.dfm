inherited FormUsuarios: TFormUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 542
  ClientWidth = 720
  OnShow = FormShow
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 720
    Height = 542
    ActiveCard = CardCadastro
    inherited CardCadastro: TCard
      Width = 718
      Height = 540
      Padding.Top = 30
      object LblTitulo: TLabel [0]
        Left = 0
        Top = 30
        Width = 718
        Height = 40
        Align = alTop
        Alignment = taCenter
        Caption = 'Cadastrar Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 246
      end
      inherited Panel1: TPanel
        inherited ButtonSalvar: TButton
          OnClick = ButtonSalvarClick
        end
      end
      object Panel9: TPanel
        Left = 209
        Top = 203
        Width = 300
        Height = 70
        BevelOuter = bvNone
        TabOrder = 3
        object LblStatus: TLabel
          Left = 0
          Top = 0
          Width = 300
          Height = 28
          Align = alTop
          Alignment = taCenter
          Caption = 'Status'
          ExplicitTop = 4
        end
        object TglStatus: TToggleSwitch
          AlignWithMargins = True
          Left = 80
          Top = 35
          Width = 140
          Height = 30
          Margins.Left = 80
          Margins.Top = 0
          Margins.Right = 80
          Margins.Bottom = 5
          Align = alBottom
          Alignment = taLeftJustify
          Color = clBtnFace
          State = tssOn
          StateCaptions.CaptionOn = 'Ativo'
          StateCaptions.CaptionOff = 'Inativo'
          StyleName = 'Windows'
          TabOrder = 0
          ThumbColor = clHotLight
          ExplicitLeft = 104
          ExplicitWidth = 116
        end
      end
      object Panel5: TPanel
        Left = 19
        Top = 104
        Width = 300
        Height = 73
        BevelOuter = bvNone
        Color = clNone
        TabOrder = 1
        object LblNome: TLabel
          Left = 0
          Top = 0
          Width = 300
          Height = 28
          Align = alTop
          Caption = 'Nome'
          Color = clBtnFace
          ParentColor = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 54
        end
        object Panel3: TPanel
          Left = 0
          Top = 32
          Width = 300
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Shape4: TShape
            Left = 0
            Top = 0
            Width = 300
            Height = 41
            Align = alClient
            Pen.Color = clNone
            Pen.Style = psClear
            Pen.Width = 0
            Shape = stRoundRect
            ExplicitLeft = -88
            ExplicitTop = 2
            ExplicitWidth = 233
          end
          object EditNome: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 293
            Height = 34
            Margins.Top = 4
            Margins.Right = 4
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            TextHint = 'Nome'
          end
        end
      end
      object Panel7: TPanel
        Left = 400
        Top = 104
        Width = 300
        Height = 73
        BevelOuter = bvNone
        Color = clNone
        TabOrder = 2
        object LblLogin: TLabel
          Left = 0
          Top = 0
          Width = 300
          Height = 28
          Align = alTop
          Caption = 'Login'
          Color = clBtnFace
          ParentColor = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 49
        end
        object Panel8: TPanel
          Left = 0
          Top = 32
          Width = 300
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Shape3: TShape
            Left = 0
            Top = 0
            Width = 300
            Height = 41
            Align = alClient
            Pen.Color = clNone
            Pen.Style = psClear
            Pen.Width = 0
            Shape = stRoundRect
            ExplicitTop = 2
          end
          object EditLogin: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 293
            Height = 35
            Margins.Right = 4
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            TextHint = 'Login'
          end
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 718
      Height = 540
      inherited PnlPesquisa: TPanel
        Width = 718
        inherited ButtonPesquisar: TButton [1]
          TabOrder = 0
          OnClick = ButtonPesquisarClick
        end
        object Panel2: TPanel [2]
          Left = 10
          Top = 33
          Width = 400
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel2'
          Padding.Left = 2
          Padding.Top = 2
          Padding.Right = 2
          Padding.Bottom = 2
          TabOrder = 1
          object Shape1: TShape
            Left = 2
            Top = 2
            Width = 396
            Height = 37
            Align = alClient
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 57
            ExplicitTop = 15
            ExplicitWidth = 183
            ExplicitHeight = 39
          end
        end
        inherited EditPesquisar: TEdit [3]
          AlignWithMargins = True
          Left = 20
          Top = 37
          Width = 380
          Height = 31
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ParentBiDiMode = False
          TabOrder = 2
          TextHint = 'Nome'
          ExplicitLeft = 20
          ExplicitTop = 37
          ExplicitWidth = 380
          ExplicitHeight = 31
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 460
        Width = 718
        inherited ButtonAlterar: TButton
          Left = 151
          ExplicitLeft = 151
        end
        inherited ButtonExcluir: TButton
          Left = 293
          OnClick = ButtonExcluirClick
          ExplicitLeft = 293
        end
      end
      inherited PnlGrid: TPanel
        Width = 718
        Height = 380
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 394
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Login'
              Width = 231
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status'
              Width = 59
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 354
    Top = 393
  end
  object DataSource1: TDataSource
    DataSet = DmUsuarios.CdsUsuarios
    Left = 656
    Top = 408
  end
  object PopupMenu1: TPopupMenu
    Left = 624
    Top = 216
    object menuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = menuLimparSenhaClick
    end
  end
end
