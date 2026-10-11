# Cidade Sem Freio

Jogo original de mundo aberto para Roblox, com exploração, direção, missões e habilidades que evoluem pelo uso. O projeto busca a sensação de liberdade dos jogos de mundo aberto, mas terá cidade, personagens, história, marcas e assets próprios.

## Estado

**Fase:** fundação e definição do MVP.  
**Título de trabalho:** Cidade Sem Freio.  
**Motor:** Roblox Studio, com scripts Luau.  
**Colaboração:** Hallan como Product Owner; Codex, AGY, Claude Code e Hermes trabalham em tarefas complementares no mesmo jogo, com responsáveis claros, handoffs e revisões cruzadas. Os aprendizados do fluxo alimentam o Maestro Router.

## Objetivo comercial

O projeto quer explorar o potencial de renda de um jogo original. O MVP primeiro valida se a experiência é divertida e dá vontade de repetir; monetização continua fora do protótipo inicial e depende de decisão do Hallan após essa validação.

## Visão rápida do MVP

- Um distrito compacto e estilizado.
- Uma missão curta de entrega com começo, objetivo e recompensa.
- Um veículo simples de dirigir.
- Progressão inicial por uso em Direção e Condicionamento.
- Validação de missão e recompensa no servidor.
- Protótipo pequeno, compreensível e testável no Roblox Studio.

Veja [`docs/MVP.md`](docs/MVP.md), [`docs/VISAO_DO_JOGO.md`](docs/VISAO_DO_JOGO.md) e [`docs/FLUXO_COLABORATIVO.md`](docs/FLUXO_COLABORATIVO.md).

## Orientação para agentes

Antes de planejar ou editar:

1. Leia [`AGENTS.md`](AGENTS.md).
2. Leia o perfil do agente: [`Codex`](.agents/profiles/codex.md), [`AGY`](.agents/profiles/agy.md), [`Claude Code`](.agents/profiles/claude-code.md) ou [`Hermes`](.agents/profiles/hermes.md).
3. Leia somente as skills relevantes em [`.agents/skills/`](.agents/skills).
4. Confira o estado atual do repositório e o critério de aceite da tarefa.

Os perfis são instruções do projeto. Eles não garantem carregamento automático por cada ferramenta; quando necessário, o operador fornece o arquivo como contexto. Codex usa `AGENTS.md` como guia comum.

## Ambiente

O projeto será sincronizado/testado no Roblox Studio. O notebook conhecido usa CachyOS; o Studio é oferecido oficialmente para Windows e Mac. A decisão do ambiente de execução está em [`docs/DECISOES_ABERTAS.md`](docs/DECISOES_ABERTAS.md).

## Princípios

- Entregas pequenas, reversíveis e com intenção verificável.
- Código e documentação didáticos em português brasileiro.
- Agentes explicam escolhas e evidências; Hallan entende e aprova mudanças de produto e integração.
- Não adicionar infraestrutura, dependências ou escopo sem necessidade aprovada.
- Nunca copiar conteúdo protegido de GTA ou de outra propriedade intelectual.
