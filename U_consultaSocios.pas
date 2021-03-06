unit U_consultaSocios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  Tfrm_consultaSocios = class(TForm)
    DBGrid_Socios: TDBGrid;
    DS: TDataSource;
    ToolBar1: TToolBar;
    bt_cadSocio: TToolButton;
    bt_altSocio: TToolButton;
    bt_excSoscio: TToolButton;
    Icones: TImageList;
    Panel1: TPanel;
    bt_pesqSoscio: TButton;
    edit_pesquisa: TEdit;
    qryCadSocio: TADOQuery;
    qryCadSocioCodigoSocio: TAutoIncField;
    qryCadSocioNome: TStringField;
    qryCadSocioEndereco: TStringField;
    qryCadSocioComplemento: TStringField;
    qryCadSocioBairro: TStringField;
    qryCadSocioCidade: TStringField;
    qryCadSocioEstado: TStringField;
    qryCadSocioCEP: TStringField;
    qryCadSocioTelefone: TStringField;
    qryCadSocioCPF: TStringField;
    rg_filtros: TRadioGroup;
    qryCadSociocodSoc: TIntegerField;
    procedure bt_excSoscioClick(Sender: TObject);
    procedure bt_cadSocioClick(Sender: TObject);
    procedure bt_altSocioClick(Sender: TObject);
    procedure bt_pesqSoscioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consultaSocios: Tfrm_consultaSocios;

implementation

{$R *.dfm}

uses Udm, U_novo_alt_Socio;

procedure Tfrm_consultaSocios.bt_cadSocioClick(Sender: TObject);
begin
  if not (qryCadSocio.Active)then
    qryCadSocio.Open;

  with Tfrm_novo_alt_Socio.Create(Application) do
    try
      qryCadSocio.Insert;
      showmodal;
    finally
      free;
    end;

end;

procedure Tfrm_consultaSocios.bt_altSocioClick(Sender: TObject);
begin
  if not qryCadSocio.Active and qryCadSocio.IsEmpty then
  begin
    //qryCadSocio.Open;
    ShowMessage('N�o possui dados para altera��o.');
    edit_pesquisa.SetFocus;
  end
  else begin
    qryCadSocio.Open;
    qryCadSocio.Edit;
    with Tfrm_novo_alt_Socio.Create(Application) do
      try
        showmodal;
      finally
        free;
      end;
  end;

end;

procedure Tfrm_consultaSocios.bt_excSoscioClick(Sender: TObject);
const
  MSG = 'Deseja realmente excluir o Socio: ';

begin
  try
    if not qryCadSocio.Active and qryCadSocio.IsEmpty then
    begin
      ShowMessage('N�o possui dados para exclus�o.');
      edit_pesquisa.SetFocus;
    end
    else begin
      qryCadSocio.Open;
      if MessageDlg(MSG+DS.DataSet.FieldByName('Nome').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        qryCadSocio.Delete;
    end;

  except
    MessageDlg('Esse registro possui movimenta��es e n�o pode ser excluido', mtError, mbOKCancel, 0);

  end;

end;

procedure Tfrm_consultaSocios.bt_pesqSoscioClick(Sender: TObject);
const
  SQL_BASE =
    ' SELECT '+
    '   codSoc, CodigoSocio, Nome, Endereco, Complemento, Bairro, Cidade, '+
    '   Estado, CEP, Telefone, CPF '+
    ' FROM '+
    '   SOCIOS '+
    ' WHERE ';

begin

  qryCadSocio.Close;
  qryCadSocio.SQL.Clear;
  qryCadSocio.SQL.Add(SQL_BASE);
  case rg_filtros.ItemIndex of
  0:Begin
      qryCadSocio.SQL.Add(' convert(varchar(10), codSoc) like :codigo order by codSoc');
      qryCadSocio.Parameters[0].Value := edit_pesquisa.Text+'%';
    end;
  1:Begin
     qryCadSocio.SQL.Add(' Nome like :Nome order by Nome ');
     qryCadSocio.Parameters[0].Value := edit_pesquisa.Text+'%';
    End;
  end;

  qryCadSocio.Open;

  if qryCadSocio.IsEmpty then
  Begin
    ShowMessage('N�o possui dados.');
    edit_pesquisa.SetFocus;
  End
  else
    DBGrid_Socios.SetFocus;

end;

end.
