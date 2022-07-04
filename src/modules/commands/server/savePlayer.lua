API_Commands:registerConsoleCommand("save", function(_, args)
    local serverId = (tonumber(args[1]) or 0)

    if (not MOD_Players:exists(serverId)) then
        NCS:trace(("The player ^3%s^7 is not exist !"):format(serverId), NCSEnum.LogType.WARNING)
        return
    end
    NCSCharacter.save(MOD_Players:get(serverId).character, function(status)
        if (status == 0) then
            NCS:trace(("The player ^3%s^7 is not save !"):format(serverId), NCSEnum.LogType.ERROR)
            return
        end
        NCS:trace(("The player ^2%s^7 is save !"):format(serverId))
    end)
end, {"serverId"})