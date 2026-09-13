unit uFrameProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProjetoDAO, Data.DB, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, uFormGerenciadorProjetos, JvExButtons, JvBitBtn, uProjetoControl, DMPrincipal, uFormProjeto,
  JvExStdCtrls, JvEdit, JvExControls, JvDBLookup, JvCombobox;

type
  TFrameProjeto = class(TFrame)
    jpnlConteudoProjetos: TJvPanel;
    jpnlMenuColab: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    btnGrProjeto: TJvBitBtn;
    JvPanel1: TJvPanel;
    btnLimparFiltroProjeto: TJvBitBtn;
    edtBuscaProjeto: TJvEdit;
    cmbFiltroStatus: TJvComboBox;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnGrProjetoClick(Sender: TObject);
    procedure edtBuscaProjetoChange(Sender: TObject);
    procedure cmbFiltroStatusChange(Sender: TObject);
    procedure btnLimparFiltroProjetoClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: TProjetoDAO;
    FController: TProjetoControl;
    FIdAtual: Integer;
    FFormGerencP: TGerenciadorProj;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AplicarFiltroProjeto;
  end;



implementation

{$R *.dfm}



procedure TFrameProjeto.btnAdicionarClick(Sender: TObject);
var
  Resultado: TModalResult;
begin
  with TFormProjeto.Create(nil) do
  try
    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      FController.Adicionar(ObterIdResponsavel, ObterNome);
      DM.QryProjetos.Close;
      DM.QryProjetos.Open;
    end;

  finally
    Free;
  end;

end;

procedure TFrameProjeto.btnExcluirClick(Sender: TObject);
begin
  FIdAtual := DM.QryProjetos.FieldByName('ID').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir esse projeto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Excluir(FIdAtual);
    DM.QryProjetos.Close;
    DM.QryProjetos.Open;
  end;
end;

procedure TFrameProjeto.btnGrProjetoClick(Sender: TObject);
var
  Resultado: TModalResult;
  Nome, Status: String;
  ID_responsavel: Integer;
begin
  FIdAtual := DM.QryProjetos.FieldByName('ID').AsInteger;
  Nome := DM.QryProjetos.FieldByName('nome').AsString;
  Status := DM.QryProjetos.FieldByName('status').AsString;
  ID_responsavel := DM.QryProjetos.FieldByName('ID_criador').AsInteger;

  with TGerenciadorProj.Create(nil) do
  try
    CarregarProjeto(FIdAtual, Nome, ID_responsavel, Status);

    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      DM.QryProjetos.Close;
      DM.QryProjetos.Open;
    end;

  finally
    Free;
  end;
end;





procedure TFrameProjeto.AplicarFiltroProjeto;
var
  SQL, WhereClause: String;
begin
  WhereClause := '';

  if edtBuscaProjeto.Text <> '' then
    WhereClause := WhereClause + ' AND p.nome LIKE ''%' + edtBuscaProjeto.Text + '%''';

  if cmbFiltroStatus.Text <> 'Todos' then
    WhereClause := WhereClause + ' AND p.status = ''' + cmbFiltroStatus.Text + '''';

  SQL := 'SELECT p.ID, p.nome, p.ID_criador, c.nome AS responsavel, p.status, p.data_criacao, p.data_conclusao FROM Projetos p JOIN Colaboradores c ON c.ID = p.ID_criador';
  if WhereClause <> '' then
    SQL := SQL + ' WHERE ' + Copy(WhereClause, 6, Length(WhereClause));

  DM.QryProjetos.Close;
  DM.QryProjetos.SQL.Text := SQL;
  DM.QryProjetos.Open;
end;

constructor TFrameProjeto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryProjetos.Open;
  FDAO := TProjetoDAO.Create(DM.ADOConnection1);
  FController := TProjetoControl.Create(FDAO);
end;

procedure TFrameProjeto.edtBuscaProjetoChange(Sender: TObject);
begin
  AplicarFiltroProjeto;
end;

procedure TFrameProjeto.cmbFiltroStatusChange(Sender: TObject);
begin
  AplicarFiltroProjeto;
end;

procedure TFrameProjeto.btnLimparFiltroProjetoClick(Sender: TObject);
begin
  edtBuscaProjeto.Text := '';
  cmbFiltroStatus.ItemIndex := 0;
  AplicarFiltroProjeto;
end;

end.
