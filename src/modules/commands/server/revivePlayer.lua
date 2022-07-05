API_Commands:registerPermissionCommand("revive", "canRevive", function(player, args)
    local target = MOD_Players:get(args[1] == nil and player.serverId or args[1])
    if not target then
        return (player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR))
    end

    local playerPed = GetPlayerPed(target.serverId)
    local coords = GetEntityCoords(playerPed)
	local formattedCoords = {
		position = vector3(coords[1], coords[2], coords[3]),
		heading = 90.0
	}
	while (not formattedCoords) do 
		Wait(0)
	end

    target.character:setDeathStatus(0, {})
    MOD_Players:set(target.serverId, target)
    NCS:triggerClientEvent("playerIsNowAlive", target.serverId, formattedCoords, target.character.skin)
    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been revive"):format(target.serverId, target.name), 3)
end) 