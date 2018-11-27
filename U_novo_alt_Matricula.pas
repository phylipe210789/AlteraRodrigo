unit U_novo_alt_Matricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.Mask;

type
  Tfrm_novo_alt_Matricula = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ds2: TDataSource;
    qry2: TADOQuery;
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
    ds3: TDataSource;
    qry3: TADOQuery;
    qry3CodigoAtividade: TAutoIncField;
    qry3Nome: TStringField;
    qry3Valor: TBCDField;
    ds4: TDataSource;
    qry4: TADOQuery;
    qry4id_matricula: TAutoIncField;
    qry4CodigoSocio: TIntegerField;
    qry4CodigoAtividade: TIntegerField;
    qry4socio: TStringField;
    qry4atividade: TStringField;
    bt_salvarSocio: TButton;
    bt_cancelSocio: TButton;
    DBedit_codSocio: TDBEdit;
    lb_codSocio: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Matricula: Tfrm_novo_alt_Matricula;

implementation

{$R *.dfm}

end.
