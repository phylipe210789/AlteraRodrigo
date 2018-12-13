unit U_novo_alt_Socio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.ImgList, Data.Win.ADODB;

type
  Tfrm_novo_alt_Socio = class(TForm)
    DBedit_ruaSocio: TDBEdit;
    bt_cancelSocio: TButton;
    bt_salvarSocio: TButton;
    DBedit_telSocio: TDBEdit;
    DBedit_cidSocio: TDBEdit;
    DBedit_cepSocio: TDBEdit;
    DBedit_ufSocio: TDBEdit;
    DBedit_compSocio: TDBEdit;
    DBedit_cpfSocio: TDBEdit;
    DBedit_bairroSocio: TDBEdit;
    DBedit_codSocio: TDBEdit;
    DBedit_nomeSocio: TDBEdit;
    lb_telSocio: TLabel;
    lb_cidSocio: TLabel;
    lb_cepSocio: TLabel;
    lb_ufSocio: TLabel;
    lb_compSocio: TLabel;
    lb_cpfSocio: TLabel;
    lb_bairroSocio: TLabel;
    Label3: TLabel;
    lb_codSocio: TLabel;
    lb_ruaSocio: TLabel;
    lb_nomeSocio: TLabel;
    DS: TDataSource;
    Icones: TImageList;
    qryContCodigo: TADOQuery;
    qryContCodigoValorMax: TIntegerField;
    dsContador: TDataSource;
    procedure bt_salvarSocioClick(Sender: TObject);
    procedure bt_cancelSocioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Socio: Tfrm_novo_alt_Socio;

implementation

{$R *.dfm}

uses U_DmValida;

procedure Tfrm_novo_alt_Socio.bt_cancelSocioClick(Sender: TObject);
begin
      if DS.State in [dsInsert, dsEdit] then
        DS.DataSet.Cancel;
        close;
end;

procedure Tfrm_novo_alt_Socio.bt_salvarSocioClick(Sender: TObject);
const
  SQL_VALIDA =
    ' SELECT       '+
    '   *          '+
    ' FROM         '+
    '   Socios '+
    ' WHERE        '+
    '   %s ';

var
  SQL, SQL1 : String;

begin

  SQL := Format(SQL_VALIDA, ['Nome =  '+QuotedStr(DBedit_nomeSocio.Text)+' AND CodigoSocio <> '+
                             InttoStr(ds.DataSet.FieldByName('CodigoSocio').AsInteger)]);

  SQL1 := Format(SQL_VALIDA, ['CPF = '+QuotedStr(DBedit_cpfSocio.Text)+' AND CodigoSocio <> '+
                              InttoStr(ds.DataSet.FieldByName('CodigoSocio').AsInteger)]);

  if DBedit_nomeSocio.Text = '' then
  begin
    ShowMessage('O campo "Nome" não pode ficar vazio!');
    DBedit_nomeSocio.SetFocus;
  end
  else if DBedit_cpfSocio.Text = '' then
  begin
    ShowMessage('O campo "CPF" não pode ficar vazio!');
    DBedit_cpfSocio.SetFocus;
  end
  else if DBedit_telSocio.Text = '' then
  begin
    ShowMessage('O campo "Tel." não pode ficar vazio!');
    DBedit_telSocio.SetFocus;
  end
  else if DBedit_ruaSocio.Text = '' then
  begin
    ShowMessage('O campo "Rua" não pode ficar vazio!');
    DBedit_ruaSocio.SetFocus;
  end
  else if DBedit_compSocio.Text = '' then
  begin
    ShowMessage('O campo "Comp." não pode ficar vazio!');
    DBedit_compSocio.SetFocus;
  end
  else if DBedit_bairroSocio.Text = '' then
  begin
    ShowMessage('O campo "Bairro" não pode ficar vazio!');
    DBedit_bairroSocio.SetFocus;
  end
  else if DBedit_cidSocio.Text = '' then
  begin
    ShowMessage('O campo "Cidade" não pode ficar vazio!');
    DBedit_cidSocio.SetFocus;
  end
  else if DBedit_ufSocio.Text = '' then
  begin
    ShowMessage('O campo "U.F." não pode ficar vazio!');
    DBedit_ufSocio.SetFocus;
  end
  else if DBedit_cepSocio.Text = '' then
  begin
    ShowMessage('O campo "CEP" não pode ficar vazio!');
    DBedit_cepSocio.SetFocus;
  end
  else if dmValida.Validacao(SQL) then
  begin
    ShowMessage('Já existe um Socio com esse nome!');
    DBedit_nomeSocio.SetFocus;
  end
  else if dmValida.Validacao(SQL1) then
  begin
    ShowMessage('Já existe um Socio com esse CPF!');
    DBedit_cpfSocio.SetFocus;
  end
  else if DS.State in [dsInsert] then
  begin
    qryContCodigo.Open;
    ds.DataSet.FieldByName('codSoc').Value :=  qryContCodigoValorMax.Value;
    DS.DataSet.Post;
    qryContCodigo.Close;
    ShowMessage('Cadastro Realizado com Sucesso!');
    Close;
  end
  else if DS.State in [dsEdit] then
  begin
    DS.DataSet.Post;
    ShowMessage('Cadastro Alterado com Sucesso!');
    Close;
  end;

end;

procedure Tfrm_novo_alt_Socio.FormClose(Sender: TObject;
var Action: TCloseAction);
begin

  if DS.State in [dsInsert, dsEdit] then
    DS.DataSet.Cancel;

end;

procedure Tfrm_novo_alt_Socio.FormCreate(Sender: TObject);
begin

  if DS.State in [dsEdit] then
    Caption := 'Alteração de Socio'
  else
    Caption := 'Cadastro de Socio';

end;

end.
