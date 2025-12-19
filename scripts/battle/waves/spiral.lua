local Spiral, super = Class(Wave)

function Spiral:onStart()
    -- Kita pake counter sendiri biar aman
    self.counter = 0
    
    if Game.battle.soul.setMode then
        Game.battle.soul:setMode("red")
    end
end

function Spiral:update()
    -- Update counter tiap frame
    self.counter = self.counter + 1

    -- Spawn peluru tiap 5 frame
    if self.counter % 5 == 0 then
        -- PERBAIKAN DI SINI:
        -- Ganti self.arena jadi Game.battle.arena
        local x, y = Game.battle.arena:getCenter()
        
        local angle = self.counter / 6
        
        -- Spawn peluru 1
        self:spawnBullet("smallbullets", x, y, angle, 5)
        
        -- Spawn peluru 2   
        self:spawnBullet("smallbullets", x, y, angle + math.pi, 5)
    end

    super.update(self)
end

return Spiral