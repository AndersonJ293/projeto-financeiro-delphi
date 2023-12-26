object DmUsuarios: TDmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object SqlUsuarios: TFDQuery
    Connection = DmConexao.SQLConexao
    Left = 30
    Top = 10
  end
  object CdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUsuarios'
    Left = 130
    Top = 10
    object CdsUsuariosID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object CdsUsuariosNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object CdsUsuariosLogin: TStringField
      FieldName = 'Login'
    end
    object CdsUsuariosSenha: TStringField
      FieldName = 'Senha'
      Size = 60
    end
    object CdsUsuariosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object CdsUsuariosData_Cadastro: TDateField
      FieldName = 'Data_Cadastro'
    end
    object CdsUsuariosSenha_Temporaria: TStringField
      FieldName = 'Senha_Temporaria'
      Size = 1
    end
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 230
    Top = 10
  end
end
