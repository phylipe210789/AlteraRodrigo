unit U_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask;

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
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);

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

procedure Tfrm_login.Button1Click(Sender: TObject);
begin
      qrylogin.SQL.Clear;
      qrylogin.SQL.Add('select * from login where login='''+edit1.Text+''' and senha='''+Edit2.Text+''' ');
      qrylogin.Open;
      if qrylogin.IsEmpty then
      begin
          ShowMessage('Login ou Senha incorretos!');
          Edit1.SetFocus;
          //Edit1.Clear;
          //Edit2.Clear;
      end
      else
        ModalResult := mrOk;
end;

end.
