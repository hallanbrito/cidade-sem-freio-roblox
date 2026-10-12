# Playtest 01 — Corre da Cidade

## Objetivo

Testar uma missão curta de entrega num bairro blockout, com estado por jogador e créditos controlados pelo servidor.

## O que entrou nesta fatia

- Praça inicial, avenida, edifícios de blockout, iluminação e ponto final destacado.
- Aceite no quadro rosa usando a ProximityPrompt.
- Entrega no balcão ciano usando outra ProximityPrompt.
- HUD local atualizada por eventos enviados pelo servidor.
- Um pagamento de 120 créditos por jogador nesta sessão. O estado é isolado por jogador e não usa DataStore.

Esta primeira rodada é feita a pé. Veículo dirigível e evolução de habilidades ainda não estão incluídos; a física do veículo precisa ser prototipada e testada no Studio antes de entrar na fatia.

## Abrir no Studio

1. No PowerShell, dentro da pasta do repositório, confira a branch com `git status --short --branch`.
2. Gere um arquivo novo para esta versão: `rojo build .\default.project.json -o .\CidadeSemFreio-Playtest.rbxlx`.
3. No Studio, abra `CidadeSemFreio-Playtest.rbxlx` pelo menu **File > Open from File**. Não reutilize um `.rbxlx` exportado antes desta fatia.
4. Confira no Explorer se `Main` aparece como Script dentro do serviço `ServerScriptService`, e se `Hud` aparece como LocalScript dentro de `StarterPlayer > StarterPlayerScripts`. Não deve haver um Script ou pasta comum duplicada chamada `ServerScriptService`.
5. Use **Play** para iniciar uma sessão local. Não publique o Place.
6. Durante o Play, a pasta `Workspace > CidadeSemFreioBlockout` deve aparecer. Vá ao quadro rosa, pressione **E** e atravesse a avenida até o balcão ciano.

### Sincronização ao vivo com Rojo (opcional)

Se preferir sincronização ao vivo, pare o Play, execute `rojo serve .\default.project.json` no repositório e conecte o plugin Rojo ao Studio. Aguarde o plugin indicar conexão e confira os dois scripts no Explorer antes de clicar em **Play**. Se o plugin desconectar, use o arquivo novo criado pelo passo anterior.

## Cenários a verificar

1. Antes de aceitar a missão, tente usar o balcão ciano: não deve conceder créditos.
2. Aceite no quadro rosa: o HUD deve mostrar o objetivo e o destino.
3. Aceite a missão e tente usar o balcão enquanto ainda está longe: a ProximityPrompt deve permanecer indisponível.
4. Entregue no balcão: o saldo deve aumentar em 120.
5. Use o balcão ciano novamente: o saldo não deve aumentar de novo.
6. Inicie um segundo jogador pelo **Test > Start** e confira que o estado e o saldo de cada um são separados.
7. Confira a janela **View > Output** e reporte qualquer erro.

## Limitações conhecidas

- Não foi possível validar física, interface, prompts, multiplayer ou Output sem uma sessão do Roblox Studio.
- Os créditos e o estado da missão são apagados ao sair do servidor.
- Esta fatia ainda não atende ao critério do MVP que exige veículo dirigível nem ao de evolução de habilidade.
- A validação de distância no servidor protege contra chamadas normais fora do alcance, mas um cliente explorado pode manipular a posição replicada do personagem. Não use esta recompensa como economia pública; antes disso, será necessário validar movimento e percurso com controles adicionais no servidor.
- O código ainda precisa ser aberto e executado no Roblox Studio. A revisão estática não confirma compilação Luau, aparência, física ou comportamento dos prompts.
