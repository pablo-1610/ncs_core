API_Commands:registerPermissionCommand("revive", "canRevive", function(player, args)
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
    if (not (target.character.isDead == 1)) then
        return (player:showSystemNotification(_Literals.ERROR_PLAYER_NOT_DEAD, NCSEnum.LogType.ERROR))
    end

    local playerPed = GetPlayerPed(target.serverId)
    local coords = GetEntityCoords(playerPed)
	local formattedCoords = {
		position = vector3( coords[1], coords[2], coords[3] ),
		heading = 90.0
	}
	while (not formattedCoords) do 
		Wait(0)
	end

    NCSCharacter:setDeathStatus(target.serverId, 0, {})
    NCS:triggerClientEvent("playerIsNowAlive", _src, formattedCoords, target.character.skin) 
    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been revive"):format(target.serverId, target.name), 3)
end) 