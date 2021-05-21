SLASH_TRACKIT1 = "/trackit"
SLASH_TRACKIT2 = "/ti"

local function TrackItHandler(name)
    -- Récupération classe + sort on hit --
    local class, englishClass = UnitClass("player")
    local tar = "/tar ".. name
    local spell = "/startattack"
    local spellByClass = {
        ["SHAMAN"] = "Horion de terre",
        ["MAGE"] = "Trait de flamme"
    }
    
    if(string.len(spellByClass[englishClass]) > 0) then
        spell = "/use " .. spellByClass[englishClass]
    end

    -- Création de la macro --
    local index = GetMacroIndexByName("TrackIt");
    if(index > 0) then
        local macroId = EditMacro(index, "TrackIt", "INV_MISC_QUESTIONMARK", tar .. "\n" .. spell, nil)
    else
        local macroId = CreateMacro("TrackIt", "INV_MISC_QUESTIONMARK", tar .. "\n" .. spell, nil)
    end
end

SlashCmdList["TRACKIT"] = TrackItHandler