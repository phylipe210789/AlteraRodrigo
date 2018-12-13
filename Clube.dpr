program Clube;

uses
  Vcl.Forms,
  U_main in 'U_main.pas' {frm_main},
  U_Sobre in 'U_Sobre.pas' {frm_sobre},
  U_consultaSocios in 'U_consultaSocios.pas' {frm_consultaSocios},
  Udm in 'Udm.pas' {DM: TDataModule},
  U_consultaAtividade in 'U_consultaAtividade.pas' {frm_consultaAtividade},
  U_consultaMatricula in 'U_consultaMatricula.pas' {frm_consultaMatricula},
  U_login in 'U_login.pas' {frm_login},
  U_relSocios in 'U_relSocios.pas' {frm_relSocios},
  U_relAtividades in 'U_relAtividades.pas' {frm_relAtividades},
  U_relMatriculas in 'U_relMatriculas.pas' {frm_relMatriculas},
  U_DmCadastros in 'U_DmCadastros.pas' {dmCadastros: TDataModule},
  U_novo_alt_Socio in 'U_novo_alt_Socio.pas' {frm_novo_alt_Socio},
  U_novo_alt_Atividade in 'U_novo_alt_Atividade.pas' {frm_novo_alt_Atividade},
  U_novo_alt_Matricula in 'U_novo_alt_Matricula.pas' {frm_novo_alt_Matricula},
  U_consultaUsuario in 'U_consultaUsuario.pas' {frm_consultaUsuario},
  U_novo_alt_Usuario in 'U_novo_alt_Usuario.pas' {frm_novo_alt_Usuario},
  U_relUsuarios in 'U_relUsuarios.pas' {frm_relUsuario},
  U_DmValida in 'U_DmValida.pas' {dmValida: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
