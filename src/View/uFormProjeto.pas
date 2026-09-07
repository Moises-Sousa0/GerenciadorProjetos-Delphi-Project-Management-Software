unit uFormProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JvExButtons,
  JvBitBtn, JvExStdCtrls, JvCombobox, JvEdit, JvExControls, JvLabel,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvDBLookup, DMPrincipal;

type
  TFormProjeto = class(TForm)
    jpnlCadastroEdicao: TJvPanel;
    lblNomeProjeto: TJvLabel;
    lblResponsavel: TJvLabel;
    edtNomeProjeto: TJvEdit;
    btnSalvar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    cmbResponsavel: TJvDBLookupCombo;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function ObterNome: String;
    function ObterIdResponsavel: Integer;
  end;

var
  FormProjeto: TFormProjeto;

implementation

{$R *.dfm}

function TFormProjeto.ObterNome: string;
begin
  Result := edtNomeProjeto.Text;
end;




procedure TFormProjeto.FormShow(Sender: TObject);
begin
  DM.QryColaboradores.Close;
  DM.QryColaboradores.Open;
end;

function TFormProjeto.ObterIdResponsavel: Integer;
begin
  Result := cmbResponsavel.KeyValue;
end;

procedure TFormProjeto.btnSalvarClick(Sender: TObject);
begin
  if (edtNomeProjeto.Text = '') or (VarIsNull(cmbResponsavel.KeyValue)) then
  begin
    ShowMessage('Preencha todos os campos.');
    Exit;
  end;
  ModalResult := mrOk;
end;


end.
