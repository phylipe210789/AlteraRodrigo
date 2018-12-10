unit U_consultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.ImgList, Data.Win.ADODB, Vcl.ComCtrls, Vcl.ToolWin;

type
  Tfrm_consultaUsuario = class(TForm)
    ToolBar1: TToolBar;
    bt_cadUsuario: TToolButton;
    bt_altUsuario: TToolButton;
    bt_excUsuario: TToolButton;
    qryCadLogin: TADOQuery;
    Icones: TImageList;
    dsLogin: TDataSource;
    Panel1: TPanel;
    bt_pesqLogin: TButton;
    edit_pesquisa: TEdit;
    rg_filtros: TRadioGroup;
    DBGrid_Login: TDBGrid;
    qryCadLoginid_user: TAutoIncField;
    qryCadLoginlogin: TStringField;
    qryCadLoginsenha: TStringField;
    procedure bt_cadUsuarioClick(Sender: TObject);
    procedure bt_excUsuarioClick(Sender: TObject);
    procedure bt_altUsuarioClick(Sender: TObject);
    procedure bt_pesqLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consultaUsuario: Tfrm_consultaUsuario;

implementation

{$R *.dfm}

uses U_novo_alt_Usuario;

procedure Tfrm_consultaUsuario.bt_altUsuarioClick(Sender: TObject);
begin

  if not qryCadLogin.Active and qryCadLogin.IsEmpty then
    begin
      ShowMessage('Não possui dados para alteração.');
      edit_pesquisa.SetFocus;
    end
    else begin
        qryCadLogin.Open;
        qryCadLogin.Edit;
      with Tfrm_novo_alt_Usuario.Create(Application) do
      try
        showmodal;
      finally
        free;
      end;
    end;

end;

procedure Tfrm_consultaUsuario.bt_cadUsuarioClick(Sender: TObject);
begin

  if not (qryCadLogin.Active)then
    qryCadLogin.Open;

   with Tfrm_novo_alt_Usuario.Create(Application) do
   try
     qryCadLogin.Insert;
     showmodal;
   finally
     free;
   end;

end;

procedure Tfrm_consultaUsuario.bt_excUsuarioClick(Sender: TObject);
const

  msg = 'Deseja realmente excluir o Usuário: ';

begin

 try

  if not qryCadLogin.Active and qryCadLogin.IsEmpty then
  begin
     ShowMessage('Não possui dados para exclusão.');
     edit_pesquisa.SetFocus;
  end
  else begin
      qryCadLogin.Open;
      if MessageDlg(msg+dsLogin.DataSet.FieldByName('login').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qryCadLogin.Delete;
  end;

 except

  MessageDlg('Esse registro possui movimentações e não pode ser excluido', mtError, mbOKCancel, 0);

 end;
end;

procedure Tfrm_consultaUsuario.bt_pesqLoginClick(Sender: TObject);
const
  sql_base = 'select * from login where ';
begin

  qryCadLogin.Close;
  qryCadLogin.SQL.Clear;
  qryCadLogin.SQL.Add(sql_base);

  case rg_filtros.ItemIndex of
  0:Begin
      qryCadLogin.SQL.Add(' convert(varchar(10), id_user) like :id_user order by id_user');
      qryCadLogin.Parameters[0].Value := edit_pesquisa.Text+'%';
    end;
  1:Begin
     qryCadLogin.SQL.Add(' login like :login order by login ');
     qryCadLogin.Parameters[0].Value := edit_pesquisa.Text+'%';
    End;
  end;

  qryCadLogin.Open;

  if qryCadLogin.IsEmpty then
  Begin
     ShowMessage('Não possui dados.');
     edit_pesquisa.SetFocus;
  End
  else
    DBGrid_Login.SetFocus;
end;

end.
