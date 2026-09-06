object FrameProjeto: TFrameProjeto
  Left = 0
  Top = 0
  Width = 624
  Height = 441
  TabOrder = 0
  object jpnlConteudoProjetos: TJvPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 264
    ExplicitTop = 304
    ExplicitWidth = 185
    ExplicitHeight = 41
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 70
      Width = 622
      Height = 370
      Align = alClient
      DataSource = DM.DsProjetos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 19
      TitleRowHeight = 19
    end
    object jpnlMenuColab: TJvPanel
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 614
      Height = 63
      Margins.Left = 5
      FlatBorder = True
      Align = alTop
      BorderWidth = 1
      TabOrder = 1
      ExplicitLeft = 5
      ExplicitTop = 3
      ExplicitWidth = 616
      object btnAdicionar: TJvBitBtn
        Left = 16
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnEditar: TJvBitBtn
        Left = 136
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 1
      end
      object btnExcluir: TJvBitBtn
        Left = 256
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
  end
end
