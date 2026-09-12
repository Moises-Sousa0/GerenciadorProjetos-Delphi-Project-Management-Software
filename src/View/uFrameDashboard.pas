unit uFrameDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, DMPrincipal;

type
  TFrameDashboard = class(TFrame)
    jpnlMenuDash: TJvPanel;
    JvDBGrid1: TJvDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrameDashboard: TFrameDashboard;

implementation

{$R *.dfm}

constructor TFrameDashboard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM.QryDashboard.Open;
end;

end.
