object frm_relMatriculas: Tfrm_relMatriculas
  Left = 0
  Top = 0
  Caption = 'Relatorio de Matriculas'
  ClientHeight = 277
  ClientWidth = 371
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
  object lbl_relSocios: TLabel
    Left = 80
    Top = 53
    Width = 34
    Height = 13
    Caption = 'S'#243'cios:'
    Enabled = False
  end
  object lbl_relAtividades: TLabel
    Left = 65
    Top = 162
    Width = 49
    Height = 13
    Caption = 'Atividade:'
    Enabled = False
  end
  object bt_gera: TButton
    Left = 96
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = bt_geraClick
  end
  object br_cancela: TButton
    Left = 240
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = br_cancelaClick
  end
  object DBCB_relSocios: TDBLookupComboBox
    Left = 120
    Top = 48
    Width = 145
    Height = 21
    Enabled = False
    KeyField = 'CodigoSocio'
    ListField = 'Nome'
    ListSource = dmCadastros.dsCadSocio
    TabOrder = 2
  end
  object chk_relSocios: TCheckBox
    Left = 281
    Top = 52
    Width = 65
    Height = 17
    Caption = 'Todos'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = chk_relSociosClick
  end
  object DBCB_relAtividades: TDBLookupComboBox
    Left = 120
    Top = 157
    Width = 145
    Height = 21
    Enabled = False
    KeyField = 'CodigoAtividade'
    ListField = 'Nome'
    ListSource = dmCadastros.dsCadAtividade
    TabOrder = 4
  end
  object chk_relAtividades: TCheckBox
    Left = 281
    Top = 161
    Width = 65
    Height = 17
    Caption = 'Todos'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = chk_relAtividadesClick
  end
  object ppDB_relMatriculas: TppDBPipeline
    DataSource = ds_relMatriculas
    UserName = 'Socios'
    Left = 256
    Top = 184
    object ppDB_relMatriculasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'id_matricula'
      FieldName = 'id_matricula'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB_relMatriculasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'Valor'
      FieldName = 'Valor'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDB_relMatriculasppField3: TppField
      FieldAlias = 'socio'
      FieldName = 'socio'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppDB_relMatriculasppField4: TppField
      FieldAlias = 'atividade'
      FieldName = 'atividade'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
  end
  object pp_relMatriculas: TppReport
    AutoStop = False
    DataPipeline = ppDB_relMatriculas
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
    Template.FileName = 'C:\Datacamp\Exercicio1\rel_socios.rtm'
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
    Left = 256
    Top = 120
    Version = '16.02'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB_relMatriculas'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'RELAT'#211'RIO DE MATRICULAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 62177
        mmTop = 0
        mmWidth = 72761
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 10843
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Nome do Matriculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 73025
        mmTop = 11636
        mmWidth = 35983
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'C'#243'dido da Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 11642
        mmWidth = 33866
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4234
        mmLeft = 159836
        mmTop = 11636
        mmWidth = 8996
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
        mmLeft = 163248
        mmTop = 1323
        mmWidth = 31221
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 16663
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'id_matricula'
        DataPipeline = ppDB_relMatriculas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB_relMatriculas'
        mmHeight = 4498
        mmLeft = 9790
        mmTop = 1323
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'socio'
        DataPipeline = ppDB_relMatriculas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB_relMatriculas'
        mmHeight = 4498
        mmLeft = 73053
        mmTop = 1323
        mmWidth = 42069
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'Valor'
        DataPipeline = ppDB_relMatriculas
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB_relMatriculas'
        mmHeight = 4498
        mmLeft = 158249
        mmTop = 1323
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        DataField = 'Valor'
        DataPipeline = ppDB_relMatriculas
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDB_relMatriculas'
        mmHeight = 4498
        mmLeft = 158249
        mmTop = 1852
        mmWidth = 17198
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 136024
        mmTop = 1852
        mmWidth = 19844
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'atividade'
      DataPipeline = ppDB_relMatriculas
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB_relMatriculas'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label8'
          Caption = 'Atividade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 530
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText3'
          DataField = 'atividade'
          DataPipeline = ppDB_relMatriculas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB_relMatriculas'
          mmHeight = 4498
          mmLeft = 28840
          mmTop = 530
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 146342
          mmTop = 3175
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc2: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc2'
          DataField = 'Valor'
          DataPipeline = ppDB_relMatriculas
          DisplayFormat = '$#,0.00;-$#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppDB_relMatriculas'
          mmHeight = 4498
          mmLeft = 158249
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
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
  object ds_relMatriculas: TDataSource
    DataSet = qry_relMatriculas
    Left = 256
    Top = 56
  end
  object qry_relMatriculas: TADOQuery
    Active = True
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codigosocio'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'codigoatividade'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      
        '       M.id_matricula, S.Nome as socio, A.Nome as atividade, A.V' +
        'alor '
      'FROM '
      '       Matriculas M'
      'INNER JOIN '
      '      Socios S ON S.CodigoSocio = M.CodigoSocio'
      'INNER JOIN '
      '      Atividades A ON A.CodigoAtividade = M.CodigoAtividade'
      'WHERE '
      '      convert(varchar(10),M.CodigoSocio) like :codigosocio'
      
        '      AND convert(varchar(10),M.CodigoAtividade) like :codigoati' +
        'vidade '
      'order by '
      '      A.nome')
    Left = 256
    object qry_relMatriculasid_matricula: TAutoIncField
      FieldName = 'id_matricula'
      ReadOnly = True
    end
    object qry_relMatriculasValor: TBCDField
      FieldName = 'Valor'
      Precision = 9
      Size = 2
    end
    object qry_relMatriculassocio: TStringField
      FieldName = 'socio'
      Size = 15
    end
    object qry_relMatriculasatividade: TStringField
      FieldName = 'atividade'
      Size = 25
    end
  end
end
