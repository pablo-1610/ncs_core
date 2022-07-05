API_Commands:registerPermissionCommand("setjob", "canSetJob", function(player, args)
    local firstArgs <const> = args[1]
    local secondArgs <const> = args[2]
    local thirdArgs <const> = args[3]
    if not firstArgs then
        player:showSystemNotification(_Literals.ERROR_NO_PLAYER_ID, NCSEnum.LogType.ERROR)
        return
    end 
    
    local target <const> = MOD_Players:get(firstArgs)
    if not target then
        player:showSystemNotification(_Literals.TYPE_ERROR, NCSEnum.LogType.ERROR)
        return
    end

    local job <const> = MOD_Jobs:get(secondArgs)
    if not job then
        player:showSystemNotification(_Literals.ERROR_JOB_NOT_EXIST, NCSEnum.LogType.ERROR)
        return
    end

    target.character:setJob(secondArgs)
    if thirdArgs then 
        if not job.grades[thirdArgs] then
            player:showSystemNotification(_Literals.ERROR_JOB_GRADE_NOT_EXIST, NCSEnum.LogType.ERROR)
            return
        end

        target.character:setJobGrade(thirdArgs)
        NCS:trace(("Player id ^2%s ^7(^2%s^7) setjob to %s grade %s"):format(target.serverId, target.name, secondArgs, thirdArgs), 3)
    else
        NCS:trace(("Player id ^2%s ^7(^2%s^7) setjob to %s"):format(target.serverId, target.name, secondArgs), 3)
    end
end)