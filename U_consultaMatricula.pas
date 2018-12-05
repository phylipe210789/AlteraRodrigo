unit U_consultaMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ImgList;

type
  Tfrm_consultaMatricula = class(TForm)
    ToolBar1: TToolBar;
    bt_cadSocio: TToolButton;
    bt_altSocio: TToolButton;
    bt_excSoscio: TToolButton;
    Icones: TImageList;
    Panel1: TPanel;
    bt_pesqMat: TButton;
    edit_pesquisa: TEdit;
    rg_filtros: TRadioGroup;
    DBGrid_Matriculas: TDBGrid;
    qry2: TADOQuery;
    qry2CodigoSocio: TAutoIncField;
    qry2Nome: TStringField;
    qry2Endereco: TStringField;
    qry2Complemento: TStringField;
    qry2Bairro: TStringField;
    qry2Cidade: TStringField;
    qry2Estado: TStringField;
    qry2CEP: TStringField;
    qry2Telefone: TStringField;
    qry2CPF: TStringField;
    ds2: TDataSource;
    ds3: TDataSource;
    qry3: TADOQuery;
    qry3CodigoAtividade: TAutoIncField;
    qry3Nome: TStringField;
    qry3Valor: TBCDField;
    qry4: TADOQuery;
    qry4id_matricula: TAutoIncField;
    qry4CodigoSocio: TIntegerField;
    qry4CodigoAtividade: TIntegerField;
    qry4socio: TStringField;
    qry4atividade: TStringField;
    ds4: TDataSource;
    procedure bt_cadSocioClick(Sender: TObject);
    procedure bt_altSocioClick(Sender: TObject);
    procedure bt_excSoscioClick(Sender: TObject);
    procedure bt_pesqMatClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consultaMatricula: Tfrm_consultaMatricula;

implementation

{$R *.dfm}

uses Udm, U_novo_alt_Matricula;

procedure Tfrm_consultaMatricula.bt_altSocioClick(Sender: TObject);
begin

  if not qry4.Active and qry4.IsEmpty then
    begin
      //qryCadSocio.Open;
      ShowMessage('Não possui dados para alteração.');
      edit_pesquisa.SetFocus;
    end
    else begin
        qry4.Open;
        qry4.Edit;
      with Tfrm_novo_alt_Matricula.Create(Application) do
      try
        showmodal;
      finally
        free;
      end;
    end;

end;

procedure Tfrm_consultaMatricula.bt_cadSocioClick(Sender: TObject);
begin

   with Tfrm_novo_alt_Matricula.Create(Application) do
   try
      qry4.Open;
      qry4.Insert;
      showmodal;
   finally
     free;
   end;

end;

procedure Tfrm_consultaMatricula.bt_excSoscioClick(Sender: TObject);
  const

  msg = 'Deseja realmente excluir o Socio: ';

begin

 try

  if not qry4.Active and qry4.IsEmpty then
  begin
     ShowMessage('Não possui dados para exclusão.');
     edit_pesquisa.SetFocus;
  end
  else begin
      qry4.Open;
      if MessageDlg(msg+ds4.DataSet.FieldByName('id_matricula').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qry4.Delete;
  end;

 except

  MessageDlg('Esse registro possui movimentações e não pode ser excluido', mtError, mbOKCancel, 0);

 end;
end;

procedure Tfrm_consultaMatricula.bt_pesqMatClick(Sender: TObject);
const
  sql_base =
   ' SELECT '+
   '   M.id_matricula, S.Nome, A.Nome, M.CodigoSocio, M.CodigoAtividade '+
   ' FROM '+
   '   Matriculas M '+
   ' INNER JOIN '+
   '   Socios S ON S.CodigoSocio = M.CodigoSocio '+
   ' INNER JOIN '+
   '   Atividades A ON A.CodigoAtividade = M.CodigoAtividade '+
   ' WHERE ';

begin

  qry4.Close;
  qry4.SQL.Clear;
  qry4.SQL.Add(sql_base);
  case rg_filtros.ItemIndex of
  0:Begin
      qry4.SQL.Add(' convert(varchar(10),M.id_matricula) like :id_matricula order by M.id_matricula ');
      qry4.Parameters[0].Value := edit_pesquisa.Text+'%';
    end;
  1:Begin
      qry4.SQL.Add(' S.Nome like :Nome order by S.Nome ');
      qry4.Parameters[0].Value := edit_pesquisa.Text+'%';
    End;
  end;

  qry4.Open;

  if qry4.IsEmpty then
  Begin
     ShowMessage('Não possui dados.');
     edit_pesquisa.SetFocus;
  End
  else
    DBGrid_Matriculas.SetFocus;

end;

end.
