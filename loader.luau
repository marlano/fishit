-- Loader buatan kamu sendiri (contoh sederhana)
local repo = "https://raw.githubusercontent.com/marlano/main/roblox-scripts/fish.lua"

local success, result = pcall(function()
    return loadstring(game:HttpGet(repo))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Loader ❌",
        Text = "Gagal load script: " .. tostring(result),
        Duration = 5
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Loader ✅",
        Text = "Script berhasil dimuat!",
        Duration = 5
    })
end
