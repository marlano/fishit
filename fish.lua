-- Fish It script v1.0
-- Author: Marllano

print("[Fish It] Script aktif di game:", game.Name)

local player = game.Players.LocalPlayer
local function autoFish()
	while task.wait(2) do
		print("[Fish It] Memancing otomatis untuk:", player.Name)
	end
end

task.spawn(autoFish)
