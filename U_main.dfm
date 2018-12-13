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
  object ProgressBar1: TProgressBar
    Left = 321
    Top = 241
    Width = 504
    Height = 32
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 673
    Width = 1094
    Height = 19
    Panels = <
      item
        Text = 'Backup sendo realizado, aguarde!'
        Width = 180
      end
      item
        Style = psOwnerDraw
        Width = 1000
      end>
    Visible = False
    OnDrawPanel = StatusBar1DrawPanel
    ExplicitLeft = 312
    ExplicitTop = 504
    ExplicitWidth = 0
  end
  object MenuPrincipal: TMainMenu
    Left = 24
    Top = 24
    object MenuSistema: TMenuItem
      Caption = '&Sistema'
      object MudarUsuario: TMenuItem
        Caption = 'Mudar Usu'#225'rio'
        OnClick = MudarUsuarioClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
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
    object MenuMatricula: TMenuItem
      Caption = '&Matricula'
      Hint = 'MenuMatricula'
      object MatriculaCadastro: TMenuItem
        Caption = '&Cadastro'
        OnClick = MatriculaCadastroClick
      end
    end
    object MenuUsuario: TMenuItem
      Caption = '&Usu'#225'rios'
      Visible = False
      object UsuarioCadastro: TMenuItem
        Caption = '&Cadastro'
        OnClick = UsuarioCadastroClick
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
      object RelatorioUsuario: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = RelatorioUsuarioClick
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
