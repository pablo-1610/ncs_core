API_Commands:registerPermissionCommand("kill", "canKill", function(player, args)
    local firstArgs <const> = args[1]
    local target <const> = MOD_Players:get(firstArgs == nil and player.serverId or firstArgs)
    if not target then
        player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR)
        return
    end

    target.character:setDeathStatus(1, {})
    MOD_Players:set(target.serverId, target)
    NCS:triggerClientEvent("playerIsNowDeath", target.serverId, target.character.deathData)
    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been killed"):format(target.serverId, target.name), 3)
end)