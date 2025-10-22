-- 🌊 MARLANO Custom Loader v1.1 (versi aman)
-- Fungsi: otomatis load script berdasarkan PlaceId

-- Layanan Roblox
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

-- CONFIG
local GameLoaders = {
    [121864768012064] = {
        name = "Fish It",
        url = "https://raw.githubusercontent.com/marlano/main/roblox-scripts/fish.lua",
        version = "1.0.0",
        author = "marlano",
    },
    [6911148748] = {
        name = "Cedit",
        url = "https://raw.githubusercontent.com/marlano/fishit/main/roblox-scripts/cedit.lua",
        version = "4.2.5",
        author = "marlano",
    }
}

local DefaultLoader = {
    name = "Universal Loader",
    url = "https://raw.githubusercontent.com/marlano/yes/main/roblox-scripts/universal.lua",
    version = "1.0.0",
    author = "marlano",
}

-- 🧰 Fungsi bantu notifikasi
local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- 🚀 Fungsi utama untuk ambil & jalankan script
local function loadScript(url)
    -- Pastikan HttpGet ada
    if not game or not game.HttpGet then
        notify("Loader ❌", "Executor kamu tidak support HttpGet!")
        return false
    end

    -- Ambil script dari GitHub
    local success, src = pcall(function()
        return game:HttpGet(url)
    end)
    if not success then
        notify("Loader ❌", "Gagal load script:\n" .. tostring(src))
        return false
    end

    -- Compile script
    local fn, compileErr = loadstring(src)
    if not fn then
        notify("Loader ❌", "Gagal compile:\n" .. tostring(compileErr))
        return false
    end

    -- Jalankan script
    local ok, runtimeErr = pcall(fn)
    if not ok then
        notify("Loader ❌", "Gagal dijalankan:\n" .. tostring(runtimeErr))
        return false
    end

    return true
end

-- 🧭 MAIN EXECUTION
local placeId = game.PlaceId
local loader = GameLoaders[placeId] or DefaultLoader

notify("Loader", "Memuat script: " .. loader.name)
loadScript(loader.url)
