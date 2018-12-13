object dmValida: TdmValida
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qryValidaAtiv: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    Left = 40
    Top = 16
  end
  object dsValidaSoc: TDataSource
    DataSet = qryValidaAtiv
    Left = 40
    Top = 72
  end
end
