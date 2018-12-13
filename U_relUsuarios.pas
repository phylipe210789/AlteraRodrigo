unit U_relUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, ppParameter,
  ppDesignLayer, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Data.DB, Data.Win.ADODB,
  Vcl.ImgList;

type
  Tfrm_relUsuario = class(TForm)
    bt_gera: TButton;
    qry_relUsuario: TADOQuery;
    ds_relUsuario: TDataSource;
    ppDB_relUsuario: TppDBPipeline;
    pp_relUsuario: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    chk_relUsuario: TCheckBox;
    br_cancela: TButton;
    DBCB_relUsuario: TDBLookupComboBox;
    lbl_relUsuario: TLabel;
    qry_relUsuarioid_user: TAutoIncField;
    qry_relUsuariologin: TStringField;
    qry_relUsuariosenha: TStringField;
    Icones: TImageList;
    qry_relUsuarionivel: TIntegerField;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    qry_relUsuariocodLog: TIntegerField;
    procedure bt_geraClick(Sender: TObject);
    procedure br_cancelaClick(Sender: TObject);
    procedure chk_relUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relUsuario: Tfrm_relUsuario;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_relUsuario.br_cancelaClick(Sender: TObject);
begin

  Close;

end;

procedure Tfrm_relUsuario.bt_geraClick(Sender: TObject);
begin

  if (not chk_relUsuario.Checked) and VarIsNull(DBCB_relUsuario.KeyValue) then
  begin
    ShowMessage('Selecione um Registro.');
    DBCB_relUsuario.SetFocus;
    Exit;
  end;

  qry_relUsuario.Close;

  if chk_relUsuario.Checked then
    qry_relUsuario.Parameters.ParamByName('id_user').Value := '%'
  else
    qry_relUsuario.Parameters.ParamByName('id_user').Value := DBCB_relUsuario.KeyValue;

    qry_relUsuario.Open;

  if qry_relUsuario.IsEmpty then
    ShowMessage('Não a dados para ser impresso!')
  else
    pp_relUsuario.Print;

end;

procedure Tfrm_relUsuario.chk_relUsuarioClick(Sender: TObject);
begin

  DBCB_relUsuario.Enabled := not TCheckBox(Sender).Checked;
  lbl_relUsuario.Enabled  := not TCheckBox(Sender).Checked;

  if not TCheckBox(Sender).Checked then
    DBCB_relUsuario.SetFocus;

end;

procedure Tfrm_relUsuario.FormCreate(Sender: TObject);
begin

  dmCadastros.qryCadUsuario.Close;
  dmCadastros.qryCadUsuario.Open;

end;

end.
