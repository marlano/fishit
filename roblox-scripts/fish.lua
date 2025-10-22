-- 🎣 Fish.lua (DrRay Compatible GUI)
-- Dibuat oleh Marlano - menggunakan DrRay UI Library

local success, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
end)

if not success or not Library then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Fish.lua ❌",
        Text = "Gagal memuat DrRay UI Library!",
        Duration = 5
    })
    warn("[Fish.lua] Gagal memuat DrRay UI Library:", Library)
    return
end

-- Buat window utama
local Window = Library:CreateWindow("Fishing Hub 🎣")

-- TAB FISHING
local Fishing = Window:CreateFolder("🎣 Fishing Settings")
Fishing:Label("• Spam click during fishing (only legit)")
Fishing:Toggle("Instant Fishing", function(state)
    print("Instant Fishing:", state)
end)
Fishing:Button("Start Auto Fishing", function()
    print("Auto Fishing dimulai!")
end)
Fishing:Button("Stop Auto Fishing", function()
    print("Auto Fishing dihentikan!")
end)
Fishing:Label("How to use it?\nONLY WORKS ON ROD HIGHER SPEED!\n1. Ghostfin Rod\n2. Element Rod")

-- TAB AUTOMATICALLY
local Auto = Window:CreateFolder("⚙️ Automatically")
Auto:Toggle("Auto Sell Fish", function(state) print("Auto Sell:", state) end)
Auto:Toggle("Auto Equip Best Rod", function(state) print("Auto Equip:", state) end)

-- TAB QUEST
local Quest = Window:CreateFolder("📜 Quest")
Quest:Toggle("Auto Accept Quest", function(state) print("Auto Accept Quest:", state) end)
Quest:Button("Claim Quest Rewards", function() print("Quest Rewards claimed") end)

-- TAB TELEPORT
local Teleport = Window:CreateFolder("🧭 Teleport")
Teleport:Button("Go to Spawn", function() print("Teleport ke Spawn") end)
Teleport:Button("Go to Fishing Area", function() print("Teleport ke Fishing Area") end)

-- TAB WEBHOOK
local Webhook = Window:CreateFolder("🌐 Webhook")
Webhook:Label("Discord Webhook Settings")
Webhook:Button("Set Webhook URL", function() print("Webhook URL diset") end)

-- TAB MISC
local Misc = Window:CreateFolder("🧰 Misc")
Misc:Button("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)
Misc:Button("Unload GUI", function() Library:Unload() end)

-- INISIALISASI
Library:Init()
