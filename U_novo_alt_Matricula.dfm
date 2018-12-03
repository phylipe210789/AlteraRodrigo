object frm_novo_alt_Matricula: Tfrm_novo_alt_Matricula
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 121
  ClientWidth = 469
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
    Left = 116
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Socio'
  end
  object Label2: TLabel
    Left = 316
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Atividade'
  end
  object lb_codSocio: TLabel
    Left = 27
    Top = 8
    Width = 69
    Height = 13
    Caption = 'C'#243'd. Matricula'
    Enabled = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 116
    Top = 27
    Width = 145
    Height = 21
    DataField = 'CodigoSocio'
    DataSource = ds4
    KeyField = 'CodigoSocio'
    ListField = 'Nome'
    ListSource = ds2
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 316
    Top = 27
    Width = 145
    Height = 21
    DataField = 'CodigoAtividade'
    DataSource = ds4
    KeyField = 'CodigoAtividade'
    ListField = 'Nome'
    ListSource = ds3
    TabOrder = 1
  end
  object bt_salvarSocio: TButton
    Left = 290
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 2
    OnClick = bt_salvarSocioClick
  end
  object bt_cancelSocio: TButton
    Left = 386
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Canelar'
    TabOrder = 3
    OnClick = bt_cancelSocioClick
  end
  object DBedit_codSocio: TDBEdit
    Left = 27
    Top = 27
    Width = 24
    Height = 21
    DataField = 'id_matricula'
    DataSource = ds4
    Enabled = False
    TabOrder = 4
  end
  object ds2: TDataSource
    DataSet = frm_consultaMatricula.qry2
    Left = 76
    Top = 64
  end
  object ds3: TDataSource
    DataSet = frm_consultaMatricula.qry3
    Left = 124
    Top = 64
  end
  object ds4: TDataSource
    AutoEdit = False
    DataSet = frm_consultaMatricula.qry4
    Left = 172
    Top = 64
  end
end
