inherited FormCaixa: TFormCaixa
  Caption = 'Caixa'
  ClientWidth = 720
  ExplicitWidth = 732
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 720
    ExplicitWidth = 714
    inherited CardCadastro: TCard
      Width = 718
      Padding.Top = 30
      ExplicitHeight = 522
      object LblTitulo: TLabel [0]
        Left = 0
        Top = 30
        Width = 718
        Height = 40
        Align = alTop
        Alignment = taCenter
        Caption = 'Cadastrar Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 214
      end
      inherited Panel1: TPanel
        Width = 718
      end
      object PnlEdits: TPanel
        Left = 0
        Top = 70
        Width = 718
        Height = 381
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 712
        ExplicitHeight = 372
        object PnlDescricao: TPanel
          Left = 32
          Top = 128
          Width = 653
          Height = 105
          BevelOuter = bvNone
          Color = clNone
          TabOrder = 0
          object LblDescricao: TLabel
            Left = 0
            Top = 0
            Width = 653
            Height = 28
            Align = alTop
            Caption = 'Descri'#231#227'o'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
            Layout = tlCenter
            ExplicitWidth = 84
          end
          object Panel8: TPanel
            Left = 0
            Top = 28
            Width = 653
            Height = 77
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel3'
            Padding.Top = 5
            TabOrder = 0
            object Shape3: TShape
              Left = 0
              Top = 5
              Width = 653
              Height = 72
              Align = alClient
              Pen.Color = clNone
              Pen.Style = psClear
              Pen.Width = 0
              Shape = stRoundRect
              ExplicitLeft = 3
              ExplicitTop = 6
            end
            object EditDescricao: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 8
              Width = 646
              Height = 66
              Margins.Right = 4
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              ImeName = 'Portuguese (Brazilian ABNT)'
              TabOrder = 0
              TextHint = 'Descri'#231#227'o'
            end
          end
        end
        object PnlNumDocumento: TPanel
          Left = 32
          Top = 38
          Width = 300
          Height = 73
          BevelOuter = bvNone
          Color = clNone
          TabOrder = 1
          object LblNumDocumento: TLabel
            Left = 0
            Top = 0
            Width = 300
            Height = 28
            Align = alTop
            Caption = 'N'#186' Documento'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
            Layout = tlCenter
            ExplicitWidth = 132
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
            object EditNumDocumento: TEdit
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
              TextHint = 'N'#186' documento'
            end
          end
        end
        object PnlRadio: TPanel
          Left = 28
          Top = 254
          Width = 300
          Height = 73
          BevelOuter = bvNone
          Color = clNone
          TabOrder = 2
          object RadioTipo: TRadioGroup
            Left = 0
            Top = 0
            Width = 300
            Height = 73
            Align = alClient
            Caption = 'Tipo'
            Columns = 2
            Items.Strings = (
              'Receita'
              'Despesa')
            ShowFrame = False
            TabOrder = 0
            StyleName = 'Windows'
          end
        end
        object PnlValor: TPanel
          Left = 385
          Top = 38
          Width = 300
          Height = 73
          BevelOuter = bvNone
          Color = clNone
          TabOrder = 3
          object LblValor: TLabel
            Left = 0
            Top = 0
            Width = 300
            Height = 28
            Align = alTop
            Caption = 'Valor'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
            Layout = tlCenter
            ExplicitWidth = 45
          end
          object Panel4: TPanel
            Left = 0
            Top = 32
            Width = 300
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel3'
            TabOrder = 0
            object Shape1: TShape
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
            object EditValor: TEdit
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
              ImeName = 'Portuguese (Brazilian ABNT)'
              TabOrder = 0
              TextHint = 'Valor'
            end
          end
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 718
      ExplicitWidth = 718
      ExplicitHeight = 531
      inherited PnlPesquisa: TPanel
        Width = 718
        ExplicitWidth = 718
        object Label2: TLabel [1]
          Left = 398
          Top = 3
          Width = 39
          Height = 28
          Caption = 'Tipo'
        end
        inherited EditPesquisar: TEdit
          TextHint = 'N'#186' Doc, Data, Descri'#231#227'o'
        end
        inherited ButtonPesquisar: TButton
          Top = 18
          Height = 45
          ExplicitTop = 18
          ExplicitHeight = 45
        end
        object CbTipo: TComboBox
          Left = 398
          Top = 30
          Width = 145
          Height = 36
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'Todos'
          Items.Strings = (
            'Todos'
            'Receita'
            'Despesas')
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Width = 718
        ExplicitTop = 451
        ExplicitWidth = 718
        DesignSize = (
          718
          80)
        inherited ButtonIncluir: TButton
          Width = 130
          ExplicitWidth = 130
        end
      end
      inherited PnlGrid: TPanel
        Width = 718
        ExplicitWidth = 718
        ExplicitHeight = 371
        inherited DBGrid1: TDBGrid
          Width = 716
          Columns = <
            item
              Expanded = False
              FieldName = 'Data_Cadastro'
              Title.Caption = 'Data'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numero_Doc'
              Title.Caption = 'N'#186' Doc'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 320
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Valor'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Tipo'
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 544
    Top = 416
  end
  inherited DataSource1: TDataSource
    DataSet = DmCaixa.CdsCaixa
  end
end
