-- Fish.lua (contoh GUI)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "Fishing Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "FishingHub"
})

-- Tab Fishing
local Tab = Window:MakeTab({
    Name = "Fishing",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddToggle({
    Name = "Instant Fishing",
    Default = false,
    Callback = function(Value)
        print("Instant Fishing aktif:", Value)
    end
})

Tab:AddParagraph("How to use it?", "Only works on rod higher speed!\nGhostfin Rod / Element Rod")

OrionLib:Init()
