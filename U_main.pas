unit U_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls;

type
  Tfrm_main = class(TForm)
    MenuPrincipal: TMainMenu;
    MenuSistema: TMenuItem;
    MenuSocios: TMenuItem;
    MenuAtividades: TMenuItem;
    Matricula1: TMenuItem;
    MenuRelatorios: TMenuItem;
    MenuHelp: TMenuItem;
    SistemaBackup: TMenuItem;
    SistemaFinalizar: TMenuItem;
    N1: TMenuItem;
    SociosCadastro: TMenuItem;
    MatriculaCadastro: TMenuItem;
    RelatoriosSocios: TMenuItem;
    RelatorioAtividade: TMenuItem;
    RelatorioMatricula: TMenuItem;
    HelpTopicos: TMenuItem;
    HelpSobre: TMenuItem;
    AtividadeCadastro: TMenuItem;
    procedure SistemaFinalizarClick(Sender: TObject);
    procedure HelpSobreClick(Sender: TObject);
    procedure PopupHelpSobreClick(Sender: TObject);
    procedure SociosCadastroClick(Sender: TObject);
    procedure AtividadeCadastroClick(Sender: TObject);
    procedure MatriculaCadastroClick(Sender: TObject);
    procedure SistemaBackupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RelatoriosSociosClick(Sender: TObject);
    procedure RelatorioAtividadeClick(Sender: TObject);
    procedure RelatorioMatriculaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

{$R *.dfm}

uses U_login, U_sobre, U_cadMatriculas, U_consultaAtividade, U_consultaSocios, Udm,
     U_relSocios, U_relAtividades, U_relMatriculas;

procedure Tfrm_main.AtividadeCadastroClick(Sender: TObject);
begin
  with Tfrm_consultaAtividade.Create(Application) do
    try
      showmodal;
    finally
      Free;
  end;
end;

procedure Tfrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ADOCommand : TADOCommand;
  CLIENTE : String;
begin
  CLIENTE := 'Clube';

  ADOCommand := TADOCommand.Create(nil);
  with ADOCommand do begin
    ADOCommand.ConnectionString := DM.con.ConnectionString;
    ADOCommand.CommandText := 'BACKUP DATABASE '+CLIENTE+' TO DISK =''C:\Backup\Backup Clube.bak''';
    ADOCommand.Execute;
  end;
    showmessage('Backup Realizado e salvo em C:\Backup');
      Application.Terminate
end;

procedure Tfrm_main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
          if MessageDlg('Deseja realmente fechar o programa',
              mtConfirmation, [mbYes, mbNo], 0) = mrNo then CanClose := False;

end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  with Tfrm_login.Create(Application) do
  try
     if not(showmodal = mrOk) then
       Application.Terminate;
  finally
    Free;
  end;
end;

procedure Tfrm_main.HelpSobreClick(Sender: TObject);
begin
 with Tfrm_sobre.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.MatriculaCadastroClick(Sender: TObject);
begin
  with Tfrm_cadMatriculas.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.PopupHelpSobreClick(Sender: TObject);
begin
  with Tfrm_sobre.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.RelatorioAtividadeClick(Sender: TObject);
begin
  with Tfrm_relAtividades.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.RelatorioMatriculaClick(Sender: TObject);
begin
   with Tfrm_relMatriculas.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.RelatoriosSociosClick(Sender: TObject);
begin
  with Tfrm_relSocios.Create(Application) do
  try
    showmodal;
  finally
    Free;
  end;
end;

procedure Tfrm_main.SistemaBackupClick(Sender: TObject);
var
  ADOCommand : TADOCommand;
  CLIENTE : String;
begin
  CLIENTE := 'Clube';

  ADOCommand := TADOCommand.Create(nil);
  with ADOCommand do begin
    ADOCommand.ConnectionString := DM.con.ConnectionString;
    ADOCommand.CommandText := 'BACKUP DATABASE '+CLIENTE+' TO DISK =''C:\Backup\Backup Clube.bak''';
    ADOCommand.Execute;
  end;
    showmessage('Backup Realizado e salvo em C:\Backup');
end;

procedure Tfrm_main.SistemaFinalizarClick(Sender: TObject);
begin
  Application.Terminate
end;

procedure Tfrm_main.SociosCadastroClick(Sender: TObject);
begin
  //con a utilização de uma variavél para receber a instáncia do objeto

 //OPÇÃO A
 // frm_cadSocios := Tfrm_cadSocios.Create(Application);

 //OPÇÃO B
  Application.CreateForm(Tfrm_consultaSocios, frm_consultaSocios);

  try
    frm_consultaSocios.showmodal;
  finally
    frm_consultaSocios.Free;
  end;

end;

end.
