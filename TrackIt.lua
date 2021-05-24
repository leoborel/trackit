SLASH_TRACKIT1 = "/trackit"
SLASH_TRACKIT2 = "/ti"

local function TrackItHandler(name)
    -- Récupération classe + sort on hit --
    local class, englishClass = UnitClass("player")
    local level = UnitLevel("player")
    local tar = "/tar ".. name
    local spell = "/startattack"
    local spellByClass = {
        ["SHAMAN"] = 8042, -- Earth Shock
        ["MAGE"] = 2136, -- Fire Blast
        ["ROGUE"] = 1752, -- Sinister Strike
        ["DRUID"] = 8921, -- Moonfire
        ["WARRIOR"] = 78, -- Heroic Strike
        ["PALADIN"] = 20271, -- Judgement
        ["WARLOCK"] = 1120, -- Drain Soul
        ["HUNTER"] = 2973, -- Raptor Strike
        ["PRIEST"] = 15407, -- Mind Flay
    }

    local idSpell = GetSpellInfo(spellByClass[englishClass]);

    if(string.len(idSpell) > 0) then
        name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(idSpell)
        isUsable, notEnoughMana = IsUsableSpell(idSpell)
        if(isUsable) then
            spell = "/use " .. name
        end
    end

    -- Création de la macro --
    local index = GetMacroIndexByName("TrackIt");
    if(index > 0) then
        local macroId = EditMacro(index, "TrackIt", "INV_MISC_QUESTIONMARK", "#showtooltips \n" .. tar .. "\n" .. spell, nil)
    else
        local macroId = CreateMacro("TrackIt", "INV_MISC_QUESTIONMARK", "#showtooltips \n" .. tar .. "\n" .. spell, nil)
    end
end

SlashCmdList["TRACKIT"] = TrackItHandler