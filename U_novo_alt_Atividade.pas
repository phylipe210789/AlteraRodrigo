unit U_novo_alt_Atividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ImgList, Data.Win.ADODB;

type
  Tfrm_novo_alt_Atividade = class(TForm)
    DBedit_valorAtividade: TDBEdit;
    lb_cpfSocio: TLabel;
    DBedit_nomeAtividade: TDBEdit;
    lb_nomeSocio: TLabel;
    DBedit_codAtividade: TDBEdit;
    lb_codSocio: TLabel;
    bt_salvarSocio: TButton;
    bt_cancelSocio: TButton;
    DS: TDataSource;
    Icones: TImageList;
    qryContCodigo: TADOQuery;
    dsContador: TDataSource;
    qryContCodigoValorMax: TIntegerField;
    procedure bt_cancelSocioClick(Sender: TObject);
    procedure bt_salvarSocioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Atividade: Tfrm_novo_alt_Atividade;

implementation

{$R *.dfm}

procedure Tfrm_novo_alt_Atividade.bt_cancelSocioClick(Sender: TObject);
begin
  if DS.State in [dsInsert, dsEdit] then
    DS.DataSet.Cancel;
    Close;

end;

procedure Tfrm_novo_alt_Atividade.bt_salvarSocioClick(Sender: TObject);
begin

  if DBedit_nomeAtividade.Text = '' then
  begin
    ShowMessage('O campo "Atividade" não pode ficar vazio!');
    DBedit_nomeAtividade.SetFocus;
  end
  else if DBedit_valorAtividade.Text = '' then
  begin
    ShowMessage('O campo "Valor" não pode ficar vazio!');
    DBedit_valorAtividade.SetFocus;
  end
  else if DS.State in [dsInsert] then
  begin
    qryContCodigo.Open;
    ds.DataSet.FieldByName('codAtiv').Value :=  qryContCodigoValorMax.Value;
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

procedure Tfrm_novo_alt_Atividade.FormClose(Sender: TObject;
var Action: TCloseAction);

begin

  if DS.State in [dsInsert, dsEdit] then
    DS.DataSet.Cancel;

end;

procedure Tfrm_novo_alt_Atividade.FormCreate(Sender: TObject);
begin

  if DS.State in [dsEdit] then
    Caption := 'Alteração de Atividade'
  else
    Caption := 'Cadastro de Atividade';

end;

end.
