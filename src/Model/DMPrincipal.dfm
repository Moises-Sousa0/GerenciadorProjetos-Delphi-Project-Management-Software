object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object ADOConnection1: TADOConnection
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
      'SELECT ID, nome, status, senha FROM Colaboradores')
    Left = 440
    Top = 232
  end
  object DsColaboradores: TDataSource
    DataSet = QryColaboradores
    Left = 160
    Top = 232
  end
  object DsProjetos: TDataSource
    DataSet = QryProjetos
    Left = 160
    Top = 312
  end
  object QryProjetos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ID, ID_criador, nome, status, data_criacao, data_conclusa' +
        'o FROM Projetos')
    Left = 440
    Top = 328
    object QryProjetosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QryProjetosID_criador: TIntegerField
      FieldName = 'ID_criador'
    end
    object QryProjetosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object QryProjetosstatus: TStringField
      FieldName = 'status'
    end
    object QryProjetosdata_criacao: TWideStringField
      FieldName = 'data_criacao'
      Size = 34
    end
    object QryProjetosdata_conclusao: TWideStringField
      FieldName = 'data_conclusao'
      Size = 34
    end
  end
end
