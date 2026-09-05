program GerenciadorProjetos;

uses
  Vcl.Forms,
  Un_TelaPrincipal in 'src\View\Un_TelaPrincipal.pas' {FrmTelaPrincipal},
  DMPrincipal in 'src\Model\DMPrincipal.pas' {DM: TDataModule},
  uFrameColaboradores in 'src\View\uFrameColaboradores.pas' {FrameColaboradores: TFrame},
  uColaboradorDAO in 'src\Model\DAO\uColaboradorDAO.pas' {Form1},
  {$R}
  {$R}
  {$R}
  {$R}
  {$R}
  {$R}
  uColaboradorControl in 'src\Controller\uColaboradorControl.pas' {$R *.res},
  uFormColaboradores in 'src\View\uFormColaboradores.pas' {FormColaborador},
  uProjetoDAO in 'src\Model\DAO\uProjetoDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmTelaPrincipal, FrmTelaPrincipal);
  Application.CreateForm(TFormColaborador, FormColaborador);
  Application.Run;
end.
