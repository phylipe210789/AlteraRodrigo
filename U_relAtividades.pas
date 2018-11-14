unit U_relAtividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppCtrls, ppDB, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Data.Win.ADODB, ppDBPipe, ppParameter, ppDesignLayer, ppVar, ppBands,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, Vcl.StdCtrls,
  Vcl.DBCtrls;

type
  Tfrm_relAtividades = class(TForm)
    pp_relAtividades: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDB_relAtividades: TppDBPipeline;
    ds_relAtividades: TDataSource;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    DBCB_relAtividades: TDBLookupComboBox;
    bt_gera: TButton;
    br_cancela: TButton;
    lbl_relAtividades: TLabel;
    chk_relAtividades: TCheckBox;
    qry_relAtividade: TADOQuery;
    qry_relAtividadeCodigoAtividade: TAutoIncField;
    qry_relAtividadeNome: TStringField;
    qry_relAtividadeValor: TBCDField;
    procedure bt_geraClick(Sender: TObject);
    procedure br_cancelaClick(Sender: TObject);
    procedure chk_relAtividadesClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relAtividades: Tfrm_relAtividades;

implementation

{$R *.dfm}

uses U_DmCadastros;

procedure Tfrm_relAtividades.br_cancelaClick(Sender: TObject);
begin
      Close;
end;

procedure Tfrm_relAtividades.bt_geraClick(Sender: TObject);
begin

      if (not chk_relAtividades.Checked) and VarIsNull(DBCB_relAtividades.KeyValue) then
   Begin
     ShowMessage('Selecione um Registro.');
     DBCB_relAtividades.SetFocus;
     Exit;
   end;

   qry_relAtividade.Close;

   if chk_relAtividades.Checked then
     qry_relAtividade.Parameters.ParamByName('codigoatividade').Value := '%'
   else
     qry_relAtividade.Parameters.ParamByName('codigoatividade').Value := DBCB_relAtividades.KeyValue;

   qry_relAtividade.Open;

   if qry_relAtividade.IsEmpty then
     ShowMessage('Não a dados para ser impresso!')
   else
      pp_relAtividades.Print;

end;

procedure Tfrm_relAtividades.chk_relAtividadesClick(Sender: TObject);
begin
      DBCB_relAtividades.Enabled := not TCheckBox(Sender).Checked;
      lbl_relAtividades.Enabled  := not TCheckBox(Sender).Checked;

  if not TCheckBox(Sender).Checked then
      DBCB_relAtividades.SetFocus;
end;

end.
