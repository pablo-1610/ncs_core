API_Commands:registerPermissionCommand("revive", "canRevive", function(player, args)
    local firstArgs <const> = args[1]
    local target <const> = MOD_Players:get(firstArgs == nil and player.serverId or firstArgs)
    if not target then
        player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR)
        return
    end

    local playerPed <const> = GetPlayerPed(target.serverId)
    local coords <const> = GetEntityCoords(playerPed)
	local formattedCoords <const> = {
		position = vector3(coords.x, coords.y, coords.z),
		heading = 90.0
	}

    target.character:setDeathStatus(0, {})
    MOD_Players:set(target.serverId, target)
    NCS:triggerClientEvent("playerIsNowAlive", target.serverId, formattedCoords, target.character.skin)
    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been revive"):format(target.serverId, target.name), 3)
end) 