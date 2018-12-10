object frm_novo_alt_Usuario: Tfrm_novo_alt_Usuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 162
  ClientWidth = 273
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
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 48
    Top = 72
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object bt_salvarSocio: TButton
    Left = 51
    Top = 130
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 2
    OnClick = bt_salvarSocioClick
  end
  object bt_cancelSocio: TButton
    Left = 148
    Top = 130
    Width = 75
    Height = 25
    Caption = '&Canelar'
    TabOrder = 3
    OnClick = bt_cancelSocioClick
  end
  object DBedit_Senha: TDBEdit
    Left = 48
    Top = 93
    Width = 177
    Height = 21
    DataField = 'senha'
    DataSource = dsLogin
    PasswordChar = '*'
    TabOrder = 1
  end
  object DBedit_Usuario: TDBEdit
    Left = 48
    Top = 29
    Width = 177
    Height = 21
    DataField = 'login'
    DataSource = dsLogin
    TabOrder = 0
  end
  object dsLogin: TDataSource
    DataSet = frm_consultaUsuario.qryCadLogin
    Left = 231
    Top = 56
  end
end
