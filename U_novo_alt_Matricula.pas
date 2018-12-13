unit U_novo_alt_Matricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.Mask, vcl.Wwdbdatetimepicker, Vcl.ImgList;

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
    Icones: TImageList;
    qryContCodigo: TADOQuery;
    qryContCodigoValorMax: TIntegerField;
    dsContador: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bt_salvarSocioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelSocioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_novo_alt_Matricula: Tfrm_novo_alt_Matricula;

implementation

{$R *.dfm}

uses U_DmValida;

procedure Tfrm_novo_alt_Matricula.bt_cancelSocioClick(Sender: TObject);
begin

  if ds4.State in [dsInsert, dsEdit] then
    ds4.DataSet.Cancel;
    close;

end;

procedure Tfrm_novo_alt_Matricula.bt_salvarSocioClick(Sender: TObject);
const
  SQL_VALIDA =
    ' SELECT '+
    '   M.codMat, M.CodigoSocio, M.CodigoAtividade, M.dtCadMat '+
    ' FROM '+
    '   Matriculas M '+
    ' LEFT JOIN '+
    '   Socios S ON S.CodigoSocio = M.CodigoSocio '+
    ' LEFT JOIN '+
    '   Atividades A ON A.CodigoAtividade = M.CodigoAtividade '+
    ' WHERE (S.Nome = ''%s'' AND A.Nome = ''%s'') AND id_matricula <> %d ';

var
  SQL : String;

begin

  ds4.DataSet.FieldByName('dtCadMat').AsString := DatetoStr(date);

  SQL := Format(SQL_VALIDA, [DBLookupComboBox1.Text, DBLookupComboBox2.Text,
                            ds4.DataSet.FieldByName('id_matricula').AsInteger]);

  if DBLookupComboBox1.Text = '' then
  begin
    ShowMessage('A seleção do "Socio" não pode ficar vazia!');
    DBLookupComboBox1.SetFocus;
  end
  else if DBLookupComboBox2.Text = '' then
  begin
    ShowMessage('A seleção da "Atividade" não pode ficar vazia!');
    DBLookupComboBox2.SetFocus;
  end
  else if dmValida.Validacao(SQL) then
  begin
    ShowMessage('Já existe uma matricula com esses dados!');
    DBLookupComboBox1.SetFocus;
  end
  else if ds4.State in [dsInsert] then
  begin
    qryContCodigo.Open;
    ds4.DataSet.FieldByName('codMat').Value := qryContCodigoValorMax.Value;
    ds4.DataSet.Post;
    qryContCodigo.Close;
    ShowMessage('Cadastro Realizado com Sucesso!');
    Close;
  end
  else if ds4.State in [dsEdit] then
  begin
    ds4.DataSet.Post;
    ShowMessage('Cadastro Alterado com Sucesso!');
    Close;
  end;

end;

procedure Tfrm_novo_alt_Matricula.FormClose(Sender: TObject;
var Action: TCloseAction);

begin

  if ds4.State in [dsInsert, dsEdit] then
    ds4.DataSet.Cancel;

end;

procedure Tfrm_novo_alt_Matricula.FormCreate(Sender: TObject);
begin

  if ds4.State in [dsEdit] then
    Caption := 'Alteração de Matricula'
  else
    Caption := 'Cadastro de Matricula';

end;

end.
