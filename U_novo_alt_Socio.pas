unit U_novo_alt_Socio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

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
    procedure bt_salvarSocioClick(Sender: TObject);
    procedure bt_cancelSocioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Socio: Tfrm_novo_alt_Socio;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_novo_alt_Socio.bt_cancelSocioClick(Sender: TObject);
begin
      close;
end;

procedure Tfrm_novo_alt_Socio.bt_salvarSocioClick(Sender: TObject);
begin
      if DBedit_nomeSocio.Text = '' then
        ShowMessage('O campo "Nome" não pode ficar vazio!')
        else begin
        dmCadastros.qryCadSocio.FieldByName('Nome').Value := DBedit_nomeSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Endereco').Value := DBedit_ruaSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Complemento').Value := DBedit_compSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Bairro').Value := DBedit_bairroSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Cidade').Value := DBedit_cidSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Estado').Value := DBedit_ufSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('CEP').Value := DBedit_cepSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('Telefone').Value := DBedit_telSocio.Text;
        dmCadastros.qryCadSocio.FieldByName('CPF').Value := DBedit_cpfSocio.Text;
        dmCadastros.qryCadSocio.Post;
        ShowMessage('Cadastro Realizado com Sucesso!');
        Close;
        end;
end;

end.
