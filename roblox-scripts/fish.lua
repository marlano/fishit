-- Fish.lua (GUI Edition via DrRay UI Library)
-- Dibuat agar muncul GUI “Fishing Hub 🎣” dengan tab, toggle, dan instruksi

-- Load DrRay UI Library
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

-- Membuat window utama
local window = DrRayLib:Load("Fishing Hub 🎣", "Default")

-- Tab utama: Fishing
local fishingTab = window.newTab("Fishing", "rbxassetid://4483345998")

-- Tambahkan elemen GUI
fishingTab.newLabel("Fishing Settings")
fishingTab.newToggle("Instant Fishing", "Auto instantly catch fish", false, function(state)
    if state then
        print("Instant Fishing aktif 🎣")
    else
        print("Instant Fishing dimatikan ⛔")
    end
end)

fishingTab.newButton("Start Auto Fishing", "Mulai auto fishing", function()
    print("Auto Fishing dimulai!")
end)

fishingTab.newButton("Stop Auto Fishing", "Hentikan auto fishing", function()
    print("Auto Fishing berhenti!")
end)

fishingTab.newLabel("How to use it?\nONLY WORKS ON ROD HIGHER SPEED!\n1. Ghostfin Rod (Delay 2.2-3.0)\n2. Element Rod")


-- Toggle Instant Fishing
fishingTab.newToggle("Instant Fishing", "Auto instantly catch fish", false, function(state)
    if state then
        print("Instant Fishing Aktif ✅")
    else
        print("Instant Fishing Nonaktif ❌")
    end
end)

-- Label / Instruksi
fishingTab.newLabel("How to use it?\nONLY WORKS ON ROD HIGHER SPEED!\n\n[ SETTINGS ]\n1. Ghostfin Rod (Delay 2.2-3.0)\n2. Element Rod")

-- Tab tambahan: Automatically
local autoTab = window.newTab("Automatically", "rbxassetid://4483345998")

autoTab.newButton("Start Auto Fishing", "Mulai auto fishing 🎣", function()
    print("Auto Fishing dimulai")
end)

autoTab.newButton("Stop Auto Fishing", "Hentikan auto fishing ⛔", function()
    print("Auto Fishing dihentikan")
end)

-- Inisialisasi UI
window:Init()
