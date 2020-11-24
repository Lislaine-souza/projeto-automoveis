object Modulo: TModulo
  OldCreateOrder = False
  Height = 460
  Width = 633
  object conexao: TUniConnection
    ProviderName = 'mySQL'
    Port = 3306
    Database = 'projeto_carros'
    Username = 'root'
    Server = '127.0.0.1'
    Connected = True
    Left = 48
    Top = 32
  end
  object Provider: TMySQLUniProvider
    Left = 128
    Top = 32
  end
  object transacao: TUniTransaction
    DefaultConnection = conexao
    Left = 200
    Top = 32
  end
  object Procedimentos: TUniStoredProc
    Connection = conexao
    Left = 272
    Top = 32
  end
  object ConsultaOff: TUniSQL
    Connection = conexao
    Left = 424
    Top = 32
  end
  object tbUsuarios: TUniQuery
    Connection = conexao
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 128
  end
  object dsUsuarios: TUniDataSource
    DataSet = tbUsuarios
    Left = 112
    Top = 128
  end
end
