-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window
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

-- Create "Humanoid" tab
local scriptstab = Window:CreateTab("Humanoid", 4483362458)

-- Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Variables
local creatingParts = false
local maxParts = 20
local partList = {}
local toggleKey = Enum.KeyCode.F -- Default keybind

-- Create part function
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

-- Loop for spawning parts
local function startPartCreationLoop()
    task.spawn(function()
        while creatingParts do
            createPart()
            task.wait(0.1)
        end
    end)
end

-- Key input toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        creatingParts = not creatingParts
        if creatingParts then
            startPartCreationLoop()
        end
    end
end)

-- Rayfield toggle button (optional GUI control)
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
    RemoveTextAfterFocusLost = true,
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
    RemoveTextAfterFocusLost = true,
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

