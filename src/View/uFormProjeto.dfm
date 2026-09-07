object FormProjeto: TFormProjeto
  Left = 0
  Top = 0
  Caption = 'FormProjeto'
  ClientHeight = 441
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object jpnlCadastroEdicao: TJvPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 441
    Margins.Left = 30
    Align = alClient
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 14666685
    ParentBackground = False
    TabOrder = 0
    object lblNomeProjeto: TJvLabel
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      Caption = 'Nome do Projeto'
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
      Top = 144
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
    object edtNomeProjeto: TJvEdit
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
      LookupSource = DM.DsColaboradores
      TabOrder = 3
    end
  end
end
