-- MARLANO Custom Loader v1.0

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
	local success, result = pcall(function()
		local src = game:HttpGet(url)
		local fn = loadstring(src)
		if fn then fn() return true else error("compile fail") end
	end)

	if not success then
		warn("[Loader Error]:", result)
		notify("Loader ❌", "Gagal memuat script.")
		return false
	end

	return true
end

-- MAIN
local placeId = game.PlaceId
local loader = GameLoaders[placeId] or DefaultLoader

notify("Loader", "Memuat script: " .. loader.name)
loadScript(loader.url)
