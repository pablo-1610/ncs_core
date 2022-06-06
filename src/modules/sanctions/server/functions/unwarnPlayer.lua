---unwarnPlayer
---@param warn_id string
---@param license string
---@return void
function MOD_Sanctions:unwarnPlayer(warn_id, license)
    if (not warn_id or not license) then
        NCS:trace("You need to specify a warn_id and a license.")
        return
    end
    local query <const> = ("DELETE FROM ncs_warns WHERE id = '%s' AND license = '%s'"):format(warn_id, license)
    API_Database:query(query, {}, function(result)
        if (not result) then
            NCS:trace(("Failed to delete warn for player %s."):format(license))
            return
        end
        NCS:trace(("Player %s unwarned."):format(license))

        MOD_Sanctions.List.Warns[warn_id] = nil
    end)
end