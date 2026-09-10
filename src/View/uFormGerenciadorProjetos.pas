unit uFormGerenciadorProjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, JvExButtons, JvBitBtn, JvExStdCtrls, JvCombobox, JvEdit,
  JvExControls, JvLabel, JvDBLookup, DMPrincipal, Data.DB, Data.Win.ADODB, uProjetoControl,uProjetoColaboradoresControl, uProjetoDAO, uProjetoColaboradoresDAO,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TGerenciadorProj = class(TForm)
    pnlConteudoGerencproj: TJvPanel;
    pControlGerenc: TJvPageControl;
    tabDadosProj: TTabSheet;
    tabColab: TTabSheet;
    edtNomeProjeto: TJvEdit;
    btnSalvar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    lblNomeProjeto: TJvLabel;
    lblNomeResponsavel: TJvLabel;
    cmbResponsavel: TJvDBLookupCombo;
    cmbStatus: TJvComboBox;
    lblStatus: TJvLabel;
    dsColaboradoresProjeto: TDataSource;
    grid: TJvDBGrid;
    cmbColaboradores: TJvDBLookupCombo;
    lblColaboradores: TJvLabel;
    btnAdicionarColab: TJvBitBtn;
    btnRemoverColab: TJvBitBtn;
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarColabClick(Sender: TObject);
    procedure btnRemoverColabClick(Sender: TObject);
  private
    { Private declarations }
    FIDProjeto: Integer;
    FResponsavelOriginal: Integer;
    FStatusOriginal: String;
    FControlProjColab: TProjetoColaboradoresControl;
    FControlProj: TProjetoControl;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure CarregarProjeto(ID_projeto: Integer; Nome: String; ID_responsavel: Integer; Status: String);
  end;

var
  GerenciadorProj: TGerenciadorProj;

implementation

{$R *.dfm}



constructor TGerenciadorProj.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryColaboradores.Open;
  FControlProj := TProjetoControl.Create(TProjetoDAO.Create(DM.ADOConnection1));
  FControlProjColab := TProjetoCOlaboradoresControl.Create(TProjetoColaboradores.Create(DM.ADOConnection1));
end;

procedure TGerenciadorProj.btnAdicionarColabClick(Sender: TObject);
begin
  DM.QryColaboradores.Locate('ID', cmbColaboradores.KeyValue, []);
  FControlProjColab.Inserir(FIDProjeto,cmbColaboradores.KeyValue, DM.QryColaboradores.FieldByName('status').AsString);
  dsColaboradoresProjeto.DataSet := FControlProjColab.Listar(FIDProjeto);
end;

procedure TGerenciadorProj.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TGerenciadorProj.btnRemoverColabClick(Sender: TObject);
var
  IdAtual: Integer;
begin
  IdAtual := dsColaboradoresProjeto.DataSet.FieldByName('ID').AsInteger;
  FCOntrolProjCOlab.Excluir(FIDProjeto, IdAtual);
  dsColaboradoresProjeto.DataSet := FControlProjColab.Listar(FIDProjeto);
end;

procedure TGerenciadorProj.btnSalvarClick(Sender: TObject);
begin
  FControlProj.Atualizar(FIDProjeto, edtNomeProjeto.Text);
  FControlProj.AtualizarResponsavel(FIDProjeto, cmbResponsavel.KeyValue);

  if cmbResponsavel.KeyValue = FResponsavelOriginal then
  begin

  end
  else if cmbResponsavel.KeyValue <> FResponsavelOriginal then
  begin
    DM.QryColaboradores.Locate('ID', cmbResponsavel.KeyValue, []);
    FControlProjColab.Excluir(FIDProjeto, FResponsavelOriginal);
    FControlProjColab.Inserir(FIDProjeto, cmbResponsavel.KeyValue,  DM.QryColaboradores.FieldByName('status').AsString);
  end;


  if cmbStatus.Text = FStatusOriginal then
  begin
    //se o status continua o mesmo nao muda nada
  end
  else if cmbStatus.Text = 'CONCLUIDO' then
  begin
    FControlProj.Concluir(FIDProjeto)
  end
  else if cmbStatus.Text = 'EM_PROCESSO'  then
  begin
    FControlProj.Reabrir(FIDProjeto);
  end;
  ModalResult := mrOK;
end;


procedure TGerenciadorProj.CarregarProjeto(ID_projeto: Integer; Nome: string; ID_responsavel: Integer; Status: string);
begin
  FIDProjeto := ID_projeto;
  edtNomeProjeto.Text := Nome;
  cmbStatus.Text := Status;
  cmbResponsavel.KeyValue := ID_responsavel;
  FStatusOriginal := Status;
  FResponsavelOriginal := ID_Responsavel;
  dsColaboradoresProjeto.DataSet := FControlProjColab.Listar(FIDProjeto);
end;

end.
