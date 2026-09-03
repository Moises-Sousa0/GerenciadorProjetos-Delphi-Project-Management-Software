object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=peixegamer;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=GerenciadorProjeto;Data Source=LOC' +
      'ALHOST'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 304
    Top = 120
  end
  object QryColaboradores: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, nome, status FROM Colaboradores')
    Left = 440
    Top = 232
  end
  object DsColaboradores: TDataSource
    DataSet = QryColaboradores
    Left = 160
    Top = 232
  end
end
