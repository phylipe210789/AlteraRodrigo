unit U_consultaAtividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  Tfrm_consultaAtividade = class(TForm)
    DBGrid_Atividades: TDBGrid;
    ToolBar1: TToolBar;
    bt_cadAtividade: TToolButton;
    bt_altAtividade: TToolButton;
    bt_excAtividade: TToolButton;
    Panel1: TPanel;
    bt_pesqAtividade: TButton;
    edit_pesquisa: TEdit;
    rg_filtros: TRadioGroup;
    DS: TDataSource;
    Icones: TImageList;
    qryCadAtividade: TADOQuery;
    qryCadAtividadeCodigoAtividade: TAutoIncField;
    qryCadAtividadeNome: TStringField;
    qryCadAtividadeValor: TBCDField;
    qryCadAtividadecodAtiv: TIntegerField;
    procedure bt_cadAtividadeClick(Sender: TObject);
    procedure bt_altAtividadeClick(Sender: TObject);
    procedure bt_excAtividadeClick(Sender: TObject);
    procedure bt_pesqAtividadeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consultaAtividade: Tfrm_consultaAtividade;

implementation

{$R *.dfm}

uses Udm, U_DmCadastros, U_novo_alt_Atividade;

procedure Tfrm_consultaAtividade.bt_altAtividadeClick(Sender: TObject);
begin
  if not qryCadAtividade.Active and qryCadAtividade.IsEmpty then
    begin
      ShowMessage('Não possui dados para alteração.');
      edit_pesquisa.SetFocus;
    end
  else begin
    qryCadAtividade.Open;
    qryCadAtividade.Edit;
    with Tfrm_novo_alt_Atividade.Create(Application) do
      try
        showmodal;
      finally
        free;
    end;
  end;
end;

procedure Tfrm_consultaAtividade.bt_cadAtividadeClick(Sender: TObject);
begin

  if not qryCadAtividade.Active then
    qryCadAtividade.Open;

  with Tfrm_novo_alt_Atividade.Create(Application) do
    try
      qryCadAtividade.Insert;
      ShowModal;
    finally
      free;
    end;

end;

procedure Tfrm_consultaAtividade.bt_excAtividadeClick(Sender: TObject);

  const
  msg = 'Deseja realmente excluir a Atividade: ';

begin

 try
  if not qryCadAtividade.Active and qryCadAtividade.IsEmpty then
  begin
    ShowMessage('Não possui dados para exclusão.');
    edit_pesquisa.SetFocus;
  end
  else begin
    qryCadAtividade.Open;
    if MessageDlg(msg+DS.DataSet.FieldByName('Nome').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    qryCadAtividade.Delete;
  end;

 except

  MessageDlg('Esse registro possui movimentações e não pode ser excluido', mtError, mbOKCancel, 0);

 end;
end;

procedure Tfrm_consultaAtividade.bt_pesqAtividadeClick(Sender: TObject);
const
  SQL_BASE =
    ' SELECT '+
    '   codAtiv, CodigoAtividade, Nome, Valor '+
    ' FROM '+
    '   ATIVIDADES '+
    ' WHERE ';

begin
  qryCadAtividade.Close;
  qryCadAtividade.SQL.Clear;
  qryCadAtividade.SQL.Add(SQL_BASE);

  case rg_filtros.ItemIndex of
  0:Begin
      qryCadAtividade.SQL.Add(' convert(varchar(10), codAtiv) like :codigo order by codAtiv');
      qryCadAtividade.Parameters[0].Value := edit_pesquisa.Text+'%';
    end;
  1:Begin
      qryCadAtividade.SQL.Add(' Nome like :Nome order by Nome ');
      qryCadAtividade.Parameters[0].Value := edit_pesquisa.Text+'%';
    End;
  end;

  qryCadAtividade.Open;

  if qryCadAtividade.IsEmpty then
  Begin
    ShowMessage('Não possui dados.');
    edit_pesquisa.SetFocus;
  End
  else
    DBGrid_Atividades.SetFocus;
end;

end.
