-- Monta o primeiro bairro de teste e mantém a missão/recompensa no servidor.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local REWARD = 120
local PROMPT_DISTANCE = 12
local ACTION_COOLDOWN = 0.8
local START_POSITION = Vector3.new(-178, 2, 0)
local DELIVERY_POSITION = Vector3.new(178, 3, 0)

local COLORS = {
	Asphalt = Color3.fromRGB(35, 40, 52),
	Sidewalk = Color3.fromRGB(119, 132, 148),
	Concrete = Color3.fromRGB(206, 216, 222),
	Cyan = Color3.fromRGB(48, 232, 225),
	Pink = Color3.fromRGB(255, 87, 160),
	Yellow = Color3.fromRGB(255, 205, 78),
	Ink = Color3.fromRGB(22, 28, 40),
}

local states: {[Player]: {status: string, message: string, objective: string}} = {}
local lastActionAt: {[Player]: number} = {}

local remotes = ReplicatedStorage:FindFirstChild("CidadeSemFreioRemotes")
if not remotes then
	remotes = Instance.new("Folder")
	remotes.Name = "CidadeSemFreioRemotes"
	remotes.Parent = ReplicatedStorage
end

local missionStateEvent = remotes:FindFirstChild("MissionState")
if not missionStateEvent then
	missionStateEvent = Instance.new("RemoteEvent")
	missionStateEvent.Name = "MissionState"
	missionStateEvent.Parent = remotes
end

local function makePart(parent: Instance, name: string, size: Vector3, position: Vector3, color: Color3, material: Enum.Material, canCollide: boolean?): Part
	local part = Instance.new("Part")
	part.Name = name
	part.Size = size
	part.Position = position
	part.Color = color
	part.Material = material
	part.Anchored = true
	part.CanCollide = canCollide ~= false
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	part.Parent = parent
	return part
end

local function addSign(parent: Instance, adornee: BasePart, text: string, color: Color3, width: number, height: number)
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "Placa"
	billboard.Adornee = adornee
	billboard.AlwaysOnTop = true
	billboard.Size = UDim2.fromOffset(width, height)
	billboard.StudsOffset = Vector3.new(0, 3.5, 0)
	billboard.MaxDistance = 180
	billboard.Parent = parent

	local label = Instance.new("TextLabel")
	label.BackgroundColor3 = COLORS.Ink
	label.BackgroundTransparency = 0.08
	label.BorderSizePixel = 0
	label.Size = UDim2.fromScale(1, 1)
	label.Font = Enum.Font.GothamBold
	label.Text = text
	label.TextColor3 = color
	label.TextScaled = true
	label.Parent = billboard

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = label
	local stroke = Instance.new("UIStroke")
	stroke.Color = color
	stroke.Thickness = 2
	stroke.Parent = label
end

local function addPrompt(part: BasePart, actionText: string, objectText: string): ProximityPrompt
	local prompt = Instance.new("ProximityPrompt")
	prompt.ActionText = actionText
	prompt.ObjectText = objectText
	prompt.KeyboardKeyCode = Enum.KeyCode.E
	prompt.HoldDuration = 0.2
	prompt.MaxActivationDistance = 12
	prompt.RequiresLineOfSight = false
	prompt.Parent = part
	return prompt
end

local function isNearPrompt(player: Player, prompt: ProximityPrompt): boolean
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	local anchor = prompt.Parent
	if not root or not root:IsA("BasePart") or not anchor or not anchor:IsA("BasePart") then
		return false
	end
	return (root.Position - anchor.Position).Magnitude <= PROMPT_DISTANCE
end

local function canUsePrompt(player: Player, prompt: ProximityPrompt): boolean
	local now = os.clock()
	if now - (lastActionAt[player] or 0) < ACTION_COOLDOWN or not isNearPrompt(player, prompt) then
		return false
	end
	lastActionAt[player] = now
	return true
end

local function sendState(player: Player)
	local state = states[player]
	if not state then
		return
	end
	local leaderstats = player:FindFirstChild("leaderstats")
	local cash = leaderstats and leaderstats:FindFirstChild("Creditos")
	missionStateEvent:FireClient(player, {
		status = state.status,
		message = state.message,
		objective = state.objective,
		cash = cash and cash.Value or 0,
		reward = REWARD,
	})
end

local function buildDistrict()
	if Workspace:FindFirstChild("CidadeSemFreioBlockout") then
		return
	end

	local district = Instance.new("Folder")
	district.Name = "CidadeSemFreioBlockout"
	district.Parent = Workspace

	makePart(district, "Terreno", Vector3.new(500, 2, 270), Vector3.new(0, -1, 0), Color3.fromRGB(77, 145, 105), Enum.Material.Grass)
	makePart(district, "Avenida Principal", Vector3.new(500, 1, 54), Vector3.new(0, 0, 0), COLORS.Asphalt, Enum.Material.Asphalt)
	makePart(district, "Calcada Norte", Vector3.new(500, 1, 12), Vector3.new(0, 0.2, -34), COLORS.Sidewalk, Enum.Material.Concrete)
	makePart(district, "Calcada Sul", Vector3.new(500, 1, 12), Vector3.new(0, 0.2, 34), COLORS.Sidewalk, Enum.Material.Concrete)
	makePart(district, "Praca da Largada", Vector3.new(66, 1, 72), Vector3.new(-178, 0.35, 0), COLORS.Concrete, Enum.Material.Concrete)
	makePart(district, "Praca da Entrega", Vector3.new(66, 1, 72), Vector3.new(178, 0.35, 0), COLORS.Concrete, Enum.Material.Concrete)

	for x = -235, 235, 20 do
		makePart(district, "Faixa central", Vector3.new(10, 0.12, 0.8), Vector3.new(x, 0.58, 0), COLORS.Yellow, Enum.Material.Neon, false)
	end
	for _, x in ipairs({-140, -95, -50, 0, 50, 100}) do
		makePart(district, "Luz de rota", Vector3.new(3, 0.25, 3), Vector3.new(x, 0.64, -9), COLORS.Cyan, Enum.Material.Neon, false)
	end

	for _, x in ipairs({-215, -145, -75, -5, 65, 135, 205}) do
		for _, side in ipairs({-1, 1}) do
			local z = side * 82
			local height = 20 + ((math.abs(x) + side * 7) % 3) * 7
			local palette = {
				Color3.fromRGB(67, 82, 116),
				Color3.fromRGB(119, 75, 111),
				Color3.fromRGB(70, 112, 118),
				Color3.fromRGB(154, 111, 82),
			}
			local building = makePart(district, "Predio de bairro", Vector3.new(40, height, 34), Vector3.new(x, height / 2, z), palette[(math.abs(x) // 70) % #palette + 1], Enum.Material.SmoothPlastic)
			makePart(district, "Faixa de fachada", Vector3.new(41, 1.5, 35), Vector3.new(x, height - 2, z), side == 1 and COLORS.Cyan or COLORS.Pink, Enum.Material.Neon, false)
			local frontZ = z - side * 17.05
			for offset = -12, 12, 12 do
				makePart(district, "Janela", Vector3.new(6, 5, 0.25), Vector3.new(x + offset, math.min(height - 8, 10), frontZ), Color3.fromRGB(118, 218, 230), Enum.Material.Glass, false).Transparency = 0.32
			end
			if x == -75 then
				addSign(district, building, side == 1 and "OFICINA" or "LANCHONETE", COLORS.Yellow, 150, 38)
			end
		end
	end

	for _, x in ipairs({-120, -45, 35, 110}) do
		for _, z in ipairs({-47, 47}) do
			makePart(district, "Poste", Vector3.new(1, 13, 1), Vector3.new(x, 6.5, z), COLORS.Ink, Enum.Material.Metal, false)
			makePart(district, "Luminaria", Vector3.new(3, 0.7, 3), Vector3.new(x, 13.4, z), COLORS.Cyan, Enum.Material.Neon, false)
		end
	end

	local spawn = Instance.new("SpawnLocation")
	spawn.Name = "SpawnPraca"
	spawn.Size = Vector3.new(8, 1, 8)
	spawn.Position = START_POSITION
	spawn.Anchored = true
	spawn.Neutral = true
	spawn.AllowTeamChangeOnTouch = false
	spawn.Color = COLORS.Cyan
	spawn.Material = Enum.Material.Neon
	spawn.Transparency = 0.15
	spawn.Parent = district

	local board = makePart(district, "Quadro de Corridas", Vector3.new(5, 5, 1), Vector3.new(-195, 3, -12), COLORS.Pink, Enum.Material.Neon)
	addSign(district, board, "CORRE DA CIDADE", COLORS.Yellow, 250, 54)
	local acceptPrompt = addPrompt(board, "Aceitar entrega", "Central de Corridas")
	acceptPrompt.Triggered:Connect(function(player)
		if not canUsePrompt(player, acceptPrompt) then
			return
		end
		local state = states[player]
		if not state then
			return
		end
		if state.status ~= "available" then
			state.message = state.status == "active" and "Entrega ja aceita. Siga as luzes ciano ate o destino." or "Esta entrega ja foi concluida nesta rodada."
			sendState(player)
			return
		end
		state.status = "active"
		state.objective = "Siga as luzes ciano pela avenida e entregue o pacote no Ponto Final."
		state.message = "Entrega aceita! Siga os pontos de luz ciano."
		sendState(player)
	end)

	local counter = makePart(district, "Balcao do Ponto Final", Vector3.new(7, 4, 3), DELIVERY_POSITION, COLORS.Cyan, Enum.Material.Neon)
	addSign(district, counter, "PONTO FINAL", COLORS.Cyan, 200, 44)
	local deliverPrompt = addPrompt(counter, "Entregar pacote", "Ponto Final")
	deliverPrompt.Triggered:Connect(function(player)
		if not canUsePrompt(player, deliverPrompt) then
			return
		end
		local state = states[player]
		if not state then
			return
		end
		if state.status ~= "active" then
			state.message = state.status == "completed" and "Pagamento ja realizado. Sem recompensa duplicada." or "Aceite a entrega na Central de Corridas primeiro."
			sendState(player)
			return
		end
		state.status = "completed"
		state.objective = "Entrega concluida. Explore o bairro e confira seu saldo."
		state.message = string.format("Pacote entregue! +%d creditos. Boa!", REWARD)
		local leaderstats = player:FindFirstChild("leaderstats")
		local cash = leaderstats and leaderstats:FindFirstChild("Creditos")
		if cash and cash:IsA("IntValue") then
			cash.Value += REWARD
		end
		sendState(player)
	end)

	local beacon = makePart(district, "Farol do destino", Vector3.new(2, 28, 2), Vector3.new(178, 15, 0), COLORS.Cyan, Enum.Material.Neon, false)
	beacon.Transparency = 0.72
	makePart(district, "Topo do farol", Vector3.new(8, 1, 8), Vector3.new(178, 29.5, 0), COLORS.Cyan, Enum.Material.Neon, false)

	Lighting.ClockTime = 17.4
	Lighting.Brightness = 2
	Lighting.Ambient = Color3.fromRGB(94, 112, 143)
	Lighting.OutdoorAmbient = Color3.fromRGB(126, 143, 176)
	Lighting.EnvironmentDiffuseScale = 0.45
	Lighting.EnvironmentSpecularScale = 0.35
end

local function setupPlayer(player: Player)
	states[player] = {
		status = "available",
		message = "A Central de Corridas tem um pacote esperando por voce.",
		objective = "Va ao quadro rosa na praca e aceite sua primeira entrega.",
	}

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	local cash = Instance.new("IntValue")
	cash.Name = "Creditos"
	cash.Value = 0
	cash.Parent = leaderstats

	player.CharacterAdded:Connect(function()
		task.delay(1, function()
			sendState(player)
		end)
	end)
	task.delay(2, function()
		sendState(player)
	end)
end

buildDistrict()
Players.PlayerAdded:Connect(setupPlayer)
Players.PlayerRemoving:Connect(function(player)
	states[player] = nil
	lastActionAt[player] = nil
end)

for _, player in ipairs(Players:GetPlayers()) do
	setupPlayer(player)
end
