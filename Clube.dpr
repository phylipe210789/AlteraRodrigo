program Clube;

uses
  Vcl.Forms,
  U_main in 'U_main.pas' {frm_main},
  U_Sobre in 'U_Sobre.pas' {frm_sobre},
  U_consultaSocios in 'U_consultaSocios.pas' {frm_consultaSocios},
  Udm in 'Udm.pas' {DM: TDataModule},
  U_cadAtividade in 'U_cadAtividade.pas' {frm_cadAtividade},
  U_cadMatriculas in 'U_cadMatriculas.pas' {frm_cadMatriculas},
  U_login in 'U_login.pas' {frm_login},
  U_relSocios in 'U_relSocios.pas' {frm_relSocios},
  U_relAtividades in 'U_relAtividades.pas' {frm_relAtividades},
  U_relMatriculas in 'U_relMatriculas.pas' {frm_relMatriculas},
  U_DmCadastros in 'U_DmCadastros.pas' {dmCadastros: TDataModule},
  U_altSocio in 'U_altSocio.pas' {frm_altSocio},
  U_novo_alt_Socio in 'U_novo_alt_Socio.pas' {frm_novo_alt_Socio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
