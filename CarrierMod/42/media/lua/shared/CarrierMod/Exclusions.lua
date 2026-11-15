local function excludeWithCarrier(vanillatrait)
    local def = CharacterTraitDefinition.getCharacterTraitDefinition(vanillatrait)
    local list = def:getMutuallyExclusiveTraits()
    if not list:contains(CarrierTrait.trait) then
        list:add(CarrierTrait.trait)
    end
end

Events.OnGameBoot.Add(function()
    excludeWithCarrier(CharacterTrait.INCONSPICUOUS)
    excludeWithCarrier(CharacterTrait.SLOW_HEALER)
    excludeWithCarrier(CharacterTrait.RESILIENT)
end)