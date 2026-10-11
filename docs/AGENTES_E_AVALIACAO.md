# Equipe de agentes e aprendizado para o Maestro Router

## Propósito

Hallan, Codex, AGY, Claude Code e Hermes vão colaborar na construção de um único jogo. O objetivo é entregar um MVP original e aprender como coordenar ferramentas e pessoas no fluxo que pode alimentar o Maestro Router. O projeto não distribui versões concorrentes do mesmo jogo.

## Papéis

| Participante | Responsabilidade |
|---|---|
| Hallan | Product Owner; define prioridade e aceite, decide produto, custos, integração e publicação. |
| Hermes | Quando instalado e autorizado, coordena tarefas, contexto, handoffs e checkpoints; não aprova nem integra automaticamente. |
| Codex, AGY e Claude Code | Assumem implementação, análise, testes ou revisão conforme a tarefa; os papéis podem rodar entre eles. |

O papel específico é definido por tarefa, contexto e capacidade verificada. Não presumimos que uma ferramenta seja melhor em uma função antes de observar seu trabalho.

## Forma de trabalho

1. Hallan e o time definem uma entrega observável e critérios de aceite a partir do MVP.
2. Um responsável implementa a mudança em uma branch/worktree da tarefa.
3. Outros agentes recebem tarefas complementares, como desenhar cenários de falha, revisar segurança cliente-servidor, verificar documentação ou testar no Studio. Cada tarefa indica arquivos permitidos e resultado esperado.
4. Só paralelize quando os escopos não disputarem os mesmos arquivos. Compartilhe descobertas por handoff; não peça implementações duplicadas.
5. Faça revisão cruzada e integração em passos pequenos. Hallan decide o aceite e o merge.
6. Teste a experiência no Studio e registre evidências, limitações e pendências.

## Primeiro fluxo colaborativo

Para a primeira fatia de código depois da fundação do projeto, o time pode construir a validação da entrega e da recompensa única:

- uma pessoa/agente fica responsável pelo código de estado e validação no servidor;
- outro prepara cenários reproduzíveis de sucesso, falha, repetição e distância;
- outro revisa a fronteira cliente-servidor e os riscos de recompensa duplicada;
- Hermes, se já estiver configurado, organiza tarefas e checkpoints;
- Hallan valida o comportamento no Studio e decide se a entrega atende ao MVP.

Atribuir nomes aos papéis é uma decisão do planejamento da tarefa; eles podem rodar nas fatias seguintes para que Hallan conheça o fluxo de cada ferramenta.

## Aprendizados para o Maestro

Registre por tarefa, sem criar classificação entre agentes:

- data, intenção, aceite e commit base;
- responsável, revisores, participantes e papel de cada um;
- ferramenta/modelo/versão e contexto realmente fornecido;
- tempo e uso/custo informado por cada ferramenta;
- arquivos/diff, verificações, evidências e limitações;
- handoffs, retrabalho, conflitos, bloqueios e decisões humanas;
- melhoria sugerida para o fluxo do Maestro.

A retrospectiva avalia o resultado do time: qualidade e segurança do incremento, tempo/custo total, retrabalho, clareza dos handoffs e facilidade de Hallan entender e validar. Não há ranking nem vencedor.

## Registro por tarefa

- Data e entrega:
- Commit base e branch:
- Critérios de aceite:
- Responsável e arquivos permitidos:
- Revisores/validadores e escopo:
- Ferramentas, modelos e contexto:
- Handoffs e checkpoints:
- Verificações e resultados:
- Tempo, uso/custo informado e retrabalho:
- Decisões e pendências para Hallan:
- Aprendizado para o Maestro Router:
