unit U_consultaMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ImgList;

type
  Tfrm_consultaMatricula = class(TForm)
    ToolBar1: TToolBar;
    bt_cadSocio: TToolButton;
    bt_altSocio: TToolButton;
    bt_excSoscio: TToolButton;
    Icones: TImageList;
    Panel1: TPanel;
    bt_pesqSoscio: TButton;
    edit_pesquisa: TEdit;
    rg_filtros: TRadioGroup;
    DBGrid1: TDBGrid;
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
    ds2: TDataSource;
    ds3: TDataSource;
    qry3: TADOQuery;
    qry3CodigoAtividade: TAutoIncField;
    qry3Nome: TStringField;
    qry3Valor: TBCDField;
    qry4: TADOQuery;
    qry4id_matricula: TAutoIncField;
    qry4CodigoSocio: TIntegerField;
    qry4CodigoAtividade: TIntegerField;
    qry4socio: TStringField;
    qry4atividade: TStringField;
    ds4: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cadSocioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consultaMatricula: Tfrm_consultaMatricula;

implementation

{$R *.dfm}

uses Udm, U_novo_alt_Matricula;

procedure Tfrm_consultaMatricula.bt_cadSocioClick(Sender: TObject);
begin

   with Tfrm_novo_alt_Matricula.Create(Application) do
   try
      qry4.Open;
      qry4.Insert;
      showmodal;
   finally
     free;
   end;

end;

procedure Tfrm_consultaMatricula.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
         //qry2.Close;
         //qry3.Close;
         //qry4.Close;
         //DBLookupComboBox1.SetFocus;
end;

procedure Tfrm_consultaMatricula.FormCreate(Sender: TObject);
begin
      //qry2.Open;
      //qry3.Open;
      //qry4.Open;
      //DBLookupComboBox1.KeyValue := 0;
      //DBLookupComboBox2.KeyValue := 0;
end;

end.
