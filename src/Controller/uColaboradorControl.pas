unit uColaboradorControl;

interface

uses
  uColaboradorDAO, System.SysUtils;

type
  TColaboradorControl = class
  private
    FObjColaborador: TColaboradorDAO;
  public
    constructor Create(AColab: TColaboradorDAO);

    procedure Adicionar(const Nome, Senha, Status: string);
    procedure Editar(const ID: Integer; Nome, Senha, Status: String);
    procedure Excluir(const ID: Integer);
  end;

implementation

constructor TColaboradorControl.Create(AColab: TColaboradorDAO);
begin
  inherited Create;
  FObjColaborador := AColab;
end;



procedure TColaboradorControl.Adicionar(const Nome, Senha, Status: string);
begin
  FObjColaborador.Inserir(Nome, Senha, Status);
end;

procedure TColaboradorControl.Editar(const ID: Integer; Nome, Senha, Status: String);
begin
  FObjColaborador.Atualizar(ID, Nome, Senha, Status);
end;

procedure TColaboradorControl.Excluir(const ID: Integer);
begin
  FObjColaborador.Excluir(ID);
end;


end.
