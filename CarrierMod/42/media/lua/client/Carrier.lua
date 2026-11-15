local Config = {
    Sickness_Amount = 30,
    Sickness_Chance = 20
}

local function InfectionImmunity(player)
    local player = getPlayer()
    local stats = player:getStats()

    if player:hasTrait(CarrierTrait.Carrier) and
        stats:get(CharacterStat.ZOMBIE_INFECTION) > 0 then
        stats:set(CharacterStat.ZOMBIE_INFECTION, 0)
        stats:set(CharacterStat.ZOMBIE_FEVER, 0)
        return
    end
end

local function RandomSickness(player)
    if ZombRand(100) >= Config.Sickness_Chance then
        return
    end
end

Events.EveryOneMinute.Add(function()
    local player = getPlayer()
    if player then 
        InfectionImmunity(player)
    end
end)

Events.EveryDays.Add(function()
    local player = getPlayer()
    if player then
        RandomSickness(player)
    end
end)