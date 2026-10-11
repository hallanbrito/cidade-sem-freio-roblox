# MVP — primeira fatia jogável

## Objetivo

Validar se uma missão curta de mundo aberto, com um veículo e progressão visível de habilidade, é divertida e tecnicamente viável no Roblox.

## Jogador consegue

1. Nascer numa praça de um distrito compacto.
2. Aceitar uma missão de entrega por uma interação simples.
3. Entrar num veículo leve e conduzi-lo até um destino sinalizado.
4. Concluir a entrega uma única vez e receber recompensa.
5. Ver progresso em Direção; se completar um trecho a pé, obter progresso em Condicionamento.
6. Repetir a atividade e perceber a evolução da habilidade.

## Conteúdo incluído

- Um distrito blockout com praça, ruas, edifícios simples e pontos de orientação.
- Spawn e interface mínima com objetivo, recompensa e progresso.
- Um veículo simples, com controles claros e câmera funcional.
- Uma missão de entrega com início, trajeto, conclusão e recompensa.
- Habilidades Direção e Condicionamento, com progressão lenta e limitada por variedade/atividade.
- Estado e recompensas confirmados no servidor.
- Primeiro teste com um jogador; manter a estrutura segura para testes futuros com vários jogadores.

## Fora do MVP

- Cidade grande, campanha longa e dezenas de missões.
- Armas, gore ou combate avançado.
- Monetização, game passes, compras, economia entre jogadores ou trading.
- Sistema completo de polícia/perseguição.
- Salvamento persistente de dados de produção; primeiro validar a experiência sem risco de corromper progresso real.
- Animações, áudio ou assets finais em grande escala.
- Infraestrutura externa, CI/CD e automações.

## Critérios de aceite

- A missão só pode ser aceita no estado correto e cada jogador tem seu estado isolado.
- O objetivo e destino ficam claros para o jogador.
- A conclusão só ocorre perto do ponto de entrega e com a missão ativa.
- A recompensa é validada pelo servidor e concedida uma vez, mesmo após interações repetidas.
- XP de Direção/Condicionamento é concedido por ações válidas; chamadas forjadas do cliente não concedem XP.
- O jogador recebe feedback ao aceitar, concluir ou falhar a missão.
- O veículo pode ser dirigido, parado e abandonado sem quebrar o personagem ou bloquear o fluxo.
- Um agente ou Hallan consegue reproduzir os testes usando passos documentados.
- Testes de falha incluem tentativa de concluir sem aceitar, fora do destino e repetição da entrega.

## Plano de implementação

1. Confirmar ambiente Roblox Studio e estrutura de sync do projeto.
2. Criar bloco de cidade e spawn.
3. Criar interação de aceitar missão e estado autoritativo no servidor.
4. Criar destino, validação e recompensa idempotente.
5. Criar veículo e testar controles/física.
6. Adicionar progressão de habilidade e feedback da interface.
7. Testar cenários de sucesso, falha e repetição; revisar com Hallan antes de ampliar.

Cada etapa deve ser um PR/tarefa pequena com critério próprio. O primeiro código será implementado e comparado entre agentes apenas depois de fixarmos o ambiente de Studio e o formato de projeto.
