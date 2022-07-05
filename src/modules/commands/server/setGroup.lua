API_Commands:registerPermissionCommand({"setgroup", "setrole"}, "canSetGroup", function(player, args)
    local target
    if not args[1] then
        return (player:showSystemNotification(_Literals.ERROR_NO_PLAYER_ID, NCSEnum.LogType.ERROR))
    else 
        local targetid = tonumber(args[1])
        target = MOD_Players:get(targetid)
    end
    if not target then
        return (player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR))
    end
    if not args[2] then
        return (player:showSystemNotification(_Literals.ERROR_RANK_NOT_PRECISE, NCSEnum.LogType.ERROR))
    end
    if not MOD_Jobs:exists(args[2]) then
        return (player:showSystemNotification(_Literals.ERROR_MISSING_RANK, NCSEnum.LogType.ERROR))
    end

    target:setRole(args[2])
end)