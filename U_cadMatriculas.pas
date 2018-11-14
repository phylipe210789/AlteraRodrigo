unit U_cadMatriculas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_cadMatriculas = class(TForm)
    qry2: TADOQuery;
    ds2: TDataSource;
    qry3: TADOQuery;
    ds3: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ds4: TDataSource;
    qry4: TADOQuery;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox2: TDBLookupComboBox;
    qry2CodigoSocio: TAutoIncField;
    qry2Nome: TStringField;
    qry2Endereco: TStringField;
    qry2Complemento: TStringField;
    qry2Bairro: TStringField;
    qry2Cidade: TStringField;
    qry2Estado: TStringField;
    qry2CEP: TStringField;
    qry2Telefone: TStringField;
    qry2CPF: TStringField;
    qry3CodigoAtividade: TAutoIncField;
    qry3Nome: TStringField;
    qry3Valor: TBCDField;
    qry4id_matricula: TAutoIncField;
    qry4CodigoSocio: TIntegerField;
    qry4CodigoAtividade: TIntegerField;
    DBGrid1: TDBGrid;
    qry4socio: TStringField;
    qry4atividade: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadMatriculas: Tfrm_cadMatriculas;

implementation

{$R *.dfm}

uses Udm;

procedure Tfrm_cadMatriculas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
         qry2.Close;
         qry3.Close;
         qry4.Close;
         DBLookupComboBox1.SetFocus;
end;

procedure Tfrm_cadMatriculas.FormCreate(Sender: TObject);
begin
      qry2.Open;
      qry3.Open;
      qry4.Open;
      DBLookupComboBox1.KeyValue := 0;
      DBLookupComboBox2.KeyValue := 0;
end;

end.
