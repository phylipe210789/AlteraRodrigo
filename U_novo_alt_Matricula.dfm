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
    Width = 79
    Height = 13
    Caption = 'C'#243'digo Matricula'
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
  end
  object bt_cancelSocio: TButton
    Left = 386
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Canelar'
    TabOrder = 3
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
    DataSet = qry2
    Left = 68
    Top = 64
  end
  object qry2: TADOQuery
    Active = True
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from socios')
    Left = 28
    Top = 64
    object qry2CodigoSocio: TAutoIncField
      FieldName = 'CodigoSocio'
      ReadOnly = True
    end
    object qry2Nome: TStringField
      FieldName = 'Nome'
      Size = 15
    end
    object qry2Endereco: TStringField
      FieldName = 'Endereco'
      Size = 25
    end
    object qry2Complemento: TStringField
      FieldName = 'Complemento'
      Size = 10
    end
    object qry2Bairro: TStringField
      FieldName = 'Bairro'
    end
    object qry2Cidade: TStringField
      FieldName = 'Cidade'
    end
    object qry2Estado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qry2CEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qry2Telefone: TStringField
      FieldName = 'Telefone'
      Size = 10
    end
    object qry2CPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 148
    Top = 64
  end
  object qry3: TADOQuery
    Active = True
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from atividades')
    Left = 108
    Top = 64
    object qry3CodigoAtividade: TAutoIncField
      FieldName = 'CodigoAtividade'
      ReadOnly = True
    end
    object qry3Nome: TStringField
      FieldName = 'Nome'
      Size = 25
    end
    object qry3Valor: TBCDField
      FieldName = 'Valor'
      Precision = 9
      Size = 2
    end
  end
  object ds4: TDataSource
    AutoEdit = False
    DataSet = qry4
    Left = 244
    Top = 64
  end
  object qry4: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from matriculas')
    Left = 196
    Top = 64
    object qry4id_matricula: TAutoIncField
      FieldName = 'id_matricula'
      ReadOnly = True
    end
    object qry4CodigoSocio: TIntegerField
      FieldName = 'CodigoSocio'
    end
    object qry4CodigoAtividade: TIntegerField
      FieldName = 'CodigoAtividade'
    end
    object qry4socio: TStringField
      DisplayLabel = 'Socio'
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'socio'
      LookupDataSet = qry2
      LookupKeyFields = 'CodigoSocio'
      LookupResultField = 'Nome'
      KeyFields = 'CodigoSocio'
      Lookup = True
    end
    object qry4atividade: TStringField
      DisplayLabel = 'Atividade'
      FieldKind = fkLookup
      FieldName = 'atividade'
      LookupDataSet = qry3
      LookupKeyFields = 'CodigoAtividade'
      LookupResultField = 'Nome'
      KeyFields = 'CodigoAtividade'
      Size = 100
      Lookup = True
    end
  end
end
