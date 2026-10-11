---
name: roblox-luau-project
description: Convenções deste projeto para estruturar e revisar código Luau no Roblox.
---

# Skill: Roblox Luau deste projeto

## Aplicar quando

Criar ou revisar scripts, módulos, eventos remotos, interfaces ou sistemas de gameplay em Luau.

## Regras

- Consulte `AGENTS.md` e o critério de aceite.
- Mantenha lógica autoritativa (progresso, recompensa, estado de missão) no servidor.
- Use o cliente para entrada e apresentação; trate toda entrada remota como não confiável.
- Nomeie serviços e módulos pela responsabilidade, não por um agente ou modelo.
- Documente em português as funções públicas, dados importantes e decisões técnicas não óbvias.
- Evite APIs obsoletas, loops por frame sem necessidade e alocações repetidas em eventos frequentes.
- Para tarefas de Roblox Studio, inclua passos de teste manual quando não houver teste automatizado executável.

## Resultado esperado

A alteração explica o estado inicial, comportamento após a ação, validação de servidor e como reproduzir os cenários principais e de falha.
