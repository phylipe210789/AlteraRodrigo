unit U_novo_alt_Matricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.Mask;

type
  Tfrm_novo_alt_Matricula = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ds2: TDataSource;
    ds3: TDataSource;
    ds4: TDataSource;
    bt_salvarSocio: TButton;
    bt_cancelSocio: TButton;
    DBedit_codSocio: TDBEdit;
    lb_codSocio: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Matricula: Tfrm_novo_alt_Matricula;

implementation

{$R *.dfm}

procedure Tfrm_novo_alt_Matricula.FormCreate(Sender: TObject);
begin

      if ds4.State in [dsEdit] then
        Caption := 'Alteração de Matricula'
      else
        Caption := 'Cadastro de Matricula';

end;

end.
