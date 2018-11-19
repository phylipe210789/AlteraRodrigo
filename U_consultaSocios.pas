unit U_consultaSocios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  Tfrm_consultaSocios = class(TForm)
    DBGrid1: TDBGrid;
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

uses Udm, U_altSocio, U_novo_alt_Socio;

procedure Tfrm_consultaSocios.bt_cadSocioClick(Sender: TObject);
begin

   if not (qryCadSocio.Active)then
    qryCadSocio.Open;

   with Tfrm_novo_alt_Socio.Create(Application) do
   try
     frm_novo_alt_Socio.Caption := 'Cadastro de Socio';
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
      ShowMessage('Não possui dados para alteração.');
      edit_pesquisa.SetFocus;
    end
    else begin
        qryCadSocio.Open;
        qryCadSocio.Edit;
      with Tfrm_novo_alt_Socio.Create(Application) do
      try
        frm_novo_alt_Socio.Caption := 'Alteração de Socio';
        showmodal;
      finally
        free;
      end;
    end;
end;

procedure Tfrm_consultaSocios.bt_excSoscioClick(Sender: TObject);
const
  msg = 'Deseja realmente excluir o Socio: ';
begin

  if not qryCadSocio.Active and qryCadSocio.IsEmpty then
  begin
     ShowMessage('Não possui dados para exclusão.');
     edit_pesquisa.SetFocus;
  end
  else begin
      qryCadSocio.Open;
      if MessageDlg(msg+DS.DataSet.FieldByName('Nome').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qryCadSocio.Delete;
  end;
end;

procedure Tfrm_consultaSocios.bt_pesqSoscioClick(Sender: TObject);
const
  sql_base = 'select * from socios where ';
begin
  qryCadSocio.Close;
  qryCadSocio.SQL.Clear;
  qryCadSocio.SQL.Add(sql_base);
  case rg_filtros.ItemIndex of
  0:Begin
      qryCadSocio.SQL.Add(' convert(varchar(10), CodigoSocio) like :codigo order by CodigoSocio');
      qryCadSocio.Parameters[0].Value := edit_pesquisa.Text;
    end;
  1:Begin
     qryCadSocio.SQL.Add(' Nome like :Nome order by Nome ');
     qryCadSocio.Parameters[0].Value := edit_pesquisa.Text+'%';
    End;
  end;

  qryCadSocio.Open;

  if qryCadSocio.IsEmpty then
  Begin
     ShowMessage('Não possui dados.');
     edit_pesquisa.SetFocus;
  End
  else
    DBGrid1.SetFocus;

end;

end.
