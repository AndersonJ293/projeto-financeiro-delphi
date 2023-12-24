object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 600
  Width = 800
  object SQLConexao: TFDConnection
    Left = 38
    Top = 26
  end
end
