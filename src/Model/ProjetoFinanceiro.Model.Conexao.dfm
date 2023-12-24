object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SQLConexao: TFDConnection
    Left = 48
    Top = 33
  end
end
