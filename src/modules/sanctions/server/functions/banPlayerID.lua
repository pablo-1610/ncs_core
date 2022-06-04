---banPlayerID
---@param playerSrc number
---@param reason string
---@param time table
---@return void
function MOD_Sanctions:banPlayerID(playerSrc, reason, time)
    if (not playerSrc or not reason or not time) then
        return
    end

    local license <const> = API_Player:getLicense(playerSrc)

    if (not license) then
        return
    end

    if (MOD_Sanctions:isPlayerBan(license)) then
        NCS.coreTrace(_, ("Player %s is already banned."):format(license))
        return
    end

    API_Player:kickPlayer(playerSrc, _Literals.BAN_DEFAULT_MESSAGE)

    MOD_Sanctions:banPlayer(license, reason, time)
end

RegisterCommand("ban", function(src, args)
    local playerSrc <const> = args[1]
    MOD_Sanctions:banPlayerID(playerSrc, "TEST", {
        ["hours"] = 2,
        ["minutes"] = 0,
        ["seconds"] = 0
    })
end)