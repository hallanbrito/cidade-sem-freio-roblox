-- Apresenta ao jogador somente o estado confirmado pelo servidor.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local missionStateEvent = ReplicatedStorage:WaitForChild("CidadeSemFreioRemotes"):WaitForChild("MissionState")

local screen = Instance.new("ScreenGui")
screen.Name = "CidadeSemFreioHUD"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = false
screen.DisplayOrder = 20
screen.Parent = player:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Name = "PainelMissao"
panel.AnchorPoint = Vector2.new(0, 0)
panel.Position = UDim2.fromOffset(22, 22)
panel.Size = UDim2.new(0, 350, 0, 158)
panel.BackgroundColor3 = Color3.fromRGB(19, 25, 38)
panel.BackgroundTransparency = 0.08
panel.BorderSizePixel = 0
panel.Parent = screen

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = panel

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(48, 232, 225)
stroke.Thickness = 2
stroke.Transparency = 0.12
stroke.Parent = panel

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 39, 57)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 19, 31)),
})
gradient.Rotation = 20
gradient.Parent = panel

local accent = Instance.new("Frame")
accent.Name = "Acento"
accent.Position = UDim2.fromOffset(16, 17)
accent.Size = UDim2.new(0, 5, 1, -34)
accent.BackgroundColor3 = Color3.fromRGB(255, 87, 160)
accent.BorderSizePixel = 0
accent.Parent = panel
local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

local title = Instance.new("TextLabel")
title.Name = "Titulo"
title.Position = UDim2.fromOffset(34, 15)
title.Size = UDim2.new(1, -145, 0, 24)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "CORRE DA CIDADE"
title.TextColor3 = Color3.fromRGB(255, 205, 78)
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = panel

local rewardLabel = Instance.new("TextLabel")
rewardLabel.Name = "Recompensa"
rewardLabel.Position = UDim2.fromOffset(34, 37)
rewardLabel.Size = UDim2.new(1, -54, 0, 16)
rewardLabel.BackgroundTransparency = 1
rewardLabel.Font = Enum.Font.GothamBold
rewardLabel.Text = "RECOMPENSA: 120 CR"
rewardLabel.TextColor3 = Color3.fromRGB(255, 205, 78)
rewardLabel.TextSize = 11
rewardLabel.TextXAlignment = Enum.TextXAlignment.Left
rewardLabel.Parent = panel

local badge = Instance.new("TextLabel")
badge.Name = "Saldo"
badge.AnchorPoint = Vector2.new(1, 0)
badge.Position = UDim2.new(1, -16, 0, 14)
badge.Size = UDim2.fromOffset(98, 28)
badge.BackgroundColor3 = Color3.fromRGB(48, 232, 225)
badge.BorderSizePixel = 0
badge.Font = Enum.Font.GothamBold
badge.Text = "¢ 0"
badge.TextColor3 = Color3.fromRGB(18, 28, 38)
badge.TextSize = 14
badge.Parent = panel
local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(0, 10)
badgeCorner.Parent = badge

local objective = Instance.new("TextLabel")
objective.Name = "Objetivo"
objective.Position = UDim2.fromOffset(34, 60)
objective.Size = UDim2.new(1, -54, 0, 42)
objective.BackgroundTransparency = 1
objective.Font = Enum.Font.GothamMedium
objective.Text = "Conectando com a Central de Corridas..."
objective.TextColor3 = Color3.fromRGB(239, 244, 249)
objective.TextSize = 15
objective.TextWrapped = true
objective.TextXAlignment = Enum.TextXAlignment.Left
objective.TextYAlignment = Enum.TextYAlignment.Top
objective.Parent = panel

local message = Instance.new("TextLabel")
message.Name = "Feedback"
message.Position = UDim2.fromOffset(34, 109)
message.Size = UDim2.new(1, -54, 0, 36)
message.BackgroundTransparency = 1
message.Font = Enum.Font.Gotham
message.Text = "Explore o bairro para encontrar o quadro rosa."
message.TextColor3 = Color3.fromRGB(48, 232, 225)
message.TextSize = 13
message.TextWrapped = true
message.TextXAlignment = Enum.TextXAlignment.Left
message.TextYAlignment = Enum.TextYAlignment.Top
message.Parent = panel

local function renderMission(state)
	-- O servidor envia valores calculados; o cliente não altera saldo ou missão.
	objective.Text = state.objective or "Siga as instrucoes da Central de Corridas."
	message.Text = state.message or ""
	badge.Text = string.format("¢ %d", tonumber(state.cash) or 0)
	rewardLabel.Text = string.format("RECOMPENSA: %d CR", tonumber(state.reward) or 0)
	if state.status == "active" then
		stroke.Color = Color3.fromRGB(48, 232, 225)
		accent.BackgroundColor3 = Color3.fromRGB(48, 232, 225)
	elseif state.status == "completed" then
		stroke.Color = Color3.fromRGB(255, 205, 78)
		accent.BackgroundColor3 = Color3.fromRGB(255, 205, 78)
	else
		stroke.Color = Color3.fromRGB(255, 87, 160)
		accent.BackgroundColor3 = Color3.fromRGB(255, 87, 160)
	end
end

missionStateEvent.OnClientEvent:Connect(renderMission)
