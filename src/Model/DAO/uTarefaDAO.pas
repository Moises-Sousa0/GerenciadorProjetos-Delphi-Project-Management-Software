unit uTarefaDAO;

interface

uses
  Data.DB, ADODB, System.SysUtils;

type
  TTarefaDAO = class
  private
    FConexao: TADOConnection;
  public
    constructor Create(AConexao: TADOConnection);

    procedure Inserir(const ID_projeto, ID_colaborador: Integer; const Nome: String);
    procedure Editar(const ID: Integer; Nome: String);
    procedure Excluir(const ID: Integer);
    procedure EditarColaborador(const ID_colaborador, ID: Integer);
    procedure ConcluirTarefa(const ID: Integer);
    procedure Reabrir(const ID: Integer);
  end;

implementation

constructor TTarefaDAO.Create(AConexao: TADOConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;


procedure TTarefaDAO.Inserir(const ID_projeto, ID_colaborador: Integer; const Nome: string);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'INSERT INTO Tarefas (ID_projeto, ID_colaborador, nome) VALUES (:pID_projeto, :pID_colaborador, :pNome)';
    parameters.ParamByName('pID_projeto').Value := ID_projeto;
    parameters.ParamByName('pID_colaborador').Value := ID_colaborador;
    parameters.ParamByName('pNome').Value := nome;
    ExecSQL;
  finally
    Free;
  end;
end;


procedure TTarefaDAO.Editar(const ID: Integer; Nome: string);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Tarefas SET nome = :pNome WHERE ID = :pID';
    parameters.ParamByName('pNome').Value := nome;
    parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TTarefaDAO.Excluir(const ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'DELETE FROM Tarefas WHERE ID = :pID';
    parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;


procedure TTarefaDAO.EditarColaborador(const ID_colaborador, ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Tarefas SET ID_colaborador = :pID_colaborador WHERE ID = :pID';
    parameters.ParamByName('pID_colaborador').Value := ID_colaborador;
    parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TTarefaDAO.ConcluirTarefa(const ID: Integer);
begin
  with TADOStoredProc.Create(nil) do
  try
    Connection := FConexao;
    ProcedureName := 'ConcluirTarefa';
    Parameters.Refresh;
    Parameters.ParamByName('@ID_tarefa').Value := ID;
    ExecProc;
  finally
    Free;
  end;
end;

procedure TTarefaDAO.Reabrir(const ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Tarefas SET status = ''PENDENTE'', data_conclusao = NULL WHERE ID = :pID';
    parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

end.
