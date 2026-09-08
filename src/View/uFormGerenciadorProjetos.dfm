object GerenciadorProj: TGerenciadorProj
  Left = 0
  Top = 0
  Caption = 'GerenciadorProj'
  ClientHeight = 441
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlConteudoGerencproj: TJvPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Color = 14666685
    ParentBackground = False
    TabOrder = 0
    object pControlGerenc: TJvPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 441
      ActivePage = tabColab
      Align = alClient
      TabOrder = 0
      ParentColor = False
      Color = 14666685
      object tabDadosProj: TTabSheet
        Caption = 'Dados do Projeto'
        object JvPanel2: TJvPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 411
          Align = alClient
          Color = 14666685
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 296
          ExplicitTop = 232
          ExplicitWidth = 185
          ExplicitHeight = 41
          object lblNomeProjeto: TJvLabel
            Left = 16
            Top = 27
            Width = 40
            Height = 15
            Caption = 'Projeto'
            Color = 14666687
            ParentColor = False
            Transparent = True
          end
          object lblNomeResponsavel: TJvLabel
            Left = 16
            Top = 115
            Width = 67
            Height = 15
            Caption = 'Respons'#225'vel'
            Color = 14732480
            ParentColor = False
            Transparent = True
          end
          object lblStatus: TJvLabel
            Left = 16
            Top = 203
            Width = 34
            Height = 15
            Caption = 'Status'
            Color = 14798529
            ParentColor = False
            Transparent = True
          end
          object cmbStatus: TJvComboBox
            Left = 16
            Top = 224
            Width = 219
            Height = 23
            TabOrder = 0
            Text = ''
            Items.Strings = (
              'EM_PROCESSO'
              'CONCLUIDO')
          end
          object btnSalvar: TJvBitBtn
            Left = 16
            Top = 328
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btnSalvarClick
          end
          object btnCancelar: TJvBitBtn
            Left = 160
            Top = 328
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 2
            OnClick = btnCancelarClick
          end
          object cmbResponsavel: TJvDBLookupCombo
            Left = 16
            Top = 136
            Width = 219
            Height = 22
            LookupField = 'ID'
            LookupDisplay = 'nome'
            LookupSource = DM.DsColaboradores
            TabOrder = 3
          end
          object edtNomeProjeto: TJvEdit
            Left = 16
            Top = 48
            Width = 219
            Height = 23
            TabOrder = 4
            Text = ''
          end
        end
      end
      object tabColab: TTabSheet
        Caption = 'Colaboradores'
        ImageIndex = 1
        object JvPanel1: TJvPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 411
          Align = alClient
          BevelOuter = bvNone
          Color = 14666685
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 504
          ExplicitTop = 24
          ExplicitWidth = 185
          ExplicitHeight = 41
          object lblColaboradores: TJvLabel
            Left = 24
            Top = 26
            Width = 79
            Height = 15
            Caption = 'Colaboradores'
            Color = 14666687
            ParentColor = False
            Transparent = True
          end
          object btnAdicionarColab: TJvBitBtn
            Left = 326
            Top = 44
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 0
            OnClick = btnAdicionarColabClick
          end
          object btnRemoverColab: TJvBitBtn
            Left = 454
            Top = 44
            Width = 75
            Height = 25
            Caption = 'Remover'
            TabOrder = 1
            OnClick = btnRemoverColabClick
          end
          object cmbColaboradores: TJvDBLookupCombo
            Left = 24
            Top = 47
            Width = 219
            Height = 22
            LookupField = 'ID'
            LookupDisplay = 'nome'
            LookupSource = DM.DsColaboradores
            TabOrder = 2
          end
          object JvDBGrid1: TJvDBGrid
            Left = 0
            Top = 163
            Width = 576
            Height = 248
            Align = alBottom
            DataSource = dsColaboradoresProjeto
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            BevelInner = bvNone
            BevelOuter = bvNone
            AlternateRowColor = 14671839
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 19
            TitleRowHeight = 19
          end
        end
      end
    end
  end
  object dsColaboradoresProjeto: TDataSource
    Left = 556
    Top = 410
  end
end
