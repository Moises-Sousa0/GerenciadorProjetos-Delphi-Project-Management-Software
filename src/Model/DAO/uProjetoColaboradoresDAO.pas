unit uProjetoColaboradoresDAO;

interface

uses
  Data.DB, ADODB, System.SysUtils;

type
  TProjetoColaboradores = class

  private
    FConexao: TADOConnection;
  public
    constructor Create(AConexao: TADOConnection);

    procedure Inserir(const ID_projeto, ID_colaborador: Integer);
    procedure Excluir(const ID_projeto, ID_colaborador: Integer);
    function Listar(const ID_projeto: Integer): TADOQuery;
  end;

implementation

constructor TProjetoColaboradores.Create(AConexao: TADOConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;

procedure TProjetoColaboradores.Inserir(const ID_projeto, ID_colaborador: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'INSERT INTO projeto_colaboradores (ID_projeto, ID_colaborador) VALUES (:pID_projeto, :pID_colaborador)';
    parameters.ParamByName('pID_projeto').Value := ID_projeto;
    parameters.ParamByName('pID_colaborador').Value := ID_colaborador;
    ExecSQL;
  finally
    Free;
  end;
end;


procedure TProjetoColaboradores.Excluir(const ID_projeto, ID_colaborador: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'DELETE FROM projeto_colaboradores WHERE ID_projeto = :pID_projeto AND ID_colaborador = :pID_colaborador';
    parameters.ParamByName('pID_projeto').Value := ID_projeto;
    parameters.ParamByName('pID_colaborador').Value := ID_colaborador;
    ExecSQL;
  finally
    Free;
  end;
end;


function TProjetoColaboradores.Listar(const ID_projeto: Integer): TADOQuery;
begin
  Result := TADOQuery.Create(nil);
  Result.Connection := FConexao;
  Result.SQL.Text := 'SELECT c.ID, c.nome FROM Colaboradores c JOIN Projeto_Colaboradores pc ON pc.ID_colaborador = c.ID WHERE pc.ID_projeto = :pID_projeto';
  Result.Parameters.ParamByName('pID_projeto').Value := ID_projeto;
  Result.Open;
end;

end.
