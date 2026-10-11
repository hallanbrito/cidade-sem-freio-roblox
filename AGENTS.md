# Diretrizes para agentes de IA

Estas regras se aplicam a qualquer agente, CLI ou modelo que trabalhe neste repositório.

## Autoridade e responsabilidades

- Hallan é Product Owner e decide prioridade, escopo, regras de jogo, aceitação e publicação.
- O agente pode investigar, propor, implementar dentro da tarefa, explicar alternativas e validar.
- Decisões de produto, mudanças de escopo, dependências novas, persistência de dados, monetização, publicação e remoções exigem autorização humana explícita.
- Nenhum agente integra ou publica a própria alteração sem autorização humana.

## Antes de editar

1. Leia a tarefa e seus critérios de aceite.
2. Confira branch, estado do working tree e arquivos relacionados.
3. Leia as instruções e skills aplicáveis; não carregue material irrelevante.
4. Se houver ambiguidade que mude arquitetura, segurança, custo ou experiência, pare e apresente opções curtas. Para lacunas pequenas, adote a opção mais simples e registre a suposição.

## Limites de escopo

- Faça a menor mudança que satisfaz a tarefa. Não reescreva sistemas, renomeie em massa, adicione pacotes, serviços, CI/CD, telemetria, monetização ou infraestrutura sem necessidade aprovada.
- Preserve comportamento existente. Refatoração que possa alterar comportamento precisa de evidência de testes antes e depois.
- Não remova nem reescreva decisão/documentação aprovada silenciosamente; proponha a alteração com motivo.
- Não use assets, nomes, personagens, mapas, músicas, marcas ou código extraídos de GTA ou de outros jogos.
- Não exponha credenciais. Não grave tokens, cookies, chaves ou dados privados no repositório.

## Padrão de código didático

- Use Luau e APIs oficiais do Roblox.
- Escreva comentários e documentação em português brasileiro, explicando funções públicas, variáveis importantes e decisões não óbvias. Não comente cada linha.
- Prefira nomes claros, funções pequenas e módulos com responsabilidade definida.
- Separe autoridade de servidor e apresentação/entrada de cliente. Cliente não decide dinheiro, XP, conclusão de missão ou propriedade de itens.
- Valide entradas de `RemoteEvent` e `RemoteFunction` no servidor: tipo, faixa, estado do jogador, distância, frequência e pré-condições relevantes.
- Evite APIs obsoletas e dependências sem justificativa.

## Validação e entrega

- Rode a validação disponível. Se Roblox Studio não estiver disponível, declare claramente o que não foi testado e forneça passos reproduzíveis para testar.
- Para mudanças de comportamento, inclua ou descreva testes de sucesso, falha e repetição/abuso relevantes.
- Ao concluir, informe: o que mudou, arquivos afetados, verificações executadas, resultado, riscos e pendências.
- Mantenha o diff pequeno. Não alegue teste que não executou.

## Trabalho paralelo e comparação de agentes

- Um agente por branch/worktree por tentativa; não edite a branch de outro agente.
- Para comparação justa, tarefas equivalentes começam do mesmo commit e recebem os mesmos critérios.
- Preserve logs de modelo/ferramenta, tempo, uso/custo disponível, diff, validação e retrabalho humano.
- Use os perfis e skills em `.agents/`; não presuma que estejam carregados automaticamente.
