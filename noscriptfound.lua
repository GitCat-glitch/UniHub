
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "UniScript HUB [v1]",
    LoadingTitle = "hello there <3",
    LoadingSubtitle = "by someone that i cant tell",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Script",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})


local scriptsTAB = Window:CreateTab("Humanoid", 4483362458)
local KeybindsTAB = Window:CreateTab("Humanoid", 4483362458)
local uiTAB = Window:CreateTab("UI", 4483362458)

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer


local creatingParts = false
local maxParts = 20
local partList = {}
local toggleKey = Enum.KeyCode.F 


local function createPart()
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    local part = Instance.new("Part")
    part.Size = Vector3.new(5, 1, 5)
    part.Transparency = 0.5
    part.Anchored = true
    part.CanCollide = true
    part.Position = character.HumanoidRootPart.Position - Vector3.new(0, character.HumanoidRootPart.Size.Y / 2 + 2.5, 0)
    part.Parent = workspace

    table.insert(partList, part)

    if #partList > maxParts then
        local oldPart = table.remove(partList, 1)
        if oldPart and oldPart.Parent then
            oldPart:Destroy()
        end
    end
end


local function startPartCreationLoop()
    task.spawn(function()
        while creatingParts do
            createPart()
            task.wait(0.1)
        end
    end)
end




local Players = game:GetService("Players")


local highlights = {}

local highlights = {}
local espEnabled = false

local function addHighlightToPlayer(player)
	local char = player.Character or player.CharacterAdded:Wait()

	
	if highlights[player] then
		highlights[player]:Destroy()
	end

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromRGB(255, 255, 0)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Parent = char

	highlights[player] = highlight
end

-- ====== ESP (replace your old ESP section with this) ======
local highlights = {}
local espEnabled = false

local function addHighlightToCharacter(plr, char)
	if not plr or not char then return end

	-- Remove old highlight for this player (if any)
	if highlights[plr] and highlights[plr].Parent then
		highlights[plr]:Destroy()
	end
	highlights[plr] = nil

	-- Wait for important parts so the highlight can attach properly
	if not char:FindFirstChild("HumanoidRootPart") then
		-- safe wait with timeout
		pcall(function() char:WaitForChild("HumanoidRootPart", 5) end)
	end

	-- If the character was removed while waiting, bail out
	if not char.Parent then return end

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromRGB(255, 255, 0)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Parent = char -- parent to the character model

	highlights[plr] = highlight
end

local function onCharacterAdded(plr, character)
	-- spawn so we don't block the CharacterAdded event
	task.spawn(function()
		-- only add highlight if ESP is enabled
		if espEnabled then
			-- small wait to ensure replication (HumanoidRootPart wait above helps too)
			task.wait(0.2)
			addHighlightToCharacter(plr, character)
		end
	end)
end

-- Connect CharacterAdded for players that join in the future
Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		onCharacterAdded(plr, char)
	end)
	-- if they already have a character (joining quickly), handle it
	if plr.Character then
		onCharacterAdded(plr, plr.Character)
	end
end)

-- Connect for players already in-game when the script runs
for _, plr in ipairs(Players:GetPlayers()) do
	plr.CharacterAdded:Connect(function(char)
		onCharacterAdded(plr, char)
	end)
	if plr.Character then
		onCharacterAdded(plr, plr.Character)
	end
end

-- Clean up highlights when a player leaves
Players.PlayerRemoving:Connect(function(plr)
	if highlights[plr] then
		highlights[plr]:Destroy()
		highlights[plr] = nil
	end
end)

-- Public enable/disable functions used by your Rayfield toggle
local function enableESP()
	espEnabled = true
	-- apply to all existing players
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character then
			addHighlightToCharacter(plr, plr.Character)
		end
	end
end

local function disableESP()
	espEnabled = false
	for plr, hl in pairs(highlights) do
		if hl and hl.Parent then
			hl:Destroy()
		end
		highlights[plr] = nil
	end
end

-- ====== End ESP replacement ======

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if espEnabled then
			task.wait(1)
			addHighlightToPlayer(player)
		end
	end)
end)





Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		addHighlightToPlayer(player)
	end)
end)




UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        creatingParts = not creatingParts
        if creatingParts then
            startPartCreationLoop()
        end
    end
end)


scriptsTAB:CreateToggle({
    Name = "Create Path (Toggle)",
    CurrentValue = false,
    Flag = "pathcreator",
    Callback = function(Value)
        creatingParts = Value
        if creatingParts then
            startPartCreationLoop()
        end
    end,
})

scriptsTAB:CreateInput({
    Name = "Change Toggle Key",
    PlaceholderText = "Enter key (e.g. F, G, T)",
    RemoveTextAfterFocusLost = false,
    Callback = function(inputText)
        local upper = inputText:upper()
        local newKeyCode = Enum.KeyCode[upper]

        if newKeyCode then
            toggleKey = newKeyCode
            Rayfield:Notify({
                Title = "Keybind Changed",
                Content = "New toggle key: " .. upper,
                Duration = 3,
                Image = nil
            })
        else
            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "Could not set key: '" .. inputText .. "' is not valid.",
                Duration = 2,
                Image = nil
            })
        end
    end,
})

scriptsTAB:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "Enter Number (16, 32, 64, 128)",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        player.Character.Humanoid.WalkSpeed = v
            Rayfield:Notify({
                Title = "Success",
                Content = "Set Walkspeed to: '" .. v .. "'.",
                Duration = 3,
                Image = nil
            })
    end,
})

scriptsTAB:CreateInput({
    Name = "Jump Power",
    PlaceholderText = "Enter Number (16, 32, 64, 128)",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        player.Character.Humanoid.JumpPower = v
            Rayfield:Notify({
                Title = "Success",
                Content = "Set JumpPower to: '" .. v .. "'.",
                Duration = 3,
                Image = nil
            })
    end,
})


scriptsTAB:CreateToggle({
    Name = "ESP",
    PlaceholderText = "ESP",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
       
        if v then
            enableESP()
            Rayfield:Notify({
                Title = "ESP",
                Content = "is on",
                Duration = 3
            })
        else
            disableESP()
            Rayfield:Notify({
                Title = "ESP",
                Content = "is off",
                Duration = 3
            })
        end
    end,
})


