# Ambiente de desenvolvimento com Rojo

Este documento descreve somente a configuração de sincronização do projeto. Nenhuma mecânica do jogo está implementada.

## Versão

- Rojo CLI: **7.7.1**
- Projeto: `default.project.json`
- Scripts reservados: `src/server/` e `src/client/`

Use os binários oficiais da [release v7.7.1](https://github.com/rojo-rbx/rojo/releases/tag/v7.7.1). Para Windows x64, escolha `rojo-7.7.1-windows-x86_64.zip`.

## Primeiro teste

No PowerShell, dentro da pasta clonada:

1. Confirme a versão: `rojo --version` (esperado: `Rojo 7.7.1`).
2. Gere um arquivo local: `rojo build default.project.json -o .\CidadeSemFreio.rbxlx`.
3. Abra **esse arquivo de teste** no Roblox Studio.
4. Confira se o Studio mostra `ServerScriptService/init` e `StarterPlayer/StarterPlayerScripts/init`, e se a janela Output não apresenta erros.
5. Feche o arquivo sem publicar. O arquivo gerado é ignorado pelo Git e pode ser apagado após o teste.

## Sincronização ao vivo

A release oficial oferece o plugin `Rojo.rbxm`; também é possível instalá-lo com `rojo plugin install`. O plugin é instalado para o usuário do Windows e fica disponível nas sessões do Roblox Studio desse usuário. Para conectar, execute `rojo serve default.project.json` na pasta do projeto e use o botão Connect do plugin no Studio.

Antes de encerrar o teste, pare o servidor do Rojo e feche o lugar de teste sem publicar. Não use a conexão Rojo em projetos pessoais do filho do Hallan.

## Limites desta fundação

- Não cria nem publica um Place.
- Não inclui cidade, veículo, missões, interface ou progressão.
- Não adiciona salvamento, monetização, serviços externos ou CI.
- O Roblox Studio continua sendo necessário para validar a hierarquia e a sincronização.
