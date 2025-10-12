
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
