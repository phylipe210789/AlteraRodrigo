unit U_cadAtividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  Tfrm_cadAtividade = class(TForm)
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadAtividade: Tfrm_cadAtividade;

implementation

{$R *.dfm}

uses Udm, U_DmCadastros;

end.
