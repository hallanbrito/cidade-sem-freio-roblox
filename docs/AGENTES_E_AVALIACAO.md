# Agentes e experimento comparativo

## Propósito

Avaliar como Codex, AGY, Claude Code e Hermes colaboram na construção do mesmo MVP e registrar aprendizados para o Maestro Router. Nenhum agente recebe vantagem por uma arquitetura feita só para ele.

## Entradas por agente

| Agente | Guia do projeto | Perfil de colaboração | Skill aplicável |
|---|---|---|---|
| Codex | `AGENTS.md` | `.agents/profiles/codex.md` | `.agents/skills/*/SKILL.md` conforme tarefa |
| AGY / Antigravity | `AGENTS.md`, `GEMINI.md` | `.agents/profiles/agy.md` | skill relevante fornecida como contexto |
| Claude Code | `AGENTS.md`, `CLAUDE.md` | `.agents/profiles/claude-code.md` | skill relevante fornecida como contexto |
| Hermes | `AGENTS.md`, `HERMES.md` | `.agents/profiles/hermes.md` | skills relevantes distribuídas aos agentes |

Arquivos do repositório orientam o trabalho, mas nem todos os clientes carregam os mesmos nomes automaticamente. Antes de cada teste, registrar o que a ferramenta realmente carregou.

## Protocolo justo

- Mesmo commit inicial, prompt, escopo e critérios para tarefas comparáveis.
- Branch/worktree isolada por tentativa.
- Não compartilhar a solução de outro agente antes da execução.
- Registrar versões/modelos, contexto aplicado, tempo, uso/custo exposto pela ferramenta, diff, testes, retrabalho e bloqueios.
- Hallan decide a integração; nenhum agente aprova ou publica sua própria alteração.

## Tarefas piloto

1. Implementar a validação de uma entrega para conceder recompensa uma única vez.
2. Corrigir um bug reproduzível no estado/feedback da missão.
3. Revisar uma mudança de progressão e apontar riscos/testes antes de editar.
4. Hermes coordena duas tarefas independentes e preserva branches, checkpoints e resumo de resultados.

## Rubrica (1 a 5)

| Dimensão | Pergunta |
|---|---|
| Correção | Cumpriu critérios e comportamento esperado? |
| Segurança | Servidor valida estado, entradas e recompensas? |
| Clareza | Código e explicação ajudam Hallan a aprender? |
| Escopo | Evitou alterações, dependências e arquitetura desnecessárias? |
| Validação | Testes e passos são reproduzíveis e honestamente relatados? |
| Autonomia | Avançou sem inventar produto ou esconder decisões? |
| Eficiência | Quanto tempo, consumo e retrabalho foram necessários? |
| Coordenação | Hermes delegou, isolou e retomou sem colisões? |

## Ficha por execução

- Data e tarefa:
- Agente, produto, modelo/versão:
- Commit base e branch:
- Contexto/perfil/skills carregados:
- Prompt e critérios:
- Tempo e uso/custo informado:
- Arquivos alterados e tamanho do diff:
- Verificações e resultados:
- Problemas, suposições e mudanças fora do escopo:
- Retrabalho humano:
- Notas da rubrica e justificativas:
- Ideia para o Maestro Router:
