-- File: scripts/battle/encounters/nowhere.lua


local NowhereEncounter, super = Class(Encounter)

function NowhereEncounter:init()
    super.init(self)

    -- Text Awal
    self.text = "* The smile watches you."
    
    -- Musik
    self.music = "tes1"
    
    -- Background
    self.background = true

    -- SPAWN MUSUH
    -- Parameter: addEnemy("nama_file_di_folder_enemies", posisi_x, posisi_y)
    -- Ini bakal manggil scripts/battle/enemies/nowhere.lua
    self:addEnemy("nowhere", 500, 200)
end

return NowhereEncounter