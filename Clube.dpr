program Clube;

uses
  Vcl.Forms,
  U_main in 'U_main.pas' {frm_main},
  U_Sobre in 'U_Sobre.pas' {frm_sobre},
  U_consultaSocios in 'U_consultaSocios.pas' {frm_consultaSocios},
  Udm in 'Udm.pas' {DM: TDataModule},
  U_consultaAtividade in 'U_consultaAtividade.pas' {frm_consultaAtividade},
  U_cadMatriculas in 'U_cadMatriculas.pas' {frm_cadMatriculas},
  U_login in 'U_login.pas' {frm_login},
  U_relSocios in 'U_relSocios.pas' {frm_relSocios},
  U_relAtividades in 'U_relAtividades.pas' {frm_relAtividades},
  U_relMatriculas in 'U_relMatriculas.pas' {frm_relMatriculas},
  U_DmCadastros in 'U_DmCadastros.pas' {dmCadastros: TDataModule},
  U_novo_alt_Socio in 'U_novo_alt_Socio.pas' {frm_novo_alt_Socio},
  U_novo_alt_Atividade in 'U_novo_alt_Atividade.pas' {frm_novo_alt_Atividade};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
