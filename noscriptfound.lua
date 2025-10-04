
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


local scriptstab = Window:CreateTab("Humanoid", 4483362458)


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


local function ESP(wat)
    if wat then
        	for _, player in ipairs(Players:GetPlayers()) do
		addHighlightToPlayer(player)
	end
else
    	for player, highlight in pairs(highlights) do
		if highlight and highlight.Parent then
			highlight:Destroy()
		end
	end
	table.clear(highlights)
    end

end




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


scriptstab:CreateToggle({
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

scriptstab:CreateInput({
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

scriptstab:CreateInput({
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

scriptstab:CreateInput({
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


scriptstab:CreateToggle({
    Name = "ESP",
    PlaceholderText = "ESP",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
        ESP(v)
            Rayfield:Notify({
                Title = "Activated ESP",
                Content = "",
                Duration = 3,
                Image = nil
            })
    end,
})

