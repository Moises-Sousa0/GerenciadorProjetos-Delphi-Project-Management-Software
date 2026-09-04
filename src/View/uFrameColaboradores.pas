unit uFrameColaboradores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, DMPrincipal, Vcl.StdCtrls, uColaboradorDAO, uColaboradorControl,
  Vcl.Buttons, JvExButtons, JvButtons, JvBitBtn, JvExControls, JvSpeedButton, System.UITypes, uFormColaboradores;

type
  TFrameColaboradores = class(TFrame)
    JvDBGrid1: TJvDBGrid;
    jpnlConteudoColab: TJvPanel;
    jpnlMenuColab: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnEditar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: TColaboradorDAO;
    FController: TColaboradorControl;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}


procedure TFrameColaboradores.btnAdicionarClick(Sender: TObject);
var
  Resultado: TModalResult;
begin
  with TFormColaborador.Create(nil) do
  try
    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      FController.Adicionar(edtNome.Text, edtSenha.Text, cmbStatus.Text);
      DM.QryColaboradores.Close;
      DM.QryColaboradores.Open;
    end;

  finally
    Free;
  end;

end;


procedure TFrameColaboradores.btnEditarClick(Sender: TObject);
var
  Resultado: TModalResult;
  IdAtual: Integer;
  NomeAtual, SenhaAtual, StatusAtual: string;
begin

  IdAtual := DM.QryColaboradores.FieldByName('ID').AsInteger;
  NomeAtual := DM.QryColaboradores.FieldByName('nome').AsString;
  SenhaAtual := DM.QryColaboradores.FieldByName('senha').AsString;
  StatusAtual := DM.QryColaboradores.FieldByName('status').AsString;

  with TFormColaborador.Create(nil) do
  try

    CarregarDados(NomeAtual, SenhaAtual, StatusAtual);

    Resultado := ShowModal;

    if Resultado = mrOk then
    begin
      FController.Editar(IdAtual, edtNome.Text, edtSenha.Text, cmbStatus.Text);
      DM.QryColaboradores.Close;
      DM.QryColaboradores.Open;
    end;
  finally
    Free;
  end;
end;


procedure TFrameColaboradores.btnExcluirClick(Sender: TObject);
var
  IdAtual: Integer;
begin
  IdAtual := DM.QryColaboradores.FieldByName('ID').AsInteger;

  if MessageDlg('Tem certeza que deseja excluir este colaborador?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Excluir(IdAtual);

    DM.QryColaboradores.Close;
    DM.QryColaboradores.Open;
  end;

end;

constructor TFrameColaboradores.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryColaboradores.Open;
  FDAO := TColaboradorDAO.Create(DM.ADOConnection1);
  FController := TColaboradorControl.Create(FDAO);
end;


end.
