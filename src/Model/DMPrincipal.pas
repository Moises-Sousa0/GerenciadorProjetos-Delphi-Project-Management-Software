unit DMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles,
  JvDataSource, JvADOQuery;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    QryColaboradores: TADOQuery;
    DsColaboradores: TDataSource;
    DsProjetos: TDataSource;
    QryProjetos: TADOQuery;
    QryProjetosID: TAutoIncField;
    QryProjetosID_criador: TIntegerField;
    QryProjetosnome: TStringField;
    QryProjetosstatus: TStringField;
    QryProjetosdata_criacao: TWideStringField;
    QryProjetosdata_conclusao: TWideStringField;
    QryProjetosresponsavel: TStringField;
    QryTarefas: TADOQuery;
    DsTarefas: TDataSource;
    DsDashBoard: TDataSource;
    QryDashboard: TADOQuery;
    QryDashboardID: TIntegerField;
    QryDashboardnome: TStringField;
    QryDashboardstatus: TStringField;
    QryDashboarddata_criacao: TWideStringField;
    QryDashboarddata_conclusao: TWideStringField;
    QryDashboardtotal_tarefas: TIntegerField;
    QryDashboardtarefas_concluidas: TIntegerField;
    QryDashboardtarefas_pendentes: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFIle.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    AdoConnection1.ConnectionString :=
      'Provider=SQLOLEDB.1;Password=' + Ini.ReadString('Database', 'Password', '') +
      ';Persist Security Info=True;User ID=' + Ini.ReadString('Database', 'User', '') +
      ';Initial Catalog=' + Ini.ReadString('Database', 'Database', '') +
      ';Data Source=' + Ini.ReadString('Database', 'Server', 'LOCALHOST');
    ADOConnection1.Connected := True;
  finally
    Ini.Free;
  end;
end;

end.
