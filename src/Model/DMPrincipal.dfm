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
    Top = 64
  end
  object QryColaboradores: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, nome, status, senha FROM Colaboradores')
    Left = 440
    Top = 120
  end
  object DsColaboradores: TDataSource
    DataSet = QryColaboradores
    Left = 168
    Top = 120
  end
  object DsProjetos: TDataSource
    DataSet = QryProjetos
    Left = 160
    Top = 208
  end
  object QryProjetos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT p.ID, p.nome, p.ID_criador, c.nome AS responsavel, p.stat' +
        'us, p.data_criacao, p.data_conclusao'
      'FROM Projetos p'
      'JOIN Colaboradores c ON c.ID = p.ID_criador')
    Left = 440
    Top = 216
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
    object QryProjetosresponsavel: TStringField
      FieldName = 'responsavel'
      Size = 30
    end
  end
  object QryTarefas: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT t.ID, t.nome, t.ID_projeto, p.nome AS Projeto, t.ID_colab' +
        'orador, c.nome AS Responsavel, t.status, t.data_conclusao'
      'FROM Tarefas t'
      'JOIN Colaboradores c ON c.ID = t.ID_colaborador'
      'JOIN Projetos p ON p.ID = t.ID_projeto;')
    Left = 440
    Top = 320
  end
  object DsTarefas: TDataSource
    DataSet = QryTarefas
    Left = 160
    Top = 320
  end
  object DsDashBoard: TDataSource
    DataSet = QryDashboard
    Left = 160
    Top = 408
  end
  object QryDashboard: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM vw_ResumoProjetos')
    Left = 440
    Top = 408
    object QryDashboardID: TIntegerField
      FieldName = 'ID'
    end
    object QryDashboardnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object QryDashboardstatus: TStringField
      FieldName = 'status'
    end
    object QryDashboarddata_criacao: TWideStringField
      FieldName = 'data_criacao'
      Size = 34
    end
    object QryDashboarddata_conclusao: TWideStringField
      FieldName = 'data_conclusao'
      Size = 34
    end
    object QryDashboardtotal_tarefas: TIntegerField
      FieldName = 'total_tarefas'
      ReadOnly = True
    end
    object QryDashboardtarefas_concluidas: TIntegerField
      FieldName = 'tarefas_concluidas'
      ReadOnly = True
    end
    object QryDashboardtarefas_pendentes: TIntegerField
      FieldName = 'tarefas_pendentes'
      ReadOnly = True
    end
  end
end
