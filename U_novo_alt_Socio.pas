unit U_novo_alt_Socio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB;

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

procedure Tfrm_novo_alt_Socio.bt_cancelSocioClick(Sender: TObject);
begin
      if DS.State in [dsInsert, dsEdit] then
        DS.DataSet.Cancel;
        close;
end;

procedure Tfrm_novo_alt_Socio.bt_salvarSocioClick(Sender: TObject);
begin

  if DBedit_nomeSocio.Text = '' then
    begin
      ShowMessage('O campo "Nome" n�o pode ficar vazio!');
      DBedit_nomeSocio.SetFocus;
    end
    else if DBedit_ruaSocio.Text = '' then
    begin
      ShowMessage('O campo "Rua" n�o pode ficar vazio!');
      DBedit_ruaSocio.SetFocus;
    end
      else if DBedit_telSocio.Text = '' then
      begin
        ShowMessage('O campo "Telefone" n�o pode ficar vazio!');
        DBedit_telSocio.SetFocus;
      end
        else if DBedit_cidSocio.Text = '' then
        begin
          ShowMessage('O campo "Cidade" n�o pode ficar vazio!');
          DBedit_cidSocio.SetFocus;
        end
          else if DBedit_cepSocio.Text = '' then
          begin
            ShowMessage('O campo "CEP" n�o pode ficar vazio!');
            DBedit_cepSocio.SetFocus;
          end
          else if DBedit_ufSocio.Text = '' then
            begin
              ShowMessage('O campo "UF" n�o pode ficar vazio!');
              DBedit_ufSocio.SetFocus;
            end
              else if DBedit_compSocio.Text = '' then
              begin
                ShowMessage('O campo "Complemento" n�o pode ficar vazio!');
                DBedit_compSocio.SetFocus;
              end
                else if DBedit_cpfSocio.Text = '' then
                begin
                  ShowMessage('O campo "CPF" n�o pode ficar vazio!');
                  DBedit_cpfSocio.SetFocus;
                end
                  else if DBedit_bairroSocio.Text = '' then
                  begin
                    ShowMessage('O campo "Bairro" n�o pode ficar vazio!');
                    DBedit_bairroSocio.SetFocus;
                  end
                    else if DS.State in [dsInsert] then
                    begin
                      DS.DataSet.Post;
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
  Caption := 'Altera��o de Socio'
  else
    Caption := 'Cadastro de Socio';
end;

end.
