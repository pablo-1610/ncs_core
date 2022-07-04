API_Commands:registerPermissionCommand("giveAccountMoney", "canGiveAccountMoney", function(_, args)
    local serverId, accountType, count = (tonumber(args[1]) or 0), (tonumber(args[2]) or 1), (tonumber(args[3]) or 0)

    if (not MOD_Players:exists(serverId)) then
        NCS:trace(("The player ^3%s^7 is not exist !"):format(serverId), NCSEnum.LogType.WARNING)
        return
    end

    local character = MOD_Players:get(serverId).character

    character:giveAccount(accountType, count, function(code)
        if (code ~= NCSEnum.AccountErrorType.SUCCESS) then
            NCS:trace(("The player ^2%s^7 has not received the money !\nError code : ^1%s^7"):format(serverId, NCSEnum._getAccountErrorType(code)), NCSEnum.LogType.WARNING)
            return
        end

        NCS:trace(("The player ^2%s^7 received the $%s '^3%s^7' !"):format(serverId, code, NCSEnum._getAccountLabel(accountType)))
    end)

end, {"serverId", "accountType 1 : Cash; 2 : DirtyCash ", "count"})