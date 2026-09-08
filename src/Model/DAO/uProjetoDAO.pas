unit uProjetoDAO;

interface

uses
  Data.DB, ADODB, System.SysUtils, Vcl.Dialogs;

type
  TProjetoDAO = class
  private
    FConexao: TADOConnection;
  public
    constructor Create(AConexao: TADOConnection);

    procedure Inserir(const ID_criador: Integer; const Nome: String);
    procedure Atualizar(const ID: Integer; const Nome: String);
    procedure Excluir(const ID: Integer);
    procedure Concluir(const ID: Integer);
    procedure AtualizarResponsavel(const ID, ID_criador: Integer);
    procedure Reabrir(const ID: Integer);
  end;

  //
implementation

constructor TProjetoDAO.Create(AConexao: TADOConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;




procedure TProjetoDAO.Inserir(const ID_criador: Integer; const Nome: string);
begin
  with TADOStoredProc.Create(nil) do
  try
    Connection := FConexao;
    ProcedureName := 'CriarProjeto';
    Parameters.Refresh; //pergunta pro banco quais parametros a procedure precisa receber
    Parameters.ParamByName('@ID_criador').Value := ID_criador;
    Parameters.ParamByName('@nome').Value := nome;
    ExecProc;
  finally
    Free;
  end;
end;


procedure TProjetoDAO.Atualizar(const ID: Integer; const Nome: string);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FCOnexao;
    SQL.Text :=  'UPDATE Projetos SET nome = :pNome WHERE ID = :pID';
    Parameters.ParamByName('pNome').Value := nome;
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;


procedure TProjetoDAO.Excluir(const ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FCOnexao;
    SQL.Text := 'DELETE FROM Projetos WHERE ID = :pID';
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TProjetoDAO.Concluir(const ID: Integer);
begin
  with TADOStoredProc.Create(nil) do
  try
    Connection := FConexao;
    ProcedureName := 'ConcluirProjeto';
    Parameters.Refresh;
    Parameters.ParamByName('@ID_projeto').Value := ID;
    ExecProc;
  finally
    Free;
  end;
end;

procedure TProjetoDAO.AtualizarResponsavel(const ID, ID_criador: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Projetos SET ID_criador = :pID_criador WHERE ID = :pID';
    Parameters.ParamByName('pID_criador').Value := ID_criador;
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TProjetoDAO.Reabrir(const ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Projetos SET status = ''EM_PROCESSO'', data_conclusao := NULL WHERE ID = :pID';
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

end.
