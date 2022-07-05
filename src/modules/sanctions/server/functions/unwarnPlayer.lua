---unwarnPlayer
---@param warnId string
---@param license string
---@return void
function MOD_Sanctions:unwarnPlayer(warnId, license)
    if (not warnId or not license) then
        NCS:trace("You need to specify a warnId and a license.")
        return
    end

    local query <const> = ("DELETE FROM ncs_warns WHERE id = '%s' AND license = '%s'"):format(warnId, license)
    API_Database:query(query, {}, function(result)
        if (not result) then
            NCS:trace(("Failed to delete warn for player %s."):format(license))
            return
        end
        
        NCS:trace(("Player %s unwarned."):format(license))

        MOD_Sanctions.List.Warns[warnId] = nil
    end)
end