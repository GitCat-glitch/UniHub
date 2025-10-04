
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


local scriptsTAB = Window:CreateTab("Player", 4483362458)
local KeybindsTAB = Window:CreateTab("Keybinds", 4483362458)
local uiTAB = Window:CreateTab("UI", 4483362458)


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
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
        if oldPart then oldPart:Destroy() end
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


local highlights = {}
local espEnabled = false

local function addHighlightToCharacter(plr, char)
    if not char or not plr then return end

    if highlights[plr] then
        highlights[plr]:Destroy()
        highlights[plr] = nil
    end

    if not char:FindFirstChild("HumanoidRootPart") then
        pcall(function() char:WaitForChild("HumanoidRootPart", 5) end)
    end
    if not char.Parent then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = char
    highlights[plr] = highlight
end

local function onCharacterAdded(plr, char)
    task.defer(function()
        if espEnabled then
            task.wait(0.2)
            addHighlightToCharacter(plr, char)
        end
    end)
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            addHighlightToCharacter(plr, plr.Character)
        end
        plr.CharacterAdded:Connect(function(char)
            onCharacterAdded(plr, char)
        end)
    end
end

local function disableESP()
    espEnabled = false
    for plr, hl in pairs(highlights) do
        if hl and hl.Parent then hl:Destroy() end
    end
    table.clear(highlights)
end

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        onCharacterAdded(plr, char)
    end)
    if plr.Character then
        onCharacterAdded(plr, plr.Character)
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    if highlights[plr] then
        highlights[plr]:Destroy()
        highlights[plr] = nil
    end
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
        if creatingParts then startPartCreationLoop() end
    end,
})

KeybindsTAB:CreateInput({
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
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "Could not set key: '" .. inputText .. "' is not valid.",
                Duration = 2
            })
        end
    end,
})

scriptsTAB:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "Enter Number (16, 32, 64, 128)",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = tonumber(v) or 16
            Rayfield:Notify({
                Title = "Walkspeed Changed",
                Content = "Set Walkspeed to " .. v,
                Duration = 3
            })
        end
    end,
})

scriptsTAB:CreateInput({
    Name = "Jump Power",
    PlaceholderText = "Enter Number (16, 32, 64, 128)",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.JumpPower = tonumber(v) or 50
            Rayfield:Notify({
                Title = "Jump Power Changed",
                Content = "Set JumpPower to " .. v,
                Duration = 3
            })
        end
    end,
})

scriptsTAB:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(v)
        if v then
            enableESP()
            Rayfield:Notify({
                Title = "ESP",
                Content = "Enabled",
                Duration = 3
            })
        else
            disableESP()
            Rayfield:Notify({
                Title = "ESP",
                Content = "Disabled",
                Duration = 3
            })
        end
    end,
})


uiTAB:CreateDropdown({
    Name = "Theme",
    Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
    CurrentOption = {"Default"},
    MultipleOptions = false,
    Flag = "Theme",
    Callback = function(Options)
        local selectedTheme = Options[1]
        if selectedTheme then
            Window:SetTheme(selectedTheme)
            Rayfield:Notify({
                Title = "Theme Changed",
                Content = "Theme set to: " .. selectedTheme,
                Duration = 3
            })
        end
    end,
})
