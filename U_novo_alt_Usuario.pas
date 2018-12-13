unit U_novo_alt_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.ImgList, Data.Win.ADODB;

type
  Tfrm_novo_alt_Usuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    bt_salvarSocio: TButton;
    bt_cancelSocio: TButton;
    dsLogin: TDataSource;
    DBedit_Senha: TDBEdit;
    DBedit_Usuario: TDBEdit;
    Icones: TImageList;
    Label3: TLabel;
    DBedit_Nivel: TDBEdit;
    dsContador: TDataSource;
    qryContCodigo: TADOQuery;
    qryContCodigoValorMax: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure bt_cancelSocioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_salvarSocioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Usuario: Tfrm_novo_alt_Usuario;

implementation

{$R *.dfm}

uses U_DmValida;

procedure Tfrm_novo_alt_Usuario.bt_cancelSocioClick(Sender: TObject);
begin

  if dsLogin.State in [dsInsert, dsEdit] then
        dsLogin.DataSet.Cancel;
        close;

end;

procedure Tfrm_novo_alt_Usuario.bt_salvarSocioClick(Sender: TObject);
const
  SQL_VALIDA =
    ' SELECT       '+
    '   *          '+
    ' FROM         '+
    '   Login '+
    ' WHERE        '+
    '   (Login = ''%s'' AND Senha = ''%s'') AND id_user <> %d ';

var
  SQL : String;

begin

SQL := Format(SQL_VALIDA, [DBedit_Usuario.Text, DBedit_Senha.Text,
                           dslogin.DataSet.FieldByName('id_user').AsInteger]);

  if DBedit_Usuario.Text = '' then

  begin
    ShowMessage('O campo "Usuário" não pode ficar vazio!');
    DBedit_Usuario.SetFocus;
  end
  else if DBedit_Senha.Text = '' then
  begin
    ShowMessage('O campo "Senha" não pode ficar vazio!');
    DBedit_Senha.SetFocus;
  end
  else if dmValida.Validacao(SQL) then
  begin
    ShowMessage('Já existe um Usuário com mesmo Login e Senha!');
    DBedit_Usuario.SetFocus;
  end
  else if dsLogin.State in [dsInsert] then
  begin
    qryContCodigo.Open;
    dsLogin.DataSet.FieldByName('codLog').Value :=  qryContCodigoValorMax.Value;
    dsLogin.DataSet.Post;
    qryContCodigo.Close;
    ShowMessage('Cadastro Realizado com Sucesso!');
    Close;
  end
  else if dsLogin.State in [dsEdit] then
  begin
    dsLogin.DataSet.Post;
    ShowMessage('Cadastro Alterado com Sucesso!');
    Close;
  end;

end;

procedure Tfrm_novo_alt_Usuario.FormClose(Sender: TObject;
var Action: TCloseAction);
begin

  if dsLogin.State in [dsInsert, dsEdit] then
    dsLogin.DataSet.Cancel;

end;

procedure Tfrm_novo_alt_Usuario.FormCreate(Sender: TObject);
begin

  if dsLogin.State in [dsEdit] then
    Caption := 'Alteração de Usuário'
  else
    Caption := 'Cadastro de Usuário';

end;

end.
