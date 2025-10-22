-- 🎣 Fish.lua (Full GUI Version)
-- Dibuat oleh Marlano - menggunakan DrRay UI Library
-- Menampilkan GUI lengkap seperti di gambar (Fishing, Automatically, Quest, Teleport, Webhook, Misc)

-- 🧩 Load DrRay UI Library
local success, DrRayLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
end)

if not success or not DrRayLib then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Fish.lua ❌",
        Text = "Gagal memuat DrRay UI Library!",
        Duration = 5
    })
    warn("[Fish.lua] Gagal memuat DrRay UI Library:", DrRayLib)
    return
end

-- 🪟 Buat window utama
local window = DrRayLib:Load("Fishing Hub 🎣", "Default")

-------------------------------------------------------------------
-- 🐟 TAB 1: FISHING
-------------------------------------------------------------------
local fishingTab = window.newTab("Fishing", "rbxassetid://4483345998")

fishingTab.newLabel("Fishing Settings")

fishingTab.newToggle("Instant Fishing", "Auto instantly catch fish", false, function(state)
    if state then
        print("✅ Instant Fishing Aktif")
    else
        print("⛔ Instant Fishing Dimatikan")
    end
end)

fishingTab.newToggle("Spam Click During Fishing", "Klik otomatis saat memancing (legal)", false, function(state)
    print("Spam Click:", state)
end)

fishingTab.newLabel("How to use it?")
fishingTab.newLabel("ONLY WORKS ON ROD HIGHER SPEED!\n\n[ SETTINGS ]\n1. Ghostfin Rod (Delay 2.2 - 3.0)\n2. Element Rod")

-------------------------------------------------------------------
-- ⚙️ TAB 2: AUTOMATICALLY
-------------------------------------------------------------------
local autoTab = window.newTab("Automatically", "rbxassetid://4483345998")

autoTab.newButton("Start Auto Fishing", "Mulai auto fishing 🎣", function()
    print("Auto Fishing dimulai")
end)

autoTab.newButton("Stop Auto Fishing", "Hentikan auto fishing ⛔", function()
    print("Auto Fishing dihentikan")
end)

autoTab.newToggle("Auto Sell Fish", "Jual ikan otomatis setelah dapat", false, function(state)
    print("Auto Sell:", state)
end)

autoTab.newToggle("Auto Equip Rod", "Ganti pancing otomatis terbaik", false, function(state)
    print("Auto Equip:", state)
end)

-------------------------------------------------------------------
-- 🧭 TAB 3: QUEST
-------------------------------------------------------------------
local questTab = window.newTab("Quest", "rbxassetid://4483345998")

questTab.newLabel("Quest Automation")
questTab.newToggle("Auto Accept Quests", "Ambil quest otomatis", false, function(state)
    print("Auto Accept Quest:", state)
end)

questTab.newButton("Claim All Quest Rewards", "Ambil semua hadiah quest 🎁", function()
    print("Hadiah quest diambil")
end)

-------------------------------------------------------------------
-- 🌀 TAB 4: TELEPORT
-------------------------------------------------------------------
local teleportTab = window.newTab("Teleport", "rbxassetid://4483345998")

teleportTab.newLabel("Teleport Menu")
teleportTab.newButton("Spawn", "Pergi ke area Spawn", function()
    print("Teleport ke Spawn")
end)

teleportTab.newButton("Fishing Area", "Pergi ke area Memancing", function()
    print("Teleport ke Fishing Area")
end)

teleportTab.newButton("Shop", "Pergi ke Toko", function()
    print("Teleport ke Shop")
end)

-------------------------------------------------------------------
-- 🌐 TAB 5: WEBHOOK
-------------------------------------------------------------------
local webhookTab = window.newTab("Webhook", "rbxassetid://4483345998")

webhookTab.newLabel("Discord Webhook Settings")

webhookTab.newButton("Set Webhook URL", "Masukkan URL webhook kamu", function()
    print("Webhook diset (dummy)")
end)

webhookTab.newToggle("Send Catch Data", "Kirim data ikan ke webhook", false, function(state)
    print("Kirim data ke webhook:", state)
end)

-------------------------------------------------------------------
-- ⚙️ TAB 6: MISC
-------------------------------------------------------------------
local miscTab = window.newTab("Misc", "rbxassetid://4483345998")

miscTab.newLabel("Miscellaneous Tools")

miscTab.newButton("Rejoin Server", "Masuk ulang ke server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

miscTab.newButton("Copy Discord Link", "Salin link Discord", function()
    setclipboard("https://discord.gg/fishhub")
    print("Link Discord disalin!")
end)

miscTab.newButton("Unload GUI", "Tutup Fishing Hub", function()
    DrRayLib:Unload()
end)

-------------------------------------------------------------------
-- 🚀 AKHIRI DAN TAMPILKAN
-------------------------------------------------------------------
window:Init()
