---banPlayerID
---@param playerSrc number
---@param reason string
---@param time table
---@public
function MOD_Sanctions:banPlayerID(playerSrc, reason, time)
    if (not playerSrc or not reason or not time) then
        NCS:die("The player or the reason or the time is missing")
        return
    end

    local license <const> = API_Player:getLicense(playerSrc)
    if (not license) then
        return
    end

    if (MOD_Sanctions:isPlayerBan(license)) then
        NCS:die("The player is already banned")
        return
    end

    API_Player:kick(playerSrc, _Literals.BAN_DEFAULT_MESSAGE)

    MOD_Sanctions:banPlayer(license, reason, time)
end