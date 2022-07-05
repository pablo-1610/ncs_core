---unbanPlayer
---@param license string
---@param ban_id string
---@public
function MOD_Sanctions:unbanPlayer(license, ban_id)
    if (not license or not ban_id) then
        NCS:die("The license or id of the ban is missing")
        return
    end

    if (not MOD_Sanctions:isPlayerBan(license)) then
        NCS:die("This player is not banned")
        return
    end

    API_Database:query("DELETE FROM ncs_bans WHERE license = ? AND id = ?", {license, ban_id}, function(result)
        if (result) then
            NCS:trace(("Player %s unbanned."):format(license))
            self.List.Bans[license] = nil
        end
    end)
end