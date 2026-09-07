object FrameProjeto: TFrameProjeto
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Color = 13347482
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object jpnlConteudoProjetos: TJvPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
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
      TabOrder = 0
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
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 70
      Width = 638
      Height = 409
      Align = alClient
      DataSource = DM.DsProjetos
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
          FieldName = 'ID_criador'
          Title.Caption = 'Respons'#225'vel'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 174
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Title.Caption = 'Status'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data_criacao'
          Title.Caption = 'Data de cria'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data_conclusao'
          Visible = True
        end>
    end
  end
end
