object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDQuery1: TFDQuery
    Connection = SQLConexao
    SQL.Strings = (
      'Select * from usuarios')
    Left = 128
    Top = 32
  end
  object SQLConexao: TFDConnection
    Left = 48
    Top = 32
  end
end
