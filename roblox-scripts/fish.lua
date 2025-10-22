-- Fish It script v1.0

print("[Fish.lua] Script berhasil dijalankan!")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Fish.lua",
    Text = "Script berhasil dijalankan!",
    Duration = 5
})

print("[Fish It] Script aktif di game:", game.Name)

local player = game.Players.LocalPlayer

while task.wait(2) do
    print("[Fish It] Memancing otomatis untuk:", player.Name)
end
