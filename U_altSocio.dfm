object frm_altSocio: Tfrm_altSocio
  Left = 0
  Top = 0
  Caption = 'Alterar Socio'
  ClientHeight = 202
  ClientWidth = 697
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
  object lb_nomeSocio: TLabel
    Left = 92
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lb_ruaSocio: TLabel
    Left = 18
    Top = 48
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object lb_codSocio: TLabel
    Left = 16
    Top = 11
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
    Enabled = False
  end
  object Label3: TLabel
    Left = 148
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lb_bairroSocio: TLabel
    Left = 501
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lb_cpfSocio: TLabel
    Left = 362
    Top = 11
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object lb_compSocio: TLabel
    Left = 321
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Comp.:'
  end
  object lb_ufSocio: TLabel
    Left = 300
    Top = 88
    Width = 25
    Height = 13
    Caption = 'U.F.:'
  end
  object lb_cepSocio: TLabel
    Left = 387
    Top = 88
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lb_cidSocio: TLabel
    Left = 19
    Top = 88
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lb_telSocio: TLabel
    Left = 539
    Top = 11
    Width = 22
    Height = 13
    Caption = 'Tel.:'
  end
  object DBedit_nomeSocio: TDBEdit
    Left = 129
    Top = 8
    Width = 219
    Height = 21
    DataField = 'Nome'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 0
  end
  object DBedit_ruaSocio: TDBEdit
    Left = 51
    Top = 45
    Width = 254
    Height = 21
    DataField = 'Endereco'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 1
  end
  object DBedit_codSocio: TDBEdit
    Left = 59
    Top = 8
    Width = 24
    Height = 21
    DataField = 'CodigoSocio'
    DataSource = dmCadastros.dsCadSocio
    Enabled = False
    TabOrder = 2
  end
  object DBedit_bairroSocio: TDBEdit
    Left = 539
    Top = 45
    Width = 150
    Height = 21
    DataField = 'Bairro'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 3
  end
  object DBedit_cpfSocio: TDBEdit
    Left = 395
    Top = 8
    Width = 121
    Height = 21
    DataField = 'CPF'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 4
  end
  object DBedit_compSocio: TDBEdit
    Left = 362
    Top = 45
    Width = 121
    Height = 21
    DataField = 'Complemento'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 5
  end
  object DBedit_ufSocio: TDBEdit
    Left = 333
    Top = 85
    Width = 22
    Height = 21
    DataField = 'Estado'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 6
  end
  object DBedit_cepSocio: TDBEdit
    Left = 420
    Top = 85
    Width = 121
    Height = 21
    DataField = 'CEP'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 7
  end
  object DBedit_cidSocio: TDBEdit
    Left = 62
    Top = 85
    Width = 215
    Height = 21
    DataField = 'Cidade'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 8
  end
  object DBedit_telSocio: TDBEdit
    Left = 567
    Top = 8
    Width = 121
    Height = 21
    DataField = 'Telefone'
    DataSource = dmCadastros.dsCadSocio
    TabOrder = 9
  end
  object bt_salvarSocio: TButton
    Left = 482
    Top = 144
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 10
    OnClick = bt_salvarSocioClick
  end
  object bt_cancelSocio: TButton
    Left = 602
    Top = 144
    Width = 75
    Height = 25
    Caption = '&Canelar'
    TabOrder = 11
    OnClick = bt_cancelSocioClick
  end
end
