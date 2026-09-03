object FrameColaboradores: TFrameColaboradores
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Color = clBtnShadow
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
    ExplicitLeft = 328
    ExplicitTop = 344
    ExplicitWidth = 185
    ExplicitHeight = 41
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 1
      Width = 638
      Height = 415
      Align = alClient
      DataSource = DM.DsColaboradores
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
    end
  end
end
