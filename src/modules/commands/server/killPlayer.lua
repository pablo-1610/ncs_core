API_Commands:registerPermissionCommand("kill", "canKill", function(player, args)
    local target
    if args[1] == nil then
        target = MOD_Players:get(player.serverId) 
    else 
        local targetid = tonumber(args[1])
        target = MOD_Players:get(targetid) 
    end
    if not target then
        return (player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR))
    end
    if (not (target.isDead == 0)) then
        return (player:showSystemNotification(_Literals.ERROR_PLAYER_ALREADY_DEAD, NCSEnum.LogType.ERROR))
    end

    NCSPlayer:setDeathStatus(target.serverId, 1, {})
    NCS:triggerClientEvent("ncs_core:killPlayer", target.serverId, playerPed)
    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been killed"):format(target.serverId, target.name), 3)
end)