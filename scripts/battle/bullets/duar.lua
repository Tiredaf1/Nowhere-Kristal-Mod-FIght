
local Duar, super = Class(Bullet)

function Duar:init(x, y, dir, speed)
    -- Panggil gambar di assets/sprites/battle/bullets/duar.png
-- Hapus kata "battle/" karena di folder lu emang gak ada folder itu
super.init(self, x, y, "bullets/duar")
    -- Set damage biar Kris bisa berkurang darahnya
    self.damage = 10
    
    -- Fisika peluru
    self.physics.direction = dir or 0
    self.physics.speed = speed or 8
    
    -- Supaya gak langsung ilang pas spawn di luar layar
    self.remove_offscreen = false
end

return Duar