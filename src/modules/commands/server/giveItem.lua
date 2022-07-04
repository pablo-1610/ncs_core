API_Commands:registerPermissionCommand("giveItem", "canGiveItem", function(_, args)
    local serverId, itemName, itemCount = (tonumber(args[1]) or 0), args[2], (tonumber(args[3]) or 1)

    if (not MOD_Players:exists(serverId)) then
        NCS:trace(("The player ^3%s^7 is not exist !"):format(serverId), NCSEnum.LogType.WARNING)
        return
    end

    local character = MOD_Players:get(serverId).character

    character:giveItem(itemName, itemCount, function(code)
        if (code ~= NCSEnum.AccountErrorType.SUCCESS) then
            NCS:trace(("The player ^2%s^7 has not received the item\nError code : ^1%s^7"):format(serverId, NCSEnum._getItemErrorType(code)))
            return
        end

        NCS:trace(("The player ^2%s^7 received the ^2%s %s^7 !"):format(serverId, itemCount, itemName), NCSEnum.LogType.WARNING)
    end)

end, {"serverId", "itemName", "itemCount"})