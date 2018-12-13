unit U_DmValida;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Forms;

type
  TdmValida = class(TDataModule)
    qryValidaAtiv: TADOQuery;
    dsValidaSoc: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function Validacao (SQL_VALIDACAO: String) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmValida: TdmValida;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udm;

{$R *.dfm}


{ TdmConsulta }

procedure TdmValida.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
    if (Components[i] is TADOQuery) then
      TADOQuery(Components[i]).Open;
end;

procedure TdmValida.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
    if (Components[i] is TADOQuery) then
      TADOQuery(Components[i]).Close;
end;

function TdmValida.Validacao(SQL_VALIDACAO: String): Boolean;
begin

  qryValidaAtiv.Close;
  qryValidaAtiv.SQL.Clear;
  qryValidaAtiv.SQL.Add(SQL_VALIDACAO);
  qryValidaAtiv.Open;

  if not qryValidaAtiv.IsEmpty then
    Result := True
  else
    Result := False;

end;

initialization
    dmValida := TdmValida.Create(Application);

end.
