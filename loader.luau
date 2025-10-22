--// MARLANO Custom Loader v1.0
--// simple, modular, auto-game-detect loader

--=== SERVICES ===--
local HttpService = game:GetService("HttpService")
local StarterGui  = game:GetService("StarterGui")

--=== CONFIGURATIONS ===--

-- daftar script berdasarkan game.PlaceId
local GameLoaders = {
    [121864768012064] = {
        name    = "Fish It",
        url     = "https://raw.githubusercontent.com/marlano/roblox-scripts/main/fish.lua",
        version = "1.0.0",
        author  = "marlano",
    },
    [6911148748] = {
        name    = "Cedit",
        url     = "https://raw.githubusercontent.com/marlano/roblox-scripts/main/cedit.lua",
        version = "4.2.5",
        author  = "marlano",
    }
}

-- fallback script jika game tidak dikenal
local DefaultLoader = {
    name    = "Universal Loader",
    url     = "https://raw.githubusercontent.com/marlano/roblox-scripts/main/universal.lua",
    version = "1.0.0",
    author  = "marlano",
}

--=== UTILITIES ===--

-- tampilkan notifikasi ke pemain
local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title    = title,
            Text     = text,
            Duration = 5
        })
    end)
end

-- fungsi untuk memuat script dari URL
local function loadScript(url)
    local success, result = pcall(function()
        local src = game:HttpGet(url)
        local fn = loadstring(src)
        if fn then
            fn()
            return true
        else
            error("Failed to compile script")
        end
    end)

    if not success then
        warn("[Loader Error]: " .. tostring(result))
        notify("Loader", "❌ Gagal memuat script. Coba lagi.")
        return false
    else
        return true
    end
end

--=== MAIN EXECUTION ===--

local placeId = game.PlaceId
local config = GameLoaders[placeId] or DefaultLoader

notify("⚙️ MARLANO Loader", string.format(
    "Memuat script '%s' (v%s) oleh %s",
    config.name, config.version or "N/A", config.author or "unknown"
))

local ok = loadScript(config.url)
if ok then
    notify("✅ Loader", "Script berhasil dijalankan!")
else
    notify("⚠️ Loader", "Script gagal dimuat.")
end
