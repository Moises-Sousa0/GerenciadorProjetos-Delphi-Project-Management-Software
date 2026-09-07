unit uFrameProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProjetoDAO, Data.DB, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn, uProjetoControl, DMPrincipal, uFormProjeto;

type
  TFrameProjeto = class(TFrame)
    jpnlConteudoProjetos: TJvPanel;
    jpnlMenuColab: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnEditar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: TProjetoDAO;
    FController: TProjetoControl;

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
var
  IdAtual: Integer;
begin
  IdAtual := DM.QryProjetos.FieldByName('ID').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir esse projeto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Excluir(IdAtual);
    DM.QryProjetos.Close;
    DM.QryProjetos.Open;
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
