object FrameTarefa: TFrameTarefa
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object jpnlConteudoTarefas: TJvPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    object jpnlMenu: TJvPanel
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
      Color = 13347995
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
      object btnExcluir: TJvBitBtn
        Left = 136
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirClick
      end
      object btnGerenciarTarefa: TJvBitBtn
        Left = 264
        Top = 20
        Width = 89
        Height = 25
        Caption = 'Gerenciar Tarefa'
        TabOrder = 2
        OnClick = btnGerenciarTarefaClick
      end
    end
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 113
      Width = 638
      Height = 366
      Align = alClient
      DataSource = DM.DsTarefas
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
    end
    object JvPanel1: TJvPanel
      AlignWithMargins = True
      Left = 3
      Top = 70
      Width = 633
      Height = 40
      Margins.Left = 2
      Margins.Top = 0
      FlatBorder = True
      FlatBorderColor = 9992033
      Align = alTop
      BorderWidth = 1
      Color = 13347995
      ParentBackground = False
      TabOrder = 2
      object cmbFiltroColaborador: TJvDBLookupCombo
        Left = 281
        Top = 9
        Width = 81
        Height = 22
        LookupField = 'ID'
        LookupDisplay = 'nome'
        LookupSource = DM.DsColaboradores
        TabOrder = 0
        OnCloseUp = cmbFiltroColaboradorCloseUp
      end
      object cmbFiltroProjeto: TJvDBLookupCombo
        Left = 176
        Top = 9
        Width = 80
        Height = 22
        LookupField = 'ID'
        LookupDisplay = 'nome'
        LookupSource = DM.DsProjetos
        TabOrder = 1
        OnCloseUp = cmbFiltroProjetoCloseUp
      end
      object btnLimparFiltro: TJvBitBtn
        Left = 388
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Limpar'
        TabOrder = 2
        OnClick = btnLimparFiltroClick
      end
      object edtBuscaTarefa: TJvEdit
        Left = 14
        Top = 9
        Width = 121
        Height = 23
        TabOrder = 3
        Text = ''
        OnChange = edtBuscaTarefaChange
      end
    end
  end
end
