unit uTarefasControl;

interface

uses
  uTarefaDAO, Data.DB, ADODB, System.SysUtils;

type
  TTarefasControl = class

  private
    FObjTarefasDAO: TTarefaDAO;
  public
    constructor Create(ATaref: TTarefaDAO);

    procedure Inserir(const ID_projeto, ID_colaborador: Integer; const Status, Nome: String);
    procedure Editar(const ID: Integer; Nome: String);
    procedure Excluir(const ID: Integer);
    procedure EditarColaborador(const ID_colaborador, ID: Integer; const Status: String);
    procedure ConcluirTarefa(const ID: Integer);
  end;

implementation

constructor TTarefasControl.Create(ATaref: TTarefaDAO);
begin
  inherited CREATE;
  FObjTarefasDAO := ATaref;
end;


procedure TTarefasControl.Inserir(const ID_projeto, ID_colaborador: Integer; const Status, Nome: string);
begin
  if Status = 'INATIVO' then
  begin
    raise Exception.Create('Não é possivel adicionar uma tarefa a um colaborador inativo');
  end
  else
  begin
    FObjTarefasDAO.Inserir(ID_projeto, ID_colaborador, Nome);
  end;
end;

procedure TTarefasControl.Editar(const ID: Integer; Nome: string);
begin
  FObjTarefasDAO.Editar(ID, Nome);
end;

procedure TTarefasControl.Excluir(const ID: Integer);
begin
  FObjTarefasDAO.Excluir(ID);
end;


procedure TTarefasControl.EditarColaborador(const ID_colaborador, ID: Integer; const Status: String);
begin
  if Status =  'INATIVO' then
  begin
    raise Exception.Create('Não é possivel adicionar uma tarefa a um colaborador inativo');
  end
  else
  begin
    FObjTarefasDAO.EditarColaborador(ID_colaborador, ID);
  end;
end;

procedure TTarefasControl.ConcluirTarefa(const ID: Integer);
begin
  FObjTarefasDAO.ConcluirTarefa(ID);
end;

end.
