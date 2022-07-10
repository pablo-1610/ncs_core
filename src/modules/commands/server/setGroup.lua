API_Commands:registerPermissionCommand({"setgroup", "setrole"}, "canSetGroup", function(player, args)
    if args[1] then
        return (player:showSystemNotification(_Literals.ERROR_NO_PLAYER_ID, NCSEnum.LogType.ERROR))
    end

    local serverId = tonumber(args[1])

    if (not MOD_Players:exists(serverId)) then
        return (player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR))
    end
    local target = MOD_Players:get(serverId)

    if not args[2] then
        return (player:showSystemNotification(_Literals.ERROR_RANK_NOT_PRECISE, NCSEnum.LogType.ERROR))
    end

    if not MOD_Jobs:exists(args[2]) then
        return (player:showSystemNotification(_Literals.ERROR_MISSING_RANK, NCSEnum.LogType.ERROR))
    end

    target:setRole(args[2])
end, { "serverId", "roleName" })