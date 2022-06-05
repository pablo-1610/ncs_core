---warnPlayerID
---@param playerSrc number
---@param reason string
---@public
function MOD_Sanctions:warnPlayerID(playerSrc, reason)
    if (not playerSrc or not reason) then
        return NCS:die("The player or the reason missing")
    end

    local license <const> = API_Player:getLicense(playerSrc)
    if (not license) then
        return
    end

    MOD_Sanctions:warnPlayer(license, reason, time)
end