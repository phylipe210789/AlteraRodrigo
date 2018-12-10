unit U_relSocios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppDesignLayer, ppParameter,
  Vcl.DBCtrls, Vcl.StdCtrls;

type
  Tfrm_relSocios = class(TForm)
    ppDB_relSocios: TppDBPipeline;
    pp_relSocios: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ds_relSocios: TDataSource;
    qry_relSocios: TADOQuery;
    qry_relSociosCodigoSocio: TAutoIncField;
    qry_relSociosNome: TStringField;
    qry_relSociosEndereco: TStringField;
    qry_relSociosComplemento: TStringField;
    qry_relSociosBairro: TStringField;
    qry_relSociosCidade: TStringField;
    qry_relSociosEstado: TStringField;
    qry_relSociosCEP: TStringField;
    qry_relSociosTelefone: TStringField;
    qry_relSociosCPF: TStringField;
    DBCB_relSocios: TDBLookupComboBox;
    chk_relSocios: TCheckBox;
    bt_gera: TButton;
    br_cancela: TButton;
    lbl_relSocios: TLabel;
    procedure chk_relSociosClick(Sender: TObject);
    procedure bt_geraClick(Sender: TObject);
    procedure br_cancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relSocios: Tfrm_relSocios;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_relSocios.bt_geraClick(Sender: TObject);
begin

   if (not chk_relSocios.Checked) and VarIsNull(DBCB_relSocios.KeyValue) then
   Begin
     ShowMessage('Selecione um Registro.');
     DBCB_relSocios.SetFocus;
     Exit;
   end;

   qry_relSocios.Close;

   if chk_relSocios.Checked then
     qry_relSocios.Parameters.ParamByName('codigosocio').Value := '%'
   else
     qry_relSocios.Parameters.ParamByName('codigosocio').Value := DBCB_relSocios.KeyValue;

   qry_relSocios.Open;

   if qry_relSocios.IsEmpty then
     ShowMessage('Não a dados para ser impresso!')
   else
      pp_relSocios.Print;
end;

procedure Tfrm_relSocios.br_cancelaClick(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_relSocios.chk_relSociosClick(Sender: TObject);
begin
  DBCB_relSocios.Enabled := not TCheckBox(Sender).Checked;
  lbl_relSocios.Enabled  := not TCheckBox(Sender).Checked;

  if not TCheckBox(Sender).Checked then
    DBCB_relSocios.SetFocus;
end;
procedure Tfrm_relSocios.FormCreate(Sender: TObject);
begin
  dmCadastros.qryCadSocio.Close;
  dmCadastros.qryCadSocio.Open;
end;

end.
