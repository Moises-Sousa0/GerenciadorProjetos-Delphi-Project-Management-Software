unit uFormTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvDBLookup, Vcl.StdCtrls,
  Vcl.Buttons, JvExButtons, JvBitBtn, JvExStdCtrls, JvEdit, JvLabel,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, DMPrincipal, Data.DB, Data.Win.ADODB, uProjetoColaboradoresDAO;

type
  TFormTarefas = class(TForm)
    jpnlCadastroEdicao: TJvPanel;
    lblNomeTarefa: TJvLabel;
    lblResponsavel: TJvLabel;
    edtNomeTarefa: TJvEdit;
    btnSalvar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    cmbResponsavel: TJvDBLookupCombo;
    cmbProjetoTarefa: TJvDBLookupCombo;
    lblProjeto: TJvLabel;
    DsColabProjeto: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cmbProjetoTarefaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDAOProjColab: TProjetoColaboradores;
  public
    { Public declarations }
    function ObterNome: String;
    function ObterIdResponsavel: Integer;
    function ObterIDprojeto: Integer;
    function ObterStatusResponsavel: String;

  end;

var
  FormTarefas: TFormTarefas;

implementation

{$R *.dfm}

function TFormTarefas.ObterNome: string;
begin
  Result := edtNomeTarefa.Text;
end;

function TFormTarefas.ObterIdResponsavel: Integer;
begin
  Result := cmbResponsavel.KeyValue;
end;

function TFormTarefas.ObterIDprojeto: Integer;
begin
  Result := cmbProjetoTarefa.KeyValue;
end;

function TFormTarefas.ObterStatusResponsavel: string;
begin
  DM.QryColaboradores.Locate('ID', ObterIDResponsavel, []);
  Result := DM.QryColaboradores.FieldByName('status').AsString;
end;



procedure TFormTarefas.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TFormTarefas.btnSalvarClick(Sender: TObject);
begin
  if (edtNomeTarefa.Text = '') or (VarIsNull(cmbResponsavel.KeyValue)) or (VarIsNull(cmbProjetoTarefa.KeyValue)) then
  begin
    ShowMessage('Preencha todos os campos.');
    Exit;
  end;
  ModalResult := mrOk;
end;


procedure TFormTarefas.cmbProjetoTarefaChange(Sender: TObject);
begin
  if Assigned(DsColabProjeto.DataSet) then
    DsColabProjeto.DataSet.Free;

  DsColabProjeto.DataSet := FDAOProjColab.ListarComStatus(ObterIdProjeto);
end;



procedure TFormTarefas.FormCreate(Sender: TObject);
begin
  FDAOProjColab := TProjetoColaboradores.Create(DM.ADOConnection1);
end;

procedure TFormTarefas.FormShow(Sender: TObject);
begin
  DM.QryTarefas.Close;
  DM.QryTarefas.Open;
end;



end.


