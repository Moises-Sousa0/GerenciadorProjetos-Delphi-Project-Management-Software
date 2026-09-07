object FrameColaboradores: TFrameColaboradores
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object jpnlConteudoColab: TJvPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    FlatBorder = True
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 634
    ExplicitHeight = 474
    object JvDBGrid1: TJvDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 73
      Width = 632
      Height = 403
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = DM.DsColaboradores
      GradientEndColor = clWhite
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'Nome'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'Status'
          Width = 90
          Visible = True
        end>
    end
    object jpnlMenuColab: TJvPanel
      AlignWithMargins = True
      Left = 3
      Top = 4
      Width = 633
      Height = 63
      Margins.Left = 2
      FlatBorder = True
      FlatBorderColor = 9992033
      Align = alTop
      BorderWidth = 1
      Color = 13347482
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 5
      ExplicitWidth = 625
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
        OnClick = btnAdicionarClick
      end
      object btnEditar: TJvBitBtn
        Left = 136
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 1
        OnClick = btnEditarClick
      end
      object btnExcluir: TJvBitBtn
        Left = 256
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
  end
end
