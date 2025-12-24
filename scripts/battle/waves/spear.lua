local Tombak, super = Class(Wave)

function Tombak:onStart()
    -- Pastikan soul merah
    if Game.battle.soul.setMode then
        Game.battle.soul:setMode("red")
    end

    -- Spawn tombak setiap 0.5 detik
    self.timer:every(0.3, function()
        
        -- 1. Pilih sisi acak
        local side = Utils.pick{"top", "bottom", "left", "right"}
        
        local x, y
        local arena = Game.battle.arena
        local offset = 60 

        -- Tentukan koordinat
        if side == "top" then
            x = Utils.random(arena.left, arena.right)
            y = arena.top - offset
        elseif side == "bottom" then
            x = Utils.random(arena.left, arena.right)
            y = arena.bottom + offset
        elseif side == "left" then
            x = arena.left - offset
            y = Utils.random(arena.top, arena.bottom)
        elseif side == "right" then
            x = arena.right + offset
            y = Utils.random(arena.top, arena.bottom)
        end

        -- 2. Hitung Sudut (Ngeker)
        local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

        -- 3. SPAWN TOMBAK
        local tombak = self:spawnBullet("bullets/tombak", x, y)




       if tombak then
            
            -- Visual
            tombak.alpha = 1
            tombak.color = {1, 1, 1}
            tombak.layer = BATTLE_LAYERS["above_arena"] -- Tetap di atas
            
            -- Sesuaikan ukuran (Karena gambar lu 60px, kita kecilin)
            tombak.scale_x = 0.5
            tombak.scale_y = 0.5
            tombak.graphics.filter = "nearest"

            -- Settingan Fisika
            tombak.rotation = angle             
            tombak.physics.direction = angle    
            tombak.physics.speed = 9            
        end
    end)
end

function Tombak:update()
    super.update(self)
end

return Tombak