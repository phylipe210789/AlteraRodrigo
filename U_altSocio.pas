unit U_altSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm_altSocio = class(TForm)
    lb_nomeSocio: TLabel;
    DBedit_nomeSocio: TDBEdit;
    DBedit_ruaSocio: TDBEdit;
    lb_ruaSocio: TLabel;
    DBedit_codSocio: TDBEdit;
    lb_codSocio: TLabel;
    Label3: TLabel;
    DBedit_bairroSocio: TDBEdit;
    lb_bairroSocio: TLabel;
    DBedit_cpfSocio: TDBEdit;
    lb_cpfSocio: TLabel;
    DBedit_compSocio: TDBEdit;
    lb_compSocio: TLabel;
    DBedit_ufSocio: TDBEdit;
    lb_ufSocio: TLabel;
    DBedit_cepSocio: TDBEdit;
    lb_cepSocio: TLabel;
    DBedit_cidSocio: TDBEdit;
    lb_cidSocio: TLabel;
    DBedit_telSocio: TDBEdit;
    lb_telSocio: TLabel;
    bt_salvarSocio: TButton;
    bt_cancelSocio: TButton;
    procedure bt_cancelSocioClick(Sender: TObject);
    procedure bt_salvarSocioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_altSocio: Tfrm_altSocio;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_altSocio.bt_cancelSocioClick(Sender: TObject);
begin
      Close;
end;

procedure Tfrm_altSocio.bt_salvarSocioClick(Sender: TObject);
begin
      dmCadastros.qryCadSocio.Post;
      ShowMessage('Cadastro alterado com Sucesso');
      Close;
end;

end.
