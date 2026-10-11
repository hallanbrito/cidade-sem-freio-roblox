# Acordo de programação colaborativa humano + IA

Este projeto usa fundamentos do Método C.H. (“Colaboração Híbrida”, surgida inicialmente como “ChatGPT-Hallan”) que melhoram aprendizado e colaboração. Não exige o método completo nem o Maestro para funcionar.

Os fundamentos adotados são: intenção verificável, evidência reproduzível, fatias pequenas e reversíveis, memória explícita e versionada, responsabilidade humana e coordenação independente de ferramenta.

## Papéis

- **Hallan:** Product Owner; define prioridade, entende e aceita comportamento, toma decisões de produto/risco e autoriza integração e publicação.
- **Agentes:** colaboram no mesmo jogo. Cada tarefa define quem implementa e quais contribuições complementares são esperadas. Agentes explicam, testam e revisam sem substituir a decisão humana.
- **Orquestrador (Hermes ou outro):** distribui tarefas complementares, mantém contexto e checkpoints, registra handoffs e aponta dependências. Não aprova o próprio trabalho nem faz merge automático.

## Ciclo de uma tarefa

1. **Intenção:** descrever resultado observável e critério de aceite.
2. **Contexto:** fornecer apenas documentação, arquivos e skills necessários; decisões aceitas ficam registradas/versionadas.
3. **Responsáveis:** nomear uma pessoa/agente para implementar, revisores/validadores e arquivos sob responsabilidade de cada um.
4. **Fatia pequena:** uma mudança focada, reversível e isolada por branch/worktree. Trabalho paralelo só quando não houver disputa de arquivos; não duplicar a mesma implementação.
5. **Handoff:** registrar achados, arquivos, riscos e próximo passo para o responsável seguinte.
6. **Explicação:** o responsável explica o que mudou, por quê e quais decisões técnicas tomou, em português brasileiro.
7. **Validação:** testes/evidências reproduzíveis; separar resultado observado de suposição.
8. **Revisão humana:** Hallan entende o impacto, pede correção ou aceita; merge/publicação só após autorização.
9. **Memória:** atualizar a documentação quando uma decisão for aprovada, sem sobrescrevê-la silenciosamente.

## Regras de aprendizado

- Comentários descrevem funções relevantes, variáveis importantes e decisões não óbvias; não narram cada linha.
- A IA recomenda melhorias com explicação. Hallan valida e autoriza alterações que mudem comportamento.
- Refatoração preserva comportamento e exige comparação antes/depois. Sugestões podem ser registradas para uma sessão futura de revisão.
- Reservar revisões periódicas de refatoração para explicar melhorias; não transformar isso em calendário obrigatório no MVP.
- Se uma tarefa não puder ser testada porque Studio não está disponível, registrar isso e fornecer passos de teste manual.
- Registrar tempo/custo informado, qualidade do handoff, retrabalho e evidências para retrospectivas do time e melhorias no Maestro. Os registros orientam o processo; não ranqueiam agentes.

## Independência de ferramenta

Este fluxo deve funcionar com humano, Codex, AGY, Claude, Hermes ou outro agente. O Maestro Router poderá automatizar partes no futuro, mas não é pré-requisito nem autoridade de produto.
