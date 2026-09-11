unit uFrameTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTarefasControl, uFormTarefas, uTarefaDAO, DMPrincipal,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel;

type
    TFrameTarefa = class(TFrame)
    jpnlConteudoTarefas: TJvPanel;
    jpnlMenu: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    btnGerenciarTarefa: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    FController: TTarefasControl;
    FDAO: TTarefaDAO;
    FIdAtual: Integer;
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

constructor TFrameTarefa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryTarefas.Open;
  DM.QryProjetos.Open;
  FDAO := TTarefaDAO.Create(DM.ADOConnection1);
  FController := TTarefasControl.Create(FDAO);
end;




end.
