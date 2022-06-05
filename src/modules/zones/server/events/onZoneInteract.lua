NCS:registerNetEvent("zoneInteract", function(id)
    local _src <const> = source
    if (not (MOD_Players:exists(_src))) then
        return
    end
    ---@type NCSPlayer
    local player = MOD_Players:get(_src)
    if (not (MOD_Zones:exists(id))) then
        return MOD_AntiCheat:addInfraction(player, NCSEnum.AntiCheatInfractionsType.WRONG_ZONE_INTERACTION)
    end
    ---@type NCSZone
    local zone = MOD_Zones:get(id)
    if (not (player.character:isClose(zone.position, zone.interactDistance + 2.0))) then
        return MOD_AntiCheat:addInfraction(player, NCSEnum.AntiCheatInfractionsType.WRONG_ZONE_INTERACTION)
    end
    zone.handler(player)
end)