unit uFormGerenciarTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTarefasControl, uFormTarefas,DMPrincipal, uTarefaDAO,Data.DB, Data.Win.ADODB,
  JvExControls, JvDBLookup, Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn,
  JvExStdCtrls, JvEdit, JvLabel, Vcl.ExtCtrls, JvExExtCtrls, uProjetoColaboradoresDAO, JvExtComponent,
  JvPanel, JvCombobox;

type
  TGerenciarTaref = class(TForm)
    jpnlGerenciarTarefas: TJvPanel;
    lblNomeTarefa: TJvLabel;
    lblResponsavel: TJvLabel;
    edtNomeTarefa: TJvEdit;
    btnSalvar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    cmbResponsavel: TJvDBLookupCombo;
    cmbStatus: TJvComboBox;
    lblStatus: TJvLabel;
    DsColabProjetos: TDataSource;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FControlTarefas: TTarefasControl;
    FDAOProjColab: TProjetoColaboradores;
    FIdTarefaAtual: Integer;
    FIdProjetoAtual: Integer;
    FStatusOriginal: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure CarregarTarefa(ID_tarefa, ID_projeto, ID_responsavel: Integer; Nome, Status: string);
    function ObterStatusResponsavel: string;
end;

var
  GerenciarTaref: TGerenciarTaref;

implementation

{$R *.dfm}

procedure TGerenciarTaref.btnSalvarClick(Sender: TObject);
begin
  try
    FControlTarefas.Editar(FIdTarefaAtual, edtNomeTarefa.Text);
    FControlTarefas.EditarColaborador(cmbResponsavel.KeyValue, FIdTarefaAtual, ObterStatusResponsavel);

    if cmbStatus.Text = FStatusOriginal then
    begin

    end
    else if cmbStatus.Text = 'CONCLUIDA' then
      FControlTarefas.ConcluirTarefa(FIdTarefaAtual)
    else if cmbStatus.Text = 'PENDENTE' then
      FControlTarefas.Reabrir(FIdTarefaAtual);

    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TGerenciarTaref.CarregarTarefa(ID_tarefa, ID_projeto, ID_responsavel: Integer; Nome, Status: string);
begin
  FIdTarefaAtual := ID_tarefa;
  FIdProjetoAtual := ID_projeto;
  edtNomeTarefa.Text := Nome;
  cmbStatus.Text := Status;
  FStatusOriginal := Status;

  DsColabProjetos.DataSet := FDAOProjColab.ListarComStatus(ID_projeto);
  cmbResponsavel.KeyValue := ID_responsavel;
end;

constructor TGerenciarTaref.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FControlTarefas := TTarefasControl.Create(TTarefaDAO.Create(DM.ADOConnection1));
  FDAOProjCOlab := TProjetoColaboradores.Create(DM.ADOConnection1);
end;

function TGerenciarTaref.ObterStatusResponsavel: string;
begin
  DsColabProjetos.DataSet.Locate('ID', cmbResponsavel.KeyValue, []);
  Result := DsColabProjetos.DataSet.FieldByName('status').AsString;
end;

end.
