unit uFrameProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProjetoDAO, Data.DB, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn, uProjetoControl, DMPrincipal;

type
  TFrameProjeto = class(TFrame)
    JvDBGrid1: TJvDBGrid;
    jpnlConteudoProjetos: TJvPanel;
    jpnlMenuColab: TJvPanel;
    btnAdicionar: TJvBitBtn;
    btnEditar: TJvBitBtn;
    btnExcluir: TJvBitBtn;
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
constructor TFrameProjeto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryProjetos.Open;
  FDAO := TProjetoDAO.Create(DM.ADOConnection1);
  FController := TProjetoControl.Create(FDAO);
end;

end.
