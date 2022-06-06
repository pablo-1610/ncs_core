---warnPlayer
---@param license string
---@param reason string
---@return void
function MOD_Sanctions:warnPlayer(license, reason)
    local warn_id <const> = ("WARN-%s-%s"):format(API_Strings:randomString(3), API_Strings:randomString(5))

    local query <const> = ("INSERT INTO ncs_warns (warn_id, license, reason, date) VALUES ('%s', '%s', '%s', '%i')"):format(warn_id, license, reason, os.time())
    API_Database:query(query, {}, function(result)
        if (not result) then
            NCS:trace(("Failed to insert warn for player %s."):format(license))
            return
        end
        MOD_Sanctions.List.Warns[warn_id] = {
            ["warn_id"] = warn_id,
            ["license"] = license,
            ["reason"] = reason,
            ["date"] = date
        }
        NCS:trace(("Player %s warned for reason %s."):format(license, reason))
    end)
end