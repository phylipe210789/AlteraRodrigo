unit U_relMatriculas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, ppDB, ppDBPipe,
  ppParameter, ppDesignLayer, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ImgList;

type
  Tfrm_relMatriculas = class(TForm)
    bt_gera: TButton;
    br_cancela: TButton;
    DBCB_relSocios: TDBLookupComboBox;
    chk_relSocios: TCheckBox;
    lbl_relSocios: TLabel;
    DBCB_relAtividades: TDBLookupComboBox;
    chk_relAtividades: TCheckBox;
    lbl_relAtividades: TLabel;
    ppDB_relMatriculas: TppDBPipeline;
    pp_relMatriculas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ds_relMatriculas: TDataSource;
    qry_relMatriculas: TADOQuery;
    qry_relMatriculasid_matricula: TAutoIncField;
    qry_relMatriculasValor: TBCDField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    qry_relMatriculassocio: TStringField;
    qry_relMatriculasatividade: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel8: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBText4: TppDBText;
    ppLine2: TppLine;
    Icones: TImageList;
    ppLine3: TppLine;
    ppLine4: TppLine;
    qry_relMatriculascodMat: TIntegerField;
    procedure chk_relSociosClick(Sender: TObject);
    procedure chk_relAtividadesClick(Sender: TObject);
    procedure br_cancelaClick(Sender: TObject);
    procedure bt_geraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relMatriculas: Tfrm_relMatriculas;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_relMatriculas.br_cancelaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_relMatriculas.bt_geraClick(Sender: TObject);
begin
  qry_relMatriculas.Close;

  if chk_relSocios.Checked and chk_relAtividades.Checked then
  begin
    qry_relMatriculas.Parameters.ParamByName('codigosocio').Value := '%';
    qry_relMatriculas.Parameters.ParamByName('codigoatividade').Value := '%';
  end
  else if not chk_relSocios.Checked and chk_relAtividades.Checked then
  begin
    qry_relMatriculas.Parameters.ParamByName('codigosocio').Value := DBCB_relSocios.KeyValue;
    qry_relMatriculas.Parameters.ParamByName('codigoatividade').Value := '%';
  end
  else if chk_relSocios.Checked and not chk_relAtividades.Checked then
  begin
    qry_relMatriculas.Parameters.ParamByName('codigoatividade').Value := DBCB_relAtividades.KeyValue;
    qry_relMatriculas.Parameters.ParamByName('codigosocio').Value := '%';
  end;

  qry_relMatriculas.Open;

  if qry_relMatriculas.IsEmpty then
    ShowMessage('Não a dados para ser impresso!')
  else
    pp_relMatriculas.Print;

end;

procedure Tfrm_relMatriculas.chk_relAtividadesClick(Sender: TObject);
begin

  DBCB_relAtividades.Enabled := not TCheckBox(Sender).Checked;
  lbl_relAtividades.Enabled  := not TCheckBox(Sender).Checked;

  if not TCheckBox(Sender).Checked then
  begin
    DBCB_relAtividades.SetFocus;
    chk_relSocios.Enabled := TCheckBox(Sender).Checked
  end
  else
    chk_relSocios.Enabled := True;

end;

procedure Tfrm_relMatriculas.chk_relSociosClick(Sender: TObject);
begin

  DBCB_relSocios.Enabled := not TCheckBox(Sender).Checked;
  lbl_relSocios.Enabled  := not TCheckBox(Sender).Checked;

  if not TCheckBox(Sender).Checked then
  begin
    DBCB_relSocios.SetFocus;
    chk_relAtividades.Enabled := False;
  end
  else
  chk_relAtividades.Enabled := True;

end;

procedure Tfrm_relMatriculas.FormCreate(Sender: TObject);
begin

  dmCadastros.qryCadSocio.Close;
  dmCadastros.qryCadSocio.Open;
  dmCadastros.qryCadAtividade.Close;
  dmCadastros.qryCadAtividade.Open;

end;

end.
