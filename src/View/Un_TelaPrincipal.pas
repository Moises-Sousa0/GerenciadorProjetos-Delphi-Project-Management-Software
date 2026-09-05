unit Un_TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Data.DB, Vcl.Grids, Vcl.DBGrids, uFrameColaboradores,
  JvExControls, JvLabel;

type
  TFrmTelaPrincipal = class(TForm)
    jpnlPrincipal: TJvPanel;
    jpnl_MenuTop: TJvPanel;
    jpnlMenuLateral: TJvPanel;
    jpnl_Conteudo: TJvPanel;
    jpnlInfo: TJvPanel;
    lblInfo: TJvLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FrameColab: TFrameColaboradores;
  public
    { Public declarations }
  end;

var
  FrmTelaPrincipal: TFrmTelaPrincipal;

implementation

{$R *.dfm}

uses DMPrincipal;



procedure TFrmTelaPrincipal.FormCreate(Sender: TObject);
begin
  FrameColab := TFrameColaboradores.Create(Self);
  FrameColab.Parent := jpnl_Conteudo;
  FrameColab.Align := alClient;
end;

end.
