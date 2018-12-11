unit U_Sobre;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ImgList;

type
  Tfrm_sobre = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Icones: TImageList;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sobre: Tfrm_sobre;

implementation

{$R *.dfm}

procedure Tfrm_sobre.OKButtonClick(Sender: TObject);
begin

  Close;

end;

end.
 
