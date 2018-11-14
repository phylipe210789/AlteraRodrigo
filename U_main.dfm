object frm_main: Tfrm_main
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Socios'
  ClientHeight = 692
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MenuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MenuPrincipal: TMainMenu
    Left = 24
    Top = 24
    object MenuSistema: TMenuItem
      Caption = '&Sistema'
      object SistemaBackup: TMenuItem
        Caption = '&Backup'
        OnClick = SistemaBackupClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SistemaFinalizar: TMenuItem
        Caption = '&Finalizar'
        ShortCut = 16472
        OnClick = SistemaFinalizarClick
      end
    end
    object MenuSocios: TMenuItem
      Caption = '&Socios'
      object SociosCadastro: TMenuItem
        Caption = '&Cadastro'
        OnClick = SociosCadastroClick
      end
    end
    object MenuAtividades: TMenuItem
      Caption = '&Atividades'
      object AtividadeCadastro: TMenuItem
        Caption = 'Cadastro'
        OnClick = AtividadeCadastroClick
      end
    end
    object Matricula1: TMenuItem
      Caption = '&Matricula'
      Hint = 'MenuMatricula'
      object MatriculaCadastro: TMenuItem
        Caption = '&Cadastro'
        OnClick = MatriculaCadastroClick
      end
    end
    object MenuRelatorios: TMenuItem
      Caption = '&Relatorios'
      object RelatoriosSocios: TMenuItem
        Caption = '&Socios'
        OnClick = RelatoriosSociosClick
      end
      object RelatorioAtividade: TMenuItem
        Caption = '&Atividades'
        OnClick = RelatorioAtividadeClick
      end
      object RelatorioMatricula: TMenuItem
        Caption = '&Matriculas'
        OnClick = RelatorioMatriculaClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = 'Help'
      object HelpTopicos: TMenuItem
        Caption = '&Topicos'
      end
      object HelpSobre: TMenuItem
        Caption = '&Sobre'
        OnClick = HelpSobreClick
      end
    end
  end
end
