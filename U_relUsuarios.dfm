object frm_relUsuario: Tfrm_relUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorio de Usuarios'
  ClientHeight = 167
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_relUsuario: TLabel
    Left = 64
    Top = 42
    Width = 41
    Height = 13
    Caption = 'Usu'#225'rios'
    Enabled = False
  end
  object bt_gera: TButton
    Left = 72
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = bt_geraClick
  end
  object chk_relUsuario: TCheckBox
    Left = 280
    Top = 41
    Width = 65
    Height = 17
    Caption = 'Todos'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = chk_relUsuarioClick
  end
  object br_cancela: TButton
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = br_cancelaClick
  end
  object DBCB_relUsuario: TDBLookupComboBox
    Left = 119
    Top = 37
    Width = 145
    Height = 21
    Enabled = False
    KeyField = 'id_user'
    ListField = 'login'
    ListSource = dmCadastros.dsCadUsuario
    TabOrder = 3
  end
  object qry_relUsuario: TADOQuery
    Active = True
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_user'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      '  * '
      'from '
      '  login'
      'where '
      '  convert(varchar(10),id_user) like :id_user')
    Left = 352
    Top = 8
    object qry_relUsuarioid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object qry_relUsuariologin: TStringField
      FieldName = 'login'
      Size = 15
    end
    object qry_relUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 50
    end
  end
  object ds_relUsuario: TDataSource
    DataSet = qry_relUsuario
    Left = 360
    Top = 56
  end
  object ppDB_relUsuario: TppDBPipeline
    DataSource = ds_relUsuario
    UserName = 'Usuario'
    Left = 296
    Top = 80
    object ppDB_relUsuarioppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'id_user'
      FieldName = 'id_user'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB_relUsuarioppField2: TppField
      FieldAlias = 'login'
      FieldName = 'login'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDB_relUsuarioppField3: TppField
      FieldAlias = 'senha'
      FieldName = 'senha'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
  end
  object pp_relUsuario: TppReport
    AutoStop = False
    DataPipeline = ppDB_relUsuario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Datacamp\Exercicio1\rel_atividades.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 360
    Top = 104
    Version = '16.02'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB_relUsuario'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'RELAT'#211'RIO DE USU'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 51065
        mmTop = 0
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 14288
        mmWidth = 197644
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197644
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 20638
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 15346
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 162454
        mmTop = 2117
        mmWidth = 31221
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'id_user'
        DataPipeline = ppDB_relUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB_relUsuario'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 794
        mmWidth = 11906
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'login'
        DataPipeline = ppDB_relUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDB_relUsuario'
        mmHeight = 4498
        mmLeft = 20638
        mmTop = 794
        mmWidth = 42333
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'Projeto Clube'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 82286
        mmTop = 1323
        mmWidth = 33338
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 97896
        mmTop = 8202
        mmWidth = 1852
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
