---warpToCharacterCustomization
---@param requireSpawn boolean
---@public
---@param self NCSCharacter
function NCSCharacter.warpToCharacterCustomization(self, requireSpawn)
    self.user:triggerEvent("invokeCharacterCreator", requireSpawn)
end