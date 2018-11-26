object frm_novo_alt_Atividade: Tfrm_novo_alt_Atividade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 156
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb_cpfSocio: TLabel
    Left = 113
    Top = 51
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object lb_nomeSocio: TLabel
    Left = 92
    Top = 11
    Width = 49
    Height = 13
    Caption = 'Atividade:'
  end
  object lb_codSocio: TLabel
    Left = 16
    Top = 11
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
    Enabled = False
  end
  object DBedit_valorAtividade: TDBEdit
    Left = 147
    Top = 48
    Width = 46
    Height = 21
    DataField = 'Valor'
    DataSource = DS
    TabOrder = 1
  end
  object DBedit_nomeAtividade: TDBEdit
    Left = 147
    Top = 8
    Width = 219
    Height = 21
    DataField = 'Nome'
    DataSource = DS
    TabOrder = 0
  end
  object DBedit_codAtividade: TDBEdit
    Left = 59
    Top = 8
    Width = 24
    Height = 21
    DataField = 'CodigoAtividade'
    DataSource = DS
    Enabled = False
    TabOrder = 4
  end
  object bt_salvarSocio: TButton
    Left = 212
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 2
    OnClick = bt_salvarSocioClick
  end
  object bt_cancelSocio: TButton
    Left = 308
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Canelar'
    TabOrder = 3
    OnClick = bt_cancelSocioClick
  end
  object DS: TDataSource
    DataSet = frm_consultaAtividade.qryCadAtividade
    Left = 88
    Top = 104
  end
end
