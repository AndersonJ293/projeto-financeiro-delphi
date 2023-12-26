object DmCaixa: TDmCaixa
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SqlCaixa: TFDQuery
    Connection = DmConexao.SQLConexao
    Left = 30
    Top = 10
  end
  object CdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCaixa'
    Left = 130
    Top = 10
    object CdsCaixaID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object CdsCaixaNumero_Doc: TStringField
      FieldName = 'Numero_Doc'
    end
    object CdsCaixaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object CdsCaixaValor: TFMTBCDField
      FieldName = 'Valor'
      Size = 18
    end
    object CdsCaixaTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object CdsCaixaData_Cadastro: TDateField
      FieldName = 'Data_Cadastro'
    end
  end
  object DspCaixa: TDataSetProvider
    DataSet = SqlCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 230
    Top = 10
  end
end
