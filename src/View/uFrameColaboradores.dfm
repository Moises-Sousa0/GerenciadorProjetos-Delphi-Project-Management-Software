object FrameColaboradores: TFrameColaboradores
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Color = clBlue
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object jpnlConteudoColab: TJvPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 1
      Width = 638
      Height = 415
      Align = alClient
      Color = clBtnFace
      DataSource = DM.DsColaboradores
      GradientEndColor = clBtnFace
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
      ReadOnlyCellColor = clBtnFace
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Title.Caption = 'Status'
          Visible = True
        end>
    end
    object jpnlMenuColab: TJvPanel
      Left = 1
      Top = 416
      Width = 638
      Height = 63
      Align = alBottom
      TabOrder = 1
      object btnAdicionar: TJvBitBtn
        Left = 248
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 0
        OnClick = btnAdicionarClick
      end
      object btnEditar: TJvBitBtn
        Left = 344
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 1
        OnClick = btnEditarClick
      end
      object btnExcluir: TJvBitBtn
        Left = 440
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
  end
end
