unit Un_TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Data.DB, Vcl.Grids, Vcl.DBGrids, uFrameColaboradores,
  JvExControls, JvLabel, uFrameProjeto, Vcl.StdCtrls, Vcl.Buttons, uFrameTarefas,JvExButtons,
  JvBitBtn, JvShape;

type
  TFrmTelaPrincipal = class(TForm)
    jpnlPrincipal: TJvPanel;
    jpnlMenuLateral: TJvPanel;
    jpnl_Conteudo: TJvPanel;
    jpnlInfo: TJvPanel;
    lblInfo: TJvLabel;
    jpnlTopo: TJvPanel;
    JvPanel1: TJvPanel;
    btnProjetos: TJvBitBtn;
    btnColaboradores: TJvBitBtn;
    btnTarefas: TJvBitBtn;

    procedure btnProjetosClick(Sender: TObject);
    procedure btnColaboradoresClick(Sender: TObject);
    procedure btnTarefasClick(Sender: TObject);
  private
    { Private declarations }
    FFrameAtual: TFrame;
    procedure AbrirModulo(const NomeModulo: string);
  public
    { Public declarations }
  end;

var
  FrmTelaPrincipal: TFrmTelaPrincipal;

implementation

{$R *.dfm}





procedure TFrmTelaPrincipal.AbrirModulo(const NomeModulo: string);
begin
  if Assigned(FFrameAtual) then
    FFrameAtual.Free;

  if NomeModulo = 'Colaboradores' then
    FFrameAtual := TFrameColaboradores.Create(Self)
  else if NomeModulo = 'Projetos' then
    FFrameAtual := TFrameProjeto.Create(Self)
  else if NomeModulo = 'Tarefas' then
    FFrameAtual := TFrameTarefa.Create(self);

  FFrameAtual.Parent := jpnl_Conteudo;
  FFrameAtual.Align := alClient;
end;

procedure TFrmTelaPrincipal.btnProjetosClick(Sender: TObject);
begin
  AbrirModulo('Projetos');
end;

procedure TFrmTelaPrincipal.btnColaboradoresClick(Sender: TObject);
begin
  AbrirModulo('Colaboradores');
end;

procedure TFrmTelaPrincipal.btnTarefasClick(Sender: TObject);
begin
  AbrirModulo('Tarefas');
end;

end.
