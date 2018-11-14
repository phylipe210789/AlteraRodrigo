unit U_DmCadastros;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Forms;

type
  TdmCadastros = class(TDataModule)
    dsCadSocio: TDataSource;
    qryCadSocio: TADOQuery;
    qryCadSocioCodigoSocio: TAutoIncField;
    qryCadSocioNome: TStringField;
    qryCadSocioEndereco: TStringField;
    qryCadSocioComplemento: TStringField;
    qryCadSocioBairro: TStringField;
    qryCadSocioCidade: TStringField;
    qryCadSocioEstado: TStringField;
    qryCadSocioCEP: TStringField;
    qryCadSocioTelefone: TStringField;
    qryCadSocioCPF: TStringField;
    dsCadAtividade: TDataSource;
    qryCadAtividade: TADOQuery;
    qryCadAtividadeCodigoAtividade: TAutoIncField;
    qryCadAtividadeNome: TStringField;
    qryCadAtividadeValor: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastros: TdmCadastros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udm;

{$R *.dfm}

procedure TdmCadastros.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
    if (Components[i] is TADOQuery) then
      TADOQuery(Components[i]).Open;
end;

procedure TdmCadastros.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
    if (Components[i] is TADOQuery) then
      TADOQuery(Components[i]).Close;
end;

initialization
    dmCadastros := TdmCadastros.Create(Application);

end.
