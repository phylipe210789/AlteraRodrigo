unit U_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ImgList;

type
  Tfrm_login = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    dslogin: TDataSource;
    qrylogin: TADOQuery;
    qryloginid_user: TAutoIncField;
    qryloginlogin: TStringField;
    qryloginsenha: TStringField;
    Edit2: TEdit;
    Button2: TButton;
    Icones: TImageList;
    qryloginnivel: TIntegerField;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

uses Udm, U_main;

procedure Tfrm_login.Button1Click(Sender: TObject);
//const
//  SQL_LOGIN =
//    ' SELECT '+
//    '   ID_USER, LOGIN, SENHA, NIVEL '+
//    ' FROM '+
//    '   LOGIN '+
//    ' WHERE '+
//    '   LOGIN = :LOGIN AND SENHA = :SENHA ';

const
  SQL_LOGIN =
    ' SELECT '+
    '   ID_USER, LOGIN, SENHA, NIVEL '+
    ' FROM '+
    '   LOGIN '+
    ' WHERE '+
    '   LOGIN = ''%s'' AND SENHA = ''%s'' ';

var
  Ssql: string;

begin
  Ssql := Format(SQL_LOGIN, [Edit1.Text, Edit2.Text]);
  qrylogin.SQL.Clear;
  qrylogin.SQL.Add(Ssql);

//  qrylogin.Parameters[0].Value := Edit1.Text;
//  qrylogin.Parameters[1].Value := Edit2.Text;

  qrylogin.Open;

  if qrylogin.IsEmpty then
  begin
    ShowMessage('Login ou Senha incorretos!');
    Edit1.SetFocus;
    Edit1.Clear;
    Edit2.Clear;
  end
  else if qryloginnivel.Value = 0 then
  begin
    frm_main.MenuUsuario.Visible := True;
    ModalResult := mrOk;
  end
  else begin
    frm_main.MenuUsuario.Visible := False;
    ModalResult := mrOk;
  end;

end;

procedure Tfrm_login.Button2Click(Sender: TObject);
begin

  close;

end;

procedure Tfrm_login.Button1KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;

end;

procedure Tfrm_login.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;

end;

procedure Tfrm_login.Edit2KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;

end;

end.
