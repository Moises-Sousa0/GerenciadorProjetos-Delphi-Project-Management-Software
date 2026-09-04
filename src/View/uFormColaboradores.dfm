object FormColaborador: TFormColaborador
  Left = 0
  Top = 0
  Caption = 'FormColaborador'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object jpnlCadastroEdicao: TJvPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -40
    ExplicitTop = -8
    object lblNome: TJvLabel
      Left = 32
      Top = 40
      Width = 45
      Height = 21
      Caption = 'Nome'
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
    object lblSenha: TJvLabel
      Left = 32
      Top = 144
      Width = 45
      Height = 21
      Caption = 'Senha'
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
      Top = 248
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
    object edtNome: TJvEdit
      Left = 32
      Top = 63
      Width = 233
      Height = 42
      TabOrder = 0
      Text = ''
    end
    object edtSenha: TJvEdit
      Left = 32
      Top = 167
      Width = 233
      Height = 42
      TabOrder = 1
      Text = ''
    end
    object cmbStatus: TJvComboBox
      Left = 32
      Top = 275
      Width = 233
      Height = 23
      TabOrder = 2
      Text = ''
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
    object btnSalvar: TJvBitBtn
      Left = 32
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TJvBitBtn
      Left = 190
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
  end
end
