---isPlayerBan
---@param license string
---@return boolean
function MOD_Sanctions:isPlayerBan(license)
    if (not license) then
        return (false)
    end

    if (self.List.Bans[license]) then
        return (true)
    end

    return (false)
end