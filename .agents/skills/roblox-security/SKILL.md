---
name: roblox-server-security
description: Revisar fronteiras cliente-servidor, remotos e recompensas no Roblox.
---

# Skill: revisão de segurança Roblox

## Aplicar quando

Uma mudança envolver `RemoteEvent`, `RemoteFunction`, missão, moeda, XP, item, veículo, salvamento ou estado compartilhado.

## Checklist

- O servidor confirma a identidade do jogador e o estado atual da ação?
- Entradas têm tipo, limite, distância e frequência validados?
- Recompensas são concedidas uma vez e pelo servidor?
- Repetições, chamadas fora de ordem e valores manipulados falham sem conceder benefício?
- Falha de rede ou desconexão mantém estado consistente?
- Logs evitam tokens e dados privados?

Registre riscos residuais. Não invente medidas de segurança incompatíveis com APIs Roblox: confirme a API e teste no Studio.
