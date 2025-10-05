--// Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--// Window Setup
local Window = Rayfield:CreateWindow({
    Name = "UniScript HUB [v2.0]",
    LoadingTitle = "Ultimate Hub Loading...",
    LoadingSubtitle = "By SomeoneCool 😎",

    Icon = 17677152287,
    Color = Color3.fromRGB(255, 0, 0),
    ShowText = "Rayfield",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UniScript",
        FileName = "Config"
    },

    Theme = "Amethyst",

    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "Key Menu Ω",
        Subtitle = "Enter Key to Unlock",
        Note = "Valid Keys: RealC0lkit, C0lgate, etc.",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"SomeoneSucks", "C0lgate", "tembl3udud", "RealC0lkit"}
    }
})



--// Tabs
local homeTAB = Window:CreateTab("Home", 4483362458)
local playerTAB = Window:CreateTab("Player", 4483362458)
if game.GameId == 3649378258 then
    local gameTAB = Window:CreateTab("Game (Random Tool)", 4483362458)
    gameTAB:CreateButton({
        Name = "Get Gambling Island Ticket",
    -- inside your Rayfield callback
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player then return end
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        local interactable = workspace:FindFirstChild("Interactable")
        local ticketPart = interactable:FindFirstChild("Gambling Island Ticket")
        local prevCFrame = hrp.CFrame
        hrp.CFrame = ticketPart.CFrame + Vector3.new(0, 3, 0)
        wait(0.05)
        local clicked = false
        local cd = ticketPart:FindFirstChildOfClass("ClickDetector")

        -- 1) try exploit helper: fireclickdetector
        if not clicked and type(fireclickdetector) == "function" then
            local ok, err = pcall(function() fireclickdetector(cd or ticketPart) end)
            if ok then
                clicked = true
                print("Clicked via fireclickdetector")
            else
                warn("fireclickdetector error:", err)
            end
        end

        -- 2) try firetouchinterest (simulate touch)
        if not clicked and type(firetouchinterest) == "function" then
            local ok, err = pcall(function()
                -- begin touch
                firetouchinterest(hrp, ticketPart, 0)
                wait(0.08)
                -- end touch
                firetouchinterest(hrp, ticketPart, 1)
            end)
            if ok then
                clicked = true
                print("Clicked via firetouchinterest")
            else
                warn("firetouchinterest error:", err)
            end
        end

        -- 3) some exploit envs expose VirtualInputManager / mouse event simulation; try common names
        if not clicked then
            -- try calling ClickDetector.MouseClick:Fire(player) as a last-ditch attempt (rarely works)
            if cd and cd:FindFirstChildWhichIsA("ObjectValue") == nil then
                local success, err = pcall(function()
                    -- Many environments won't allow this; pcall keeps it safe
                    if cd and cd.MouseClick and type(cd.MouseClick.Fire) == "function" then
                        cd.MouseClick:Fire(player)
                    end
                end)
                if success then
                    clicked = true
                    print("Tried MouseClick:Fire (fallback)")
                else
                    warn("MouseClick:Fire attempt failed:", err)
                end
            end
        end

        -- 4) final fallback: warn user nothing supported
        if not clicked then
            warn("No supported exploit helper found (fireclickdetector / firetouchinterest). Can't trigger the ClickDetector from this environment.")
        end

        -- small wait then restore player
        wait(0.08)
        pcall(function() hrp.CFrame = prevCFrame end)
    end
    })
    gameTAB:CreateButton({
        Name = "Get Fanta",
    -- inside your Rayfield callback
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player then return end
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        local interactable = workspace:FindFirstChild("Interactable")
        local ticketPart = interactable:FindFirstChild("Fanta")
        local prevCFrame = hrp.CFrame
        hrp.CFrame = ticketPart.CFrame + Vector3.new(0, 3, 0)
        wait(0.05)
        local clicked = false
        local cd = ticketPart:FindFirstChildOfClass("ClickDetector")

        -- 1) try exploit helper: fireclickdetector
        if not clicked and type(fireclickdetector) == "function" then
            local ok, err = pcall(function() fireclickdetector(cd or ticketPart) end)
            if ok then
                clicked = true
                print("Clicked via fireclickdetector")
            else
                warn("fireclickdetector error:", err)
            end
        end

        -- 2) try firetouchinterest (simulate touch)
        if not clicked and type(firetouchinterest) == "function" then
            local ok, err = pcall(function()
                -- begin touch
                firetouchinterest(hrp, ticketPart, 0)
                wait(0.08)
                -- end touch
                firetouchinterest(hrp, ticketPart, 1)
            end)
            if ok then
                clicked = true
                print("Clicked via firetouchinterest")
            else
                warn("firetouchinterest error:", err)
            end
        end

        -- 3) some exploit envs expose VirtualInputManager / mouse event simulation; try common names
        if not clicked then
            -- try calling ClickDetector.MouseClick:Fire(player) as a last-ditch attempt (rarely works)
            if cd and cd:FindFirstChildWhichIsA("ObjectValue") == nil then
                local success, err = pcall(function()
                    -- Many environments won't allow this; pcall keeps it safe
                    if cd and cd.MouseClick and type(cd.MouseClick.Fire) == "function" then
                        cd.MouseClick:Fire(player)
                    end
                end)
                if success then
                    clicked = true
                    print("Tried MouseClick:Fire (fallback)")
                else
                    warn("MouseClick:Fire attempt failed:", err)
                end
            end
        end

        -- 4) final fallback: warn user nothing supported
        if not clicked then
            warn("No supported exploit helper found (fireclickdetector / firetouchinterest). Can't trigger the ClickDetector from this environment.")
        end

        -- small wait then restore player
        wait(0.08)
        pcall(function() hrp.CFrame = prevCFrame end)
    end
    })
    gameTAB:CreateButton({
        Name = "Get construction",
    -- inside your Rayfield callback
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player then return end
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        local interactable = workspace:FindFirstChild("Interactable")
        local ticketPart = interactable:FindFirstChild("construction")
        local prevCFrame = hrp.CFrame
        hrp.CFrame = ticketPart.CFrame + Vector3.new(0, 3, 0)
        wait(0.05)
        local clicked = false
        local cd = ticketPart:FindFirstChildOfClass("ClickDetector")

        -- 1) try exploit helper: fireclickdetector
        if not clicked and type(fireclickdetector) == "function" then
            local ok, err = pcall(function() fireclickdetector(cd or ticketPart) end)
            if ok then
                clicked = true
                print("Clicked via fireclickdetector")
            else
                warn("fireclickdetector error:", err)
            end
        end

        -- 2) try firetouchinterest (simulate touch)
        if not clicked and type(firetouchinterest) == "function" then
            local ok, err = pcall(function()
                -- begin touch
                firetouchinterest(hrp, ticketPart, 0)
                wait(0.08)
                -- end touch
                firetouchinterest(hrp, ticketPart, 1)
            end)
            if ok then
                clicked = true
                print("Clicked via firetouchinterest")
            else
                warn("firetouchinterest error:", err)
            end
        end

        -- 3) some exploit envs expose VirtualInputManager / mouse event simulation; try common names
        if not clicked then
            -- try calling ClickDetector.MouseClick:Fire(player) as a last-ditch attempt (rarely works)
            if cd and cd:FindFirstChildWhichIsA("ObjectValue") == nil then
                local success, err = pcall(function()
                    -- Many environments won't allow this; pcall keeps it safe
                    if cd and cd.MouseClick and type(cd.MouseClick.Fire) == "function" then
                        cd.MouseClick:Fire(player)
                    end
                end)
                if success then
                    clicked = true
                    print("Tried MouseClick:Fire (fallback)")
                else
                    warn("MouseClick:Fire attempt failed:", err)
                end
            end
        end

        -- 4) final fallback: warn user nothing supported
        if not clicked then
            warn("No supported exploit helper found (fireclickdetector / firetouchinterest). Can't trigger the ClickDetector from this environment.")
        end

        -- small wait then restore player
        wait(0.08)
        pcall(function() hrp.CFrame = prevCFrame end)
    end
    })


gameTAB:CreateButton({
    Name = "Remove Doors (from houses)",
    Callback = function()
        -- Workspace.House altındaki tüm modelleri dolaş
        local housesFolder = workspace:FindFirstChild("House")
        if housesFolder then
            for _, house in pairs(housesFolder:GetChildren()) do
                -- Her house içindeki tüm objeleri kontrol et
                for _, obj in pairs(house:GetDescendants()) do
                    -- Eğer objenin ismi "Door" ise sil
                    if obj.Name == "Door" then
                        obj:Destroy()
                    end
                end
            end
        else
            warn("Workspace içinde 'House' bulunamadı!")
        end
    end
})

--// Teleport System for TPS Models
local tpsFolder = workspace:FindFirstChild("TPS")
local tpsNames = {}
local selectedTP = nil -- dropdown seçimi buraya kaydedilecek

if tpsFolder then
    for _, obj in pairs(tpsFolder:GetChildren()) do
        if obj:IsA("Model") then
            table.insert(tpsNames, obj.Name)
        end
    end
else
    warn("Workspace içinde 'TPS' klasörü bulunamadı!")
end

-- Dropdown: TPS içindeki modelleri listele
local dropdown = gameTAB:CreateDropdown({
    Name = "Select Teleport Location",
    Options = tpsNames,
    Callback = function(selected)
        selectedTP = selected
        Rayfield:Notify({
            Title = "Location Selected",
            Content = "Selected: " .. selectedTP,
            Duration = 3
        })
    end
})

-- Teleport butonu
gameTAB:CreateButton({
    Name = "Teleport",
    Callback = function()
        if not selectedTP then
            Rayfield:Notify({
                Title = "No Location Selected",
                Content = "Please select a location from dropdown first!",
                Duration = 3
            })
            return
        end

        local target = tpsFolder:FindFirstChild(selectedTP)
        if not target then
            Rayfield:Notify({
                Title = "Error",
                Content = "Target model not found in TPS folder!",
                Duration = 3
            })
            return
        end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")

        if hrp then
            -- Eğer PrimaryPart varsa oraya git, yoksa modelin merkezine
            local destinationCFrame
            if target.PrimaryPart then
                destinationCFrame = target.PrimaryPart.CFrame
            else
                local cf = target:GetBoundingBox()
                destinationCFrame = cf
            end

            -- Teleport et
            hrp.CFrame = destinationCFrame + Vector3.new(0, 3, 0)
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Moved to " .. selectedTP,
                Duration = 2
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "HumanoidRootPart not found!",
                Duration = 3
            })
        end
    end
})

end

local keybindsTAB = Window:CreateTab("Keybinds", 4483362458)
local uiTAB = Window:CreateTab("UI", 4483362458)

--// Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

--// Variables
local creatingParts = false
local espEnabled = false
local maxParts = 20
local partList = {}
local highlights = {}
local toggleKey = Enum.KeyCode.F
local flyEnabled = false
local flySpeed = 50
local noclipEnabled = false
local infiniteJumpEnabled = false

--// Utility Functions
local function createPart()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local part = Instance.new("Part")
    part.Size = Vector3.new(5, 1, 5)
    part.Transparency = 0.5
    part.Anchored = true
    part.CanCollide = true
    part.Position = char.HumanoidRootPart.Position - Vector3.new(0, char.HumanoidRootPart.Size.Y / 2 + 2.5, 0)
    part.Parent = workspace

    table.insert(partList, part)
    if #partList > maxParts then
        local oldPart = table.remove(partList, 1)
        if oldPart then oldPart:Destroy() end
    end
end

local function startPartLoop()
    task.spawn(function()
        while creatingParts do
            createPart()
            task.wait(0.1)
        end
    end)
end

--// ESP Functions
local function addHighlight(plr, char)
    if not plr or not char then return end

    if highlights[plr] then
        highlights[plr]:Destroy()
        highlights[plr] = nil
    end

    if not char:FindFirstChild("HumanoidRootPart") then
        pcall(function() char:WaitForChild("HumanoidRootPart", 5) end)
    end

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
            addHighlight(plr, char)
        end
    end)
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            addHighlight(plr, plr.Character)
        end
        plr.CharacterAdded:Connect(function(char)
            onCharacterAdded(plr, char)
        end)
    end
end

local function disableESP()
    espEnabled = false
    for plr, hl in pairs(highlights) do
        if hl then hl:Destroy() end
    end
    table.clear(highlights)
end

--// Fly / Noclip
local bodyVelocity
local function enableFly()
    if not player.Character then return end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    flyEnabled = true

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = hrp
end

local function disableFly()
    flyEnabled = false
    if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
end

RunService.RenderStepped:Connect(function()
    if flyEnabled and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local camCF = workspace.CurrentCamera.CFrame
            local direction = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction += camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction -= camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction -= camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction += camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then direction -= Vector3.new(0,1,0) end
            bodyVelocity.Velocity = direction.Unit * flySpeed
        end
    end

    -- Noclip
    if noclipEnabled and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

--// Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

--// Player Events
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

--// Keybind Input
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == toggleKey then
        creatingParts = not creatingParts
        if creatingParts then startPartLoop() end
    end
end)

--// UI Elements

Rayfield:Notify({
    Title = "Hello",
    Content = "Welcome to Ultimate Hub v2.0 😎",
    Duration = 3,
    Image = 16467424883,
})

-- Player TAB
playerTAB:CreateToggle({
    Name = "Create Path (Toggle)",
    CurrentValue = false,
    Flag = "pathcreator",
    Callback = function(Value)
        creatingParts = Value
        if creatingParts then startPartLoop() end
    end,
})

playerTAB:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "16, 32, 64...",
    Callback = function(v)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = tonumber(v) or 16 end
    end,
})

playerTAB:CreateInput({
    Name = "Jump Power",
    PlaceholderText = "16, 32, 64...",
    Callback = function(v)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = tonumber(v) or 50 end
    end,
})

playerTAB:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(v)
        if v then enableESP() else disableESP() end
    end,
})

playerTAB:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v) infiniteJumpEnabled = v end,
})

playerTAB:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(v)
        if v then enableFly() else disableFly() end
    end,
})

playerTAB:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(v) noclipEnabled = v end,
})


homeTAB:CreateParagraph({
    Title = "Welcome to UniScript HUB v2.0",
    Content = string.format(
        "Place ID: %d\nGame ID: %d\nPlayers: %d",
        game.PlaceId,
        game.GameId,
        #Players:GetPlayers()
    )
})

homeTAB:CreateButton({
    Name = "Refresh Server Info",
    Callback = function()
        Rayfield:Notify({
            Title = "Server Info",
            Content = string.format(
                "Place ID: %d\nGame ID: %d\nPlayers: %d",
                game.PlaceId,
                game.GameId,
                #Players:GetPlayers()
            ),
            Duration = 3
        })
    end
})

keybindsTAB:CreateInput({
    Name = "Set Path Toggle Key",
    PlaceholderText = "F, G, T...",
    Callback = function(text)
        local key = Enum.KeyCode[text:upper()]
        if key then
            toggleKey = key
            Rayfield:Notify({
                Title = "Keybind Changed",
                Content = "New path toggle key: " .. text:upper(),
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "'" .. text .. "' is not valid.",
                Duration = 3
            })
        end
    end
})

uiTAB:CreateButton({
    Name = "Test Notification",
    Callback = function()
        Rayfield:Notify({
            Title = "Hello!",
            Content = "This is a test notification from UI tab.",
            Duration = 3
        })
    end
})

uiTAB:CreateDropdown({
    Name = "Change Theme",
    Options = {"Amethyst", "Blood", "Ocean", "Midnight"},
    Callback = function(theme)
        Window:ChangeTheme(theme)
    end
})


