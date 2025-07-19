
--[[
    Yuri No Hub 💘 – Rewritten Stand GUI
    Recreated with love, Yuri obsession, and JoJo Stand power.
    Original by necrochancer | Refined by ChatGPT
--]]

--// 🌐 Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

--// 🧍 Local Player & Remote
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainRemoteEvent = ReplicatedStorage:WaitForChild("Modules")
    :WaitForChild("Network")
    :WaitForChild("RemoteEvent")

--// 🌈 Rayfield UI Setup
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/source.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "Yuri No Hub 💘",
    Theme = "Default",
    LoadingTitle = "Yare Yare Daze...",
    LoadingSubtitle = "Loading Stand Powers",
    Icon = "microwave",
    Link = "https://github.com/necrochancer/ShitScripts/Forsaken",
    DisableBuildWarnings = true,
    DisableRayfieldPrompts = true,
    KeySystem = true,
    KeySettings = {
        Title = "Yuri Stand Key System",
        Subtitle = "You thought it was a fart hub, but it was me! Dio!",
        Note = "Key copied to clipboard~",
        FileName = "yuriStandKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "starplatinum" },
    },
})

setclipboard("https://linkunlocker.com/yuri-no-hub-ZINXl")

--// 🌫️ Blur Toggle
local BlurEffectEnabled = false
local function ToggleBlurEffect(state)
    BlurEffectEnabled = state
    if state then
        local blur = Lighting:FindFirstChild("StandBlur") or Instance.new("BlurEffect")
        blur.Name = "StandBlur"
        blur.Size = 24
        blur.Parent = Lighting
    else
        local existing = Lighting:FindFirstChild("StandBlur")
        if existing then
            existing:Destroy()
        end
    end
end

--// ⚔️ Auto 1x4 Ability Popups
local activeAbilityConnections = {}
local abilityMonitorConnection = nil

local function ClearAbilityConnections()
    for _, conn in ipairs(activeAbilityConnections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    table.clear(activeAbilityConnections)
end

local function MonitorAbilityPopups()
    local abilityContainer = PlayerGui:WaitForChild("MainUI"):WaitForChild("AbilityContainer")
    local playerCharacter = LocalPlayer.Character
    if not playerCharacter then return end

    local function HandleAbilityFrame(frame)
        if frame:IsA("Frame") and frame:FindFirstChild("CooldownTime") then
            local cooldownLabel = frame.CooldownTime
            local connection = cooldownLabel:GetPropertyChangedSignal("Text"):Connect(function()
                if cooldownLabel.Text ~= "" then
                    Rayfield:Notify({
                        Title = "Ability Activated!",
                        Content = "A new Stand ability has been used.",
                        Duration = 3,
                        Image = "⚔️"
                    })
                end
            end)
            table.insert(activeAbilityConnections, connection)
        end
    end

    for _, child in ipairs(abilityContainer:GetChildren()) do
        HandleAbilityFrame(child)
    end

    abilityMonitorConnection = abilityContainer.ChildAdded:Connect(HandleAbilityFrame)
end

local function InitAbilityPopupSystem()
    ClearAbilityConnections()
    MonitorAbilityPopups()
end

--// 🗂️ Tabs
local Tabs = {
    Player = Window:CreateTab("🎮 Player", nil),
    Visuals = Window:CreateTab("🌈 Visuals", nil),
    Misc = Window:CreateTab("💡 Misc", nil),
}

--// UI Toggles
Tabs.Visuals:CreateToggle({
    Name = "Enable Blur (Za Warudo)",
    CurrentValue = false,
    Flag = "BlurToggle",
    Callback = function(state)
        ToggleBlurEffect(state)
    end,
})

Tabs.Misc:CreateToggle({
    Name = "Auto 1x4 Stand Popups",
    CurrentValue = true,
    Flag = "AutoPopups",
    Callback = function(state)
        if state then
            InitAbilityPopupSystem()
        else
            ClearAbilityConnections()
        end
    end,
})

--// Monitor character changes for auto popup
LocalPlayer:GetPropertyChangedSignal("Character"):Connect(function()
    task.wait(0.3)
    if Tabs.Misc.Flags.AutoPopups then
        InitAbilityPopupSystem()
    end
end)

--// 💬 Final Touch
Rayfield:Notify({
    Title = "Yuri No Hub Loaded!",
    Content = "Time to rewrite fate... with Stands.",
    Duration = 5,
    Image = "🌸"
})
