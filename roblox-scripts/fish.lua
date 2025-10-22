-- 🎣 Fish.lua (DrRay Compatible)
-- Dibuat oleh Marlano - GUI lengkap Fishing Hub

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
    warn("[Fish.lua] Gagal memuat Library:", Library)
    return
end

-- 🪟 Buat jendela utama
local Window = Library:CreateWindow("Fishing Hub 🎣")

-- ==============================================================
-- 🐟 TAB 1: FISHING
-- ==============================================================
local Fishing = Window:CreateFolder("🎣 Fishing Settings")

Fishing:Label("• Spam click during fishing (only legit)")
Fishing:Toggle("Instant Fishing", function(bool)
    print("Instant Fishing:", bool)
end)
Fishing:Button("Start Auto Fishing", function()
    print("Auto Fishing dimulai!")
end)
Fishing:Button("Stop Auto Fishing", function()
    print("Auto Fishing dihentikan!")
end)
Fishing:Label("How to use it?\nONLY WORKS ON ROD HIGHER SPEED!\n1. Ghostfin Rod\n2. Element Rod")

-- ==============================================================
-- ⚙️ TAB 2: AUTOMATICALLY
-- ==============================================================
local Auto = Window:CreateFolder("⚙️ Automatically")

Auto:Toggle("Auto Sell Fish", function(state)
    print("Auto Sell:", state)
end)
Auto:Toggle("Auto Equip Best Rod", function(state)
    print("Auto Equip:", state)
end)
Auto:Button("Claim Rewards", function()
    print("Hadiah diklaim")
end)

-- ==============================================================
-- 📜 TAB 3: QUEST
-- ==============================================================
local Quest = Window:CreateFolder("📜 Quest")

Quest:Toggle("Auto Accept Quest", function(state)
    print("Auto Accept Quest:", state)
end)
Quest:Button("Claim Quest Rewards", function()
    print("Quest Rewards claimed")
end)

-- ==============================================================
-- 🧭 TAB 4: TELEPORT
-- ==============================================================
local Teleport = Window:CreateFolder("🧭 Teleport")

Teleport:Button("Go to Spawn", function()
    print("Teleport ke Spawn")
end)
Teleport:Button("Go to Fishing Area", function()
    print("Teleport ke Fishing Area")
end)
Teleport:Button("Go to Shop", function()
    print("Teleport ke Shop")
end)

-- ==============================================================
-- 🌐 TAB 5: WEBHOOK
-- ==============================================================
local Webhook = Window:CreateFolder("🌐 Webhook")

Webhook:Label("Discord Webhook Settings")
Webhook:Button("Set Webhook URL", function()
    print("Webhook URL diset (dummy)")
end)
Webhook:Toggle("Send Catch Data", function(state)
    print("Kirim data ikan:", state)
end)

-- ==============================================================
-- 🧰 TAB 6: MISC
-- ==============================================================
local Misc = Window:CreateFolder("🧰 Misc")

Misc:Button("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)
Misc:Button("Copy Discord Link", function()
    setclipboard("https://discord.gg/fishhub")
    print("Link Discord disalin")
end)
Misc:Button("Unload GUI", function()
    Library:Unload()
end)

-- ==============================================================
-- 🚀 AKTIFKAN
-- ==============================================================
Library:Init()
