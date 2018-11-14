object frm_login: Tfrm_login
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 212
  ClientWidth = 418
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
    Left = 120
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 120
    Top = 88
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Edit1: TEdit
    Left = 120
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 144
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Entra'
    TabOrder = 2
    OnClick = Button1Click
    OnKeyPress = Button1KeyPress
  end
  object Edit2: TEdit
    Left = 120
    Top = 120
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object dslogin: TDataSource
    DataSet = qrylogin
    Left = 344
    Top = 56
  end
  object qrylogin: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from login')
    Left = 280
    Top = 56
    object qryloginid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object qryloginlogin: TStringField
      FieldName = 'login'
      Size = 15
    end
    object qryloginsenha: TStringField
      FieldName = 'senha'
      Size = 50
    end
  end
end
