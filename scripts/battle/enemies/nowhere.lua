local Nowhere, super = Class(EnemyBattler)

function Nowhere:init()
    super.init(self)

    -- Identitas Musuh
    self.name = "Nowhere"
    
    -- set sprite musuh
    self:setActor("nowhere") 
    
    -- Status
    self.max_health = 1000
    self.health = 1000
    self.attack = 30
    self.defense = 10
    self.money = 19000000
    self.experience = 1998

    -- Daftar Serangan (Pastikan file wavensya ada di folder waves)
    self.waves = {
       
       
        "spear",
        "aiming",
        "movingareana",
        "circles",
        "sniper",
        "basic",
        "aiming"
    

    }

    -- Dialog Musuh (Acak setiap giliran)
    -- Digabung jadi satu table {} dipisah koma
    self.dialogue = {
        "Seems like you're a bit shocked.",
        "I'm not here, yet I'm everywhere.",
        "This timeline is unstable,\nI suggest you leave now.",
        "Error: Player found.",
        "Don't worry, being nowhere is quite peaceful.",
        "Do you think I'm just a sprite?"
    }

    -- Teks saat di-CHECK
    self.check = "AT 30 DF 10\n* Nowhere yet Everywhere.\n* Be Careful." 

    -- Teks Narasi (Flavor Text) di bawah layar
    self.text = {
        "* Don't underestimate Him.",
        "* Anything you do, you won't win.",
        "* The air feels like it doesn't exist.",
        "* You feel a cold stare from a direction that isn't there.",
        "* Nowhere is flickering like a broken lightbulb."
    }

    -- Teks saat HP sekarat
    self.low_health_text = "* You're Close!"

    -- Registrasi ACT (Pilihan Aksi)
    self:registerAct("Shine", "", {"susie", "ralsei"})
    self:registerAct("Break", "", {"susie"})
end

function Nowhere:onAct(battler, name)
    if name == "Shine" then
        -- Kasih Mercy 10%
        self:addMercy(10)
        -- Dialog khusus setelah ACT
        self.dialogue_override = "Huh, this kinda feels nice ^^"
        -- Teks narasi ACT
        return {
            "* You used Shine.[wait:5]\n* Nowhere is feeling something.",
            "* 9 more times."
        }
        
    elseif name == "Break" then
        -- Kasih Mercy 25%
        self:addMercy(25)
        self.dialogue_override = "Try your best I guess, haha..."
        return {
            "* You used Break.[wait:5]\n* Nowhere is feeling dizzy.",
            "* 3 more times."
        }

    elseif name == "Standard" then -- X-Action (ACT Standar Ralsei/Susie/Kris)
        self:addMercy(50)
        
        if battler.chara.id == "ralsei" then
            return "* Ralsei bowed politely.\n* Nowhere spiritually bowed in return."
        elseif battler.chara.id == "susie" then
            -- Kalau belum punya cutscene 'susie_punch', lebih aman pake teks aja dulu
            -- Game.battle:startActCutscene("dummy", "susie_punch") 
            return "* Susie punched the air aggressively!"
        else
            -- Teks buat karakter lain (Kris/Noelle)
            return "* " .. battler.chara:getName() .. " stared into the void."
        end
    end

    -- Jalankan fungsi ACT bawaan (seperti CHECK)
    return super.onAct(self, battler, name)
end

return Nowhere