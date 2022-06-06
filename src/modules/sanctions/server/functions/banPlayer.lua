---banPlayer
---@param license string
---@param reason string
---@param time table
---@public
function MOD_Sanctions:banPlayer(license, reason, time)
    if (not license or not reason or not time) then
        return NCS:die("The player or the reason or the time is missing")
    end

    if (MOD_Sanctions:isPlayerBan(license)) then
        return NCS:die("The player is already banned")
    end

    time = API_Maths:unformatTime(time)
    time = API_Maths:addTimeToUnix(time)

    local query <const> = ("INSERT INTO ncs_bans (license, reason, time) VALUES ('%s', '%s', '%i')"):format(license, reason, time)
    API_Database:query(query, {}, function(result)
        if (not result) then
            NCS:trace(("Failed to insert ban for player %s."):format(license))
            return
        end
        MOD_Sanctions.List.Bans[license] = {
            ["id"] = result.insertId,
            ["license"] = license,
            ["reason"] = reason,
            ["time"] = time
        }
        NCS:trace(("Player %s banned."):format(license))
    end)
end