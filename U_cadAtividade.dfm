object frm_cadAtividade: Tfrm_cadAtividade
  Left = 0
  Top = 0
  Caption = 'Cadastro de Atividades'
  ClientHeight = 322
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 2
    Width = 78
    Height = 13
    Caption = 'CodigoAtividade'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 209
    Top = 0
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 94
    Width = 584
    Height = 228
    Align = alBottom
    DataSource = dmCadastros.dsCadAtividade
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator2: TDBNavigator
    Left = 29
    Top = 48
    Width = 240
    Height = 25
    DataSource = dmCadastros.dsCadAtividade
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 29
    Top = 21
    Width = 134
    Height = 21
    DataField = 'CodigoAtividade'
    DataSource = dmCadastros.dsCadAtividade
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 209
    Top = 19
    Width = 329
    Height = 21
    DataField = 'Nome'
    DataSource = dmCadastros.dsCadAtividade
    TabOrder = 3
  end
end
