-- 🎣 Fish.lua by Marlano (GUI Edition)
-- Dibuat agar tampil seperti di gambar (Fishing Hub GUI)

-- Load Orion UI Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- 🔹 Buat jendela utama
local Window = OrionLib:MakeWindow({
    Name = "Fishing Hub 🎣",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "FishingHub"
})

-- 🔹 Tab utama: Fishing
local FishingTab = Window:MakeTab({
    Name = "Fishing",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 🔹 Toggle utama: Instant Fishing
FishingTab:AddToggle({
    Name = "Instant Fishing",
    Default = false,
    Callback = function(Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Fishing Hub",
                Content = "Instant Fishing Aktif ✅",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Fishing Hub",
                Content = "Instant Fishing Nonaktif ❌",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

-- 🔹 Deskripsi dan cara pakai
FishingTab:AddParagraph("How to use it?", 
"ONLY WORKS ON ROD HIGHER SPEED!\n\n[ SETTINGS ]\n1. Ghostfin Rod (Delay 2.2 - 3.0)\n2. Element Rod")

-- 🔹 Tab lain (opsional)
local AutoTab = Window:MakeTab({
    Name = "Automatically",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AutoTab:AddButton({
    Name = "Start Auto Fishing",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Fishing Hub",
            Content = "Auto Fishing Started 🎣",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

AutoTab:AddButton({
    Name = "Stop Auto Fishing",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Fishing Hub",
            Content = "Auto Fishing Stopped ⛔",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- 🔹 Jalankan GUI
OrionLib:Init()
