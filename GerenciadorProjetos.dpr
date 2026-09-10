program GerenciadorProjetos;

uses
  Vcl.Forms,
  Un_TelaPrincipal in 'src\View\Un_TelaPrincipal.pas' {FrmTelaPrincipal},
  DMPrincipal in 'src\Model\DMPrincipal.pas' {DM: TDataModule},
  uFrameColaboradores in 'src\View\uFrameColaboradores.pas' {FrameColaboradores: TFrame},
  uColaboradorDAO in 'src\Model\DAO\uColaboradorDAO.pas',
  uFormColaboradores in 'src\View\uFormColaboradores.pas' {FormColaborador: TFormColaborador},
  uFrameProjeto in 'src\View\uFrameProjeto.pas' {FrameProjeto: TFrame},
  uProjetoControl in 'src\Controller\uProjetoControl.pas',
  uProjetoDAO in 'src\Model\DAO\uProjetoDAO.pas',
  uColaboradorControl in 'src\Controller\uColaboradorControl.pas',
  uFormProjeto in 'src\View\uFormProjeto.pas' {FormProjeto: TFormProjeto},
  uProjetoColaboradoresDAO in 'src\Model\DAO\uProjetoColaboradoresDAO.pas',
  uProjetoColaboradoresControl in 'src\Controller\uProjetoColaboradoresControl.pas',
  uFormGerenciadorProjetos in 'src\View\uFormGerenciadorProjetos.pas' {TGerenciadorProj: erenciadorProj},
  uTarefaDAO in 'src\Model\DAO\uTarefaDAO.pas',
  uTarefasControl in 'src\Controller\uTarefasControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmTelaPrincipal, FrmTelaPrincipal);
  Application.CreateForm(TGerenciadorProj, GerenciadorProj);
  Application.Run;
end.
