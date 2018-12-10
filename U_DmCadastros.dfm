object dmCadastros: TdmCadastros
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 144
  Width = 309
  object dsCadSocio: TDataSource
    DataSet = qryCadSocio
    Left = 38
    Top = 72
  end
  object qryCadSocio: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from socios')
    Left = 38
    Top = 24
    object qryCadSocioCodigoSocio: TAutoIncField
      FieldName = 'CodigoSocio'
      ReadOnly = True
    end
    object qryCadSocioNome: TStringField
      FieldName = 'Nome'
      Size = 15
    end
    object qryCadSocioEndereco: TStringField
      FieldName = 'Endereco'
      Size = 25
    end
    object qryCadSocioComplemento: TStringField
      FieldName = 'Complemento'
      Size = 10
    end
    object qryCadSocioBairro: TStringField
      FieldName = 'Bairro'
    end
    object qryCadSocioCidade: TStringField
      FieldName = 'Cidade'
    end
    object qryCadSocioEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryCadSocioCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryCadSocioTelefone: TStringField
      FieldName = 'Telefone'
      Size = 10
    end
    object qryCadSocioCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
  end
  object dsCadAtividade: TDataSource
    DataSet = qryCadAtividade
    Left = 129
    Top = 69
  end
  object qryCadAtividade: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from atividades')
    Left = 127
    Top = 16
    object qryCadAtividadeCodigoAtividade: TAutoIncField
      FieldName = 'CodigoAtividade'
      ReadOnly = True
    end
    object qryCadAtividadeNome: TStringField
      FieldName = 'Nome'
      Size = 25
    end
    object qryCadAtividadeValor: TBCDField
      FieldName = 'Valor'
      Precision = 9
      Size = 2
    end
  end
  object qryCadUsuario: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from login')
    Left = 215
    Top = 16
    object qryCadUsuarioid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object qryCadUsuariologin: TStringField
      FieldName = 'login'
      Size = 15
    end
    object qryCadUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 50
    end
  end
  object dsCadUsuario: TDataSource
    DataSet = qryCadUsuario
    Left = 217
    Top = 69
  end
end
