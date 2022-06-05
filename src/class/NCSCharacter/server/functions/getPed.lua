---getPed
---@param self NCSCharacter
---@return number
---@public
function NCSCharacter.getPed(self)
    return (GetPlayerPed(self.user.serverId))
end