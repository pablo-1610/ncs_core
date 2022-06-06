---warpToCharacterCustomization
---@param self NCSCharacter
---@param requireSpawn boolean
---@public
function NCSCharacter.warpToCharacterCustomization(self, requireSpawn)
    NCS:triggerEvent("playerWarpedToCharacterCreator", self.user.serverId, requireSpawn)
end