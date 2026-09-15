# Gerenciador de Projetos (Delphi)

Sistema desktop de gestão de projetos e tarefas, desenvolvido em **Delphi 12 Community Edition** com **SQL Server**, como desafio técnico com prazo de 15 dias.

## Stack

- **Delphi 12 CE** + **JVCL/JCL** 
- **SQL Server** via `ADOConnection` (ADO)
- Arquitetura em camadas: **View → Controller → DAO → DM**

## Arquitetura

```
src/
├── View/        # Forms e Frames (telas), sem SQL direto
├── Controller/   # Regras de negócio, repassa pra DAO
└── Model/
    └── DAO/     # Acesso a dados (TADOQuery/TADOStoredProc)
```

- **DM** (`DMPrincipal.pas`): DataModule com a conexão (`ADOConnection1`) e queries centrais, instância global `DM`.
- **DAO**: uma classe por entidade, com `TADOQuery`/`TADOStoredProc` temporárias (create/free por operação), parâmetros nomeados.
- **Controller**: recebe a DAO pronta no construtor, expõe métodos de negócio (ex: `Adicionar`, `Editar`, `Excluir`, `Concluir`, `Reabrir`).
- **Tela principal**: menu lateral (`TJvPanel`) + área de conteúdo onde os módulos são trocados via `Frame` (método `AbrirModulo`).

## Módulos

| Módulo | Status | Descrição |
|---|---|---|
| **Colaboradores** |  Completo | CRUD (nome, senha, status Ativo/Inativo) |
| **Projetos** |  Completo | CRUD + gerenciamento via modal com abas (Dados / Colaboradores), concluir/reabrir, vínculo N:N com colaboradores |
| **Tarefas** |  Completo | CRUD + filtro por projeto/colaborador/nome, concluir/reabrir, combobox de responsável filtrado pelos colaboradores do projeto selecionado |
| **Dashboard** |  Completo | Visualização baseada na view `vw_ResumoProjetos` |

## Banco de dados

Tabelas: `Colaboradores`, `Projetos`, `Projeto_colaboradores`, `Tarefas`.

Procedures:
- `CriarProjeto`, `ConcluirProjeto`
- `ConcluirTarefa`

View:
- `vw_ResumoProjetos` — total de tarefas, concluídas e pendentes por projeto

Índices:
- `IX_Tarefas_ID_Projeto`, `IX_Tarefas_ID_Colaborador`, `IX_Projeto_ID_Status`

## Regras de negócio

- Colaborador inativo não pode ser vinculado a projeto ou tarefa (validado na camada de Control/DAO).
- Concluir projeto/tarefa usa procedure no banco (valida pendências); reabrir é `UPDATE` direto, sem procedure.
- Responsável de um projeto também precisa constar em `Projeto_colaboradores`; trocar o responsável sincroniza essa tabela.

---

<img width="1908" height="1032" alt="image" src="https://github.com/user-attachments/assets/c41f7866-d981-4a03-974e-76c7e6c97e38" />
<img width="1912" height="1029" alt="image" src="https://github.com/user-attachments/assets/e4ebe6aa-93fe-4091-90be-3b02c4c60e62" />


