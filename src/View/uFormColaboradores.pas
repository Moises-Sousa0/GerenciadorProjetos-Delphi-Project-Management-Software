unit uFormColaboradores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvExControls, JvLabel, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, JvEdit, Vcl.Buttons, JvExButtons, JvBitBtn;

type
  TFormColaborador = class(TForm)
    jpnlCadastroEdicao: TJvPanel;
    lblNome: TJvLabel;
    edtNome: TJvEdit;
    edtSenha: TJvEdit;
    lblSenha: TJvLabel;
    lblStatus: TJvLabel;
    cmbStatus: TJvComboBox;
    btnSalvar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarDados(const Nome, Senha, Status: String);
  end;

var
  FormColaborador: TFormColaborador;

implementation

{$R *.dfm}

procedure TFormColaborador.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormColaborador.btnSalvarClick(Sender: TObject);
begin
  if (edtNome.Text = '') or (edtSenha.Text = '') or (cmbStatus.Text = '') then
  begin
    ShowMessage('Preencha todos os campos.');
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TFormColaborador.CarregarDados(const Nome, Senha, Status: String);
begin
  edtNome.Text := Nome;
  edtSenha.Text := Senha;
  cmbStatus.Text := Status;
end;

end.
