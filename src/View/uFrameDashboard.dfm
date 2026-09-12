object FrameDashboard: TFrameDashboard
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object jpnlMenuDash: TJvPanel
    AlignWithMargins = True
    Left = 2
    Top = 3
    Width = 635
    Height = 63
    Margins.Left = 2
    FlatBorder = True
    FlatBorderColor = 9992033
    Align = alTop
    BorderWidth = 1
    Color = 13347995
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 4
    ExplicitWidth = 633
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 69
    Width = 640
    Height = 411
    Align = alClient
    DataSource = DM.DsDashBoard
    TabOrder = 1
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
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = 'Status Projeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_criacao'
        Title.Caption = 'Data de Cria'#231#227'o'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_conclusao'
        Title.Caption = 'Data de Conclus'#227'o'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_tarefas'
        Title.Caption = 'Total de Tarefas'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarefas_concluidas'
        Title.Caption = 'Tarefas Concluidas'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarefas_pendentes'
        Title.Caption = 'Tarefas Pendentes'
        Width = 129
        Visible = True
      end>
  end
end
