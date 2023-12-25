object DmUsuarios: TDmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object SqlUsuarios: TFDQuery
    Connection = DmConexao.SQLConexao
    Left = 24
    Top = 8
  end
  object CdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUsuarios'
    Left = 104
    Top = 8
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
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 8
  end
end
