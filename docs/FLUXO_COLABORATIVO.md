# Acordo de programação colaborativa humano + IA

Este projeto usa fundamentos do Método C.H. (“Colaboração Híbrida”, surgida inicialmente como “ChatGPT-Hallan”) que melhoram aprendizado e colaboração. Não importa o método completo nem exige Maestro para funcionar.

Os fundamentos adotados são: intenção verificável, evidência reproduzível, fatias pequenas e reversíveis, memória explícita e versionada, responsabilidade humana e coordenação independente de ferramenta.

## Papéis

- **Hallan:** Product Owner; define prioridade, entende e aceita comportamento, toma decisões de produto/risco e autoriza integração e publicação.
- **Agentes:** investigam, explicam, implementam dentro do escopo, testam e recomendam melhorias. Não substituem a decisão humana.
- **Orquestrador (Hermes ou outro):** pode distribuir tarefas independentes e manter checkpoints. Não aprova o próprio trabalho nem faz merge automático.

## Ciclo de uma tarefa

1. **Intenção:** descrever resultado observável e critério de aceite.
2. **Contexto:** fornecer apenas documentação, arquivos e skills necessários; decisões aceitas ficam registradas/versionadas.
3. **Fatia pequena:** uma mudança focada, reversível e isolada por branch/worktree.
4. **Explicação:** agente explica o que mudou, por quê e quais decisões técnicas tomou, em português brasileiro.
5. **Validação:** testes/evidências reproduzíveis; separar resultado observado de suposição.
6. **Revisão humana:** Hallan entende o impacto, pede correção ou aceita; merge/publicação só após autorização.
7. **Memória:** atualizar a documentação quando uma decisão for aprovada, sem sobrescrevê-la silenciosamente.

## Regras de aprendizado

- Comentários descrevem funções relevantes, variáveis importantes e decisões não óbvias; não narram cada linha.
- A IA deve recomendar melhorias com explicação. Hallan valida e autoriza alterações que mudem comportamento.
- Refatoração preserva comportamento e exige comparação antes/depois. Sugestões podem ser registradas para uma sessão futura de revisão.
- Reservar revisões periódicas de refatoração para explicar melhorias; não transformar isso em calendário obrigatório no MVP.
- Se uma tarefa não puder ser testada porque Studio não está disponível, registrar isso e fornecer passos de teste manual.
- Manter métricas do experimento de agentes: qualidade, retrabalho, tempo e custo/uso informado.

## Independência de ferramenta

Este fluxo deve funcionar com humano, Codex, AGY, Claude, Hermes ou outro agente. O Maestro Router poderá automatizar partes no futuro, mas não é pré-requisito nem autoridade de produto.
