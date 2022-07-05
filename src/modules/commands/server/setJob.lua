API_Commands:registerPermissionCommand("setjob", "canSetJob", function(player, args)
    if not args[1] then
        return (player:showSystemNotification(_Literals.ERROR_NO_PLAYER_ID, NCSEnum.LogType.ERROR))
    end 
    
    local target = MOD_Players:get(args[1])
    if not target then
        return (player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR))
    end

    local job = MOD_Jobs:get(args[2])
    if not job then
        return (player:showSystemNotification(_Literals.ERROR_JOB_NOT_EXIST, NCSEnum.LogType.ERROR))
    end

    target.character:setJob(args[2])
    
    if args[3] then 
        if not MOD_Jobs:get(args[2]).grades[args[3]] then
            return (player:showSystemNotification(_Literals.ERROR_JOB_GRADE_NOT_EXIST, NCSEnum.LogType.ERROR))
        end
        target.character:setJobGrade(args[3])
        NCS:trace(("Player id ^2%s ^7(^2%s^7) setjob to %s grade %s"):format(target.serverId, target.name, args[2], args[3]), 3)
    else
        NCS:trace(("Player id ^2%s ^7(^2%s^7) setjob to %s"):format(target.serverId, target.name, args[2]), 3)
    end
end)