unit uColaboradorDAO;

interface

uses
  Data.DB, ADODB, System.SysUtils;

type
  TColaboradorDAO = class
  private
    { Private declarations }
    FConexao: TADOConnection;
  public
    { Public declarations }
    constructor Create(AConexao: TADOConnection);

    procedure Inserir(const Nome, Senha, Status: string);
    procedure Atualizar(const ID: Integer; const Nome, Senha, Status: string);
    procedure Excluir(const ID: Integer);
  end;


implementation

constructor TColaboradorDAO.Create(AConexao: TADOConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;


procedure TColaboradorDAO.Inserir(const Nome, Senha, Status: String);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'INSERT INTO Colaboradores (nome, senha, status) VALUES (:pNome, :pSenha, :pStatus)';
    Parameters.ParamByName('pNome').Value := nome;
    Parameters.ParamByname('pSenha').Value := senha;
    Parameters.ParamByName('pStatus').Value := status;
    ExecSQL;
  finally
    Free;
  end;
end;



procedure TColaboradorDAO.Atualizar(const ID: Integer; const Nome, Senha, Status: string);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'UPDATE Colaboradores SET Nome = :pNome, Senha = :pSenha, Status = :pStatus WHERE ID = :pID';
    Parameters.ParamByName('pNome').Value := nome;
    Parameters.ParamByName('pSenha').Value := senha;
    Parameters.ParamByName('pStatus').Value := status;
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;



procedure TColaboradorDAO.Excluir(const ID: Integer);
begin
  with TADOQuery.Create(nil) do
  try
    Connection := FConexao;
    SQL.Text := 'DELETE FROM Colaboradores WHERE ID = :pID';
    Parameters.ParamByName('pID').Value := ID;
    ExecSQL;
  finally
    Free;
  end;
end;

end.
