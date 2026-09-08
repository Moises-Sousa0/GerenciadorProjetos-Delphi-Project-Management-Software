unit uFrameProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProjetoDAO, Data.DB, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, uFormGerenciadorProjetos, JvExButtons, JvBitBtn, uProjetoControl, DMPrincipal, uFormProjeto;

type
  TFrameProjeto = class(TFrame)
    jpnlConteudoProjetos: TJvPanel;
    jpnlMenuColab: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    btnGrProjeto: TJvBitBtn;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnGrProjetoClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: TProjetoDAO;
    FController: TProjetoControl;
    FIdAtual: Integer;
    FFormGerencP: TGerenciadorProj;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
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

constructor TFrameProjeto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryProjetos.Open;
  FDAO := TProjetoDAO.Create(DM.ADOConnection1);
  FController := TProjetoControl.Create(FDAO);
end;

end.
