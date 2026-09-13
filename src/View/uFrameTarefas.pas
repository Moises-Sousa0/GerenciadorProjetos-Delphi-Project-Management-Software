unit uFrameTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTarefasControl, uFormTarefas, uTarefaDAO, DMPrincipal,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.Buttons, JvExButtons, JvBitBtn, uFormGerenciarTarefas, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvExStdCtrls, JvEdit, JvExControls, JvDBLookup;

type
    TFrameTarefa = class(TFrame)
    jpnlConteudoTarefas: TJvPanel;
    jpnlMenu: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    btnGerenciarTarefa: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvPanel1: TJvPanel;
    cmbFiltroColaborador: TJvDBLookupCombo;
    cmbFiltroProjeto: TJvDBLookupCombo;
    btnLimparFiltro: TJvBitBtn;
    edtBuscaTarefa: TJvEdit;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnGerenciarTarefaClick(Sender: TObject);
    procedure edtBuscaTarefaChange(Sender: TObject);
    procedure cmbFiltroProjetoCloseUp(Sender: TObject);
    procedure cmbFiltroColaboradorCloseUp(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
  private
    FController: TTarefasControl;
    FDAO: TTarefaDAO;
    FIdAtual: Integer;
    procedure AplicarFiltro;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

procedure TFrameTarefa.btnAdicionarClick(Sender: TObject);
var
  Resultado: TModalResult;
begin
  with TFormTarefas.Create(nil) do
  try
    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      FController.Inserir(ObterIDprojeto, ObterIdResponsavel, ObterStatusResponsavel, ObterNome);
      DM.QryTarefas.Close;
      DM.QryTarefas.Open;
    end;
  finally
    Free;
  end;
end;

procedure TFrameTarefa.btnExcluirClick(Sender: TObject);
begin
  FIdAtual := DM.QryTarefas.FieldByName('ID').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir essa tarefa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Excluir(FIdAtual);
    Dm.QryTarefas.Close;
    Dm.QryTarefas.Open;
  end;
end;

procedure TFrameTarefa.btnGerenciarTarefaClick(Sender: TObject);
var
  Resultado: TModalResult;
  Nome, Status: String;
  ID_tarefa, ID_projeto, ID_responsavel: Integer;
begin
  ID_tarefa := DM.QryTarefas.FieldByName('ID').AsInteger;
  ID_projeto := DM.QryTarefas.FieldByName('ID_projeto').AsInteger;
  Nome := DM.QryTarefas.FieldByName('nome').AsString;
  Status := DM.QryTarefas.FieldByName('status').AsString;
  ID_responsavel := DM.QryTarefas.FieldByName('ID_colaborador').AsInteger;

  with TGerenciarTaref.Create(nil) do
  try
    CarregarTarefa(ID_tarefa, ID_projeto, ID_responsavel, Nome, Status);

    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      DM.QryTarefas.Close;
      DM.QryTarefas.Open;
    end;
  finally
    Free;
  end;
end;


procedure TFrameTarefa.btnLimparFiltroClick(Sender: TObject);
begin
  edtBuscaTarefa.Text := '';
  cmbFiltroProjeto.KeyValue := Null;
  cmbFiltroColaborador.KeyValue := Null;
  AplicarFiltro;
end;

procedure TFrameTarefa.cmbFiltroColaboradorCloseUp(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFrameTarefa.cmbFiltroProjetoCloseUp(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFrameTarefa.AplicarFiltro;
var
  SQL, WhereClause: string;
begin
  WhereClause := '';

  if edtBuscaTarefa.Text <> '' then
    WhereClause := WhereClause + ' AND t.nome LIKE ''%' + edtBuscaTarefa.Text + '%''';

  if not VarIsNull(cmbFiltroProjeto.KeyValue) then
    WhereClause := WhereClause + ' AND t.ID_projeto = ' + IntToStr(cmbFiltroProjeto.KeyValue);

  if not VarIsNull(cmbFiltroColaborador.KeyValue) then
    WhereClause := WhereClause + ' AND t.ID_colaborador = ' + IntToStr(cmbFiltroColaborador.KeyValue);

  SQL := 'SELECT t.ID, t.nome, t.ID_projeto, p.nome AS Projeto, t.ID_colaborador, c.nome AS Responsavel, t.status, t.data_conclusao FROM Tarefas t JOIN Colaboradores c ON c.ID = t.ID_colaborador JOIN Projetos p ON p.ID = t.ID_projeto';
  if WhereClause <> '' then
    SQL := SQL + ' WHERE ' + Copy(WhereClause, 6, Length(WhereClause));

  DM.QryTarefas.Close;
  DM.QryTarefas.SQL.Text := SQL;
  DM.QryTarefas.Open;
end;


constructor TFrameTarefa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryTarefas.Open;
  DM.QryProjetos.Open;
  FDAO := TTarefaDAO.Create(DM.ADOConnection1);
  FController := TTarefasControl.Create(FDAO);
end;




procedure TFrameTarefa.edtBuscaTarefaChange(Sender: TObject);
begin
  AplicarFiltro;
end;

end.
