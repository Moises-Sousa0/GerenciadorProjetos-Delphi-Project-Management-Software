unit uProjetoControl;

interface

uses
  uProjetoDAO, System.SysUtils;

type
  TProjetoControl = class
  private
    FObjProjeto: TProjetoDAO;
  public
    constructor Create(AProj: TProjetoDAO);

    procedure Adicionar(const ID_criador: Integer; const Nome: String);
    procedure Atualizar(const ID: Integer; const Nome: String);
    procedure Excluir(const ID: Integer);
    procedure Concluir(const ID: Integer);
  end;

implementation

constructor TProjetoControl.Create(AProj: TProjetoDAO);
begin
  inherited Create;
  FObjProjeto := AProj;
end;

procedure TProjetoControl.Adicionar(const ID_criador: Integer; const Nome: string);
begin
  FObjProjeto.Inserir(ID_criador, Nome);
end;

procedure TProjetoControl.Atualizar(const ID: Integer; const Nome: string);
begin
  FObjProjeto.Atualizar(ID, Nome);
end;

procedure TProjetoControl.Excluir(const ID: Integer);
begin
  FObjProjeto.Excluir(ID);
end;

procedure TProjetoControl.Concluir(const ID: Integer);
begin
  FObjProjeto.Concluir(ID);
end;

end.
