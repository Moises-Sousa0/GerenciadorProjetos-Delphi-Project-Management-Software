unit uProjetoColaboradoresControl;

interface

uses
  uProjetoColaboradoresDAO, System.SysUtils, Data.DB, ADODB, uProjetoDAO;

type
  TProjetoColaboradoresControl = class
  private
    FObjProjColab: TProjetoColaboradores;
  public
    constructor Create(AprojColab: TProjetoColaboradores);

    procedure Inserir(const ID_projeto, ID_colaborador: Integer; const status: string);
    procedure Excluir(const ID_projeto, ID_colaborador: Integer);
    function Listar(const ID_projeto: Integer): TADOQuery;
  end;

implementation

constructor TProjetoColaboradoresControl.Create(AprojColab: TProjetoColaboradores);
begin
  inherited Create;
  FObjProjColab := AprojColab;
end;


procedure TProjetoColaboradoresControl.Inserir(const ID_projeto, ID_colaborador: Integer; const status: string);
begin
  if status = 'INATIVO' then
  begin
    raise Exception.Create('Não é possivel adicionar um colaborador inativo ao projeto.');
  end
  else
  begin
    FobjProjColab.Inserir(ID_projeto, ID_colaborador);
  end;
end;


procedure TProjetoColaboradoresControl.Excluir(const ID_projeto, ID_colaborador: Integer);
begin
  FobjProjColab.Excluir(ID_projeto, ID_colaborador);
end;


function TProjetoColaboradoresControl.Listar(const ID_projeto: Integer): TADOQuery;
begin
  Result := FobjProjColab.Listar(ID_projeto);
end;
end.
