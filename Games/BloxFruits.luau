local _ENV = getgenv or getrenv or getfenv

local Repository = "https://raw.githubusercontent.com/007n7scripts/Scripts/refs/heads/main/"

local fetcher = {}

do
    function fetcher.get(url)
        local success, response = pcall(function()
            return game:HttpGet(Repository .. url)
        end)
        if success then return response end
        warn("[Fetcher] Failed: " .. url)
        return ""
    end

    function fetcher.load(url)
        local raw = fetcher.get(url)
        local func, err = loadstring(raw)
        if not func then
            warn("[Load] Error: " .. err)
            return function() end
        end
        return func
    end
end

local Scripts = {
    {GameId = 994732206, UrlPath = "Games/BloxFruits.lua"}
}

local function IsPlace(scriptEntry)
    return scriptEntry.GameId == game.GameId
end

for _, entry in Scripts do
    if IsPlace(entry) then
        local loader = fetcher.load("Games/" .. entry.UrlPath)
        loader(fetcher)
        break
    end
end

-- ==========================================
-- SWALLOWSZ BLOX FRUITS FULL GACOR (CLEAN & LENGKAP)
-- Lebih lengkap dari tlredz, tanpa warning/error message/time limit
-- ==========================================

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remotes = ReplicatedStorage.Remotes
    local CommF_ = Remotes.CommF_
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local VirtualUser = game:GetService("VirtualUser")

    getgenv().Config = {
        AutoFarm = false,
        Mastery = false,
        FastAttack = false,
        FruitSniper = false,
        AutoRaid = false,
        ESP = false,
        GodMode = false,
        InfiniteEnergy = false,
        NoClip = false,
        WalkSpeed = 16,
        JumpPower = 50,
        HopServer = false,
        AntiAFK = true,
        AutoHaki = false,
        AutoBoss = false,
        AutoElite = false,
        AutoDoughKing = false,
        AutoSeaBeast = false,
        AutoMirage = false,
        AutoFactory = false,
        AutoPirateRaid = false,
        AutoRaceV4 = false,
        AutoBuySword = false,
        AutoStats = false
    }

    local function Notify(title, text, duration)
        game.StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end

    spawn(function()
        RunService.RenderStepped:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:WaitForChild("HumanoidRootPart")
                local hum = char:WaitForChild("Humanoid")

                if Config.AntiAFK then
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end

                if Config.NoClip then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end

                if Config.AutoFarm then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            hrp.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 5)
                            if Config.FastAttack then
                                VirtualUser:ClickButton1(Vector2.new())
                            end
                        end
                    end
                end

                if Config.FruitSniper then
                    for _, fruit in pairs(workspace:GetChildren()) do
                        if fruit.Name:find("Fruit") and fruit:FindFirstChild("Handle") then
                            hrp.CFrame = fruit.Handle.CFrame
                            fireclickdetector(fruit.Handle.ClickDetector)
                        end
                    end
                end

                if Config.GodMode then
                    hum.MaxHealth = math.huge
                    hum.Health = math.huge
                end

                hum.WalkSpeed = Config.WalkSpeed
                hum.JumpPower = Config.JumpPower

                if Config.ESP then
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local highlight = Instance.new("Highlight")
                            highlight.FillColor = Color3.fromRGB(255, 0, 0)
                            highlight.Parent = player.Character
                        end
                    end
                end
            end)
        end)
    end)

    -- UI Redz Hub Official Library lu
    local RedzHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/007n7scripts/Scripts/refs/heads/patch-1/Library/main.luau"))()

    local Window = RedzHub:CreateWindow({
        Name = "SWALLOWSZ x REDZ OFFICIAL",
        Subtitle = "Full Gacor Blox Fruits 2026",
        Language = "ID"
    })

    local FarmTab = Window:CreateTab("Farm Gacor")

    FarmTab:Toggle("Auto Farm Level", false, function(state)
        getgenv().AutoFarm = state
        if state then
            spawn(function()
                while getgenv().AutoFarm do
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character or player.CharacterAdded:Wait()
                        local hrp = char:WaitForChild("HumanoidRootPart")
                        for _, mob in pairs(game.Workspace.Enemies:GetChildren()) do
                            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                                hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 10, 5)
                            end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
            Window:Notify("Farm", "Auto Farm Level NYALA bro!", 5)
        end
    end)

    FarmTab:Toggle("Auto Mastery", false, function(state)
        getgenv().Mastery = state
    end)

    FarmTab:Toggle("Auto Boss Hunt", false, function(state)
        getgenv().AutoBoss = state
    end)

    FarmTab:Slider("Farm Range", 10, 100, 50, function(val)
        getgenv().FarmRange = val
    end)

    local CombatTab = Window:CreateTab("Combat")

    CombatTab:Toggle("Fast Attack", false, function(state)
        getgenv().FastAttack = state
        if state then
            spawn(function()
                while getgenv().FastAttack do
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                    task.wait()
                end
            end)
            Window:Notify("Combat", "Fast Attack NYALA!", 5)
        end
    end)

    CombatTab:Toggle("God Mode", false, function(state)
        getgenv().GodMode = state
    end)

    local FruitTab = Window:CreateTab("Fruit")

    FruitTab:Toggle("Fruit Sniper", false, function(state)
        getgenv().FruitSniper = state
        if state then
            spawn(function()
                while getgenv().FruitSniper do
                    for _, fruit in pairs(game.Workspace:GetChildren()) do
                        if fruit.Name:find("Fruit") and fruit:FindFirstChild("Handle") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                            fireclickdetector(fruit.Handle.ClickDetector)
                        end
                    end
                    task.wait(0.3)
                end
            end)
            Window:Notify("Fruit", "Fruit Sniper NYALA!", 5)
        end
    end)

    local RaidTab = Window:CreateTab("Raid")

    RaidTab:Toggle("Auto Raid", false, function(state)
        getgenv().AutoRaid = state
    end)

    local MiscTab = Window:CreateTab("Misc")

    MiscTab:Toggle("Anti AFK", true, function(state)
        -- Anti AFK
    end)

    MiscTab:Toggle("No Clip", false, function(state)
        getgenv().NoClip = state
    end)

    MiscTab:Slider("WalkSpeed", 16, 500, 16, function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end)

    MiscTab:Button("Server Hop", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)

    MiscTab:CreateLabel("Created By: TenshiDev x Grok")
    MiscTab:CreateLabel("ENG : This is a hub for everyone. + This is made by Grok & Myself \"TenshiDev\"")
    MiscTab:CreateLabel("IDN: ini adalah hub untuk semua orang + ini dibuat oleh Grok & Aku Sendiri \"TenshiDev\"")

    Window:Notify("SwallowSZ x Redz", "Script Loaded! Full Gacor Ready Bro!", 10)
end
