---warnPlayer
---@param license string
---@param reason string
---@return void
function MOD_Sanctions:warnPlayer(license, reason)
    local query <const> = ("INSERT INTO ncs_warns (license, reason, date) VALUES ('%s', '%s', '%i')"):format(license, reason, os.time())
    API_Database:query(query, {}, function(result)
        if (not result) then
            NCS:trace(("Failed to insert warn for player %s."):format(license))
            return
        end
        
        MOD_Sanctions.List.Warns[result.insertId] = {
            ["id"] = result.insertId,
            ["license"] = license,
            ["reason"] = reason,
            ["date"] = date
        }
        NCS:trace(("Player %s warned for reason %s."):format(license, reason))
    end)
end