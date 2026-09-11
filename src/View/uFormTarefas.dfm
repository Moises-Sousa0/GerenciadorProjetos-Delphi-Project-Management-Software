object FormTarefas: TFormTarefas
  Left = 0
  Top = 0
  Caption = 'FormTarefas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object jpnlCadastroEdicao: TJvPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Margins.Left = 30
    Align = alClient
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 14666685
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
      Top = 232
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
    object lblProjeto: TJvLabel
      Left = 32
      Top = 136
      Width = 118
      Height = 21
      Caption = 'Projeto da Tarefa'
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
      OnClick = btnCancelarClick
    end
    object cmbResponsavel: TJvDBLookupCombo
      Left = 32
      Top = 259
      Width = 233
      Height = 22
      LookupField = 'ID'
      LookupDisplay = 'nome'
      LookupSource = DsColabProjeto
      TabOrder = 3
    end
    object cmbProjetoTarefa: TJvDBLookupCombo
      Left = 32
      Top = 163
      Width = 233
      Height = 22
      LookupField = 'ID'
      LookupDisplay = 'nome'
      LookupSource = DM.DsProjetos
      TabOrder = 4
      OnChange = cmbProjetoTarefaChange
    end
  end
  object DsColabProjeto: TDataSource
    Left = 584
    Top = 408
  end
end
