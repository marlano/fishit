-- MARLANO Custom Loader v1.1

local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

-- CONFIG
local GameLoaders = {
    [121864768012064] = {
        name = "Fish It",
        url = "https://raw.githubusercontent.com/marlano/fishit/main/roblox-scripts/fish.lua",
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
    url = "https://raw.githubusercontent.com/marlano/fishit/main/roblox-scripts/universal.lua",
    version = "1.0.0",
    author = "marlano",
}

-- UTILITIES
local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = 5
		})
	end)
end

local function loadScript(url)
	local success, src = pcall(game.HttpGet, game, url)
	if not success then
		notify("Loader ❌", "Gagal mengambil script:\n" .. tostring(src))
		return false
	end

	local fn, compileErr = loadstring(src)
	if not fn then
		notify("Loader ❌", "Gagal compile:\n" .. tostring(compileErr))
		warn("[Loader Error]:", compileErr)
		return false
	end

	local ok, runtimeErr = pcall(fn)
	if not ok then
		notify("Loader ❌", "Gagal dijalankan:\n" .. tostring(runtimeErr))
		warn("[Loader Runtime]:", runtimeErr)
		return false
	end

	return true
end

-- MAIN
local placeId = game.PlaceId
local loader = GameLoaders[placeId] or DefaultLoader

notify("Loader", "Memuat script: " .. loader.name)
loadScript(loader.url)
