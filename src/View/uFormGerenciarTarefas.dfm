object GerenciarTaref: TGerenciarTaref
  Left = 0
  Top = 0
  Caption = 'GerenciarTaref'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object jpnlGerenciarTarefas: TJvPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Margins.Left = 30
    Align = alClient
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 14666687
    ParentBackground = False
    TabOrder = 0
    object lblNomeTarefa: TJvLabel
      Left = 32
      Top = 40
      Width = 111
      Height = 21
      Caption = 'Nome da Tarefa'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblResponsavel: TJvLabel
      Left = 32
      Top = 147
      Width = 89
      Height = 21
      Caption = 'Respons'#225'vel'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblStatus: TJvLabel
      Left = 32
      Top = 245
      Width = 44
      Height = 21
      Caption = 'Status'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object edtNomeTarefa: TJvEdit
      Left = 32
      Top = 63
      Width = 233
      Height = 23
      TabOrder = 0
      Text = ''
    end
    object btnSalvar: TJvBitBtn
      Left = 32
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TJvBitBtn
      Left = 190
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
    end
    object cmbResponsavel: TJvDBLookupCombo
      Left = 32
      Top = 171
      Width = 233
      Height = 22
      LookupField = 'ID'
      LookupDisplay = 'nome'
      LookupSource = DsColabProjetos
      TabOrder = 3
    end
    object cmbStatus: TJvComboBox
      Left = 32
      Top = 272
      Width = 233
      Height = 23
      TabOrder = 4
      Text = ''
      Items.Strings = (
        'CONCLUIDA'
        'PENDENTE')
    end
  end
  object DsColabProjetos: TDataSource
    Left = 552
    Top = 376
  end
end
