unit DMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.IniFiles;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    QryColaboradores: TADOQuery;
    DsColaboradores: TDataSource;
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
