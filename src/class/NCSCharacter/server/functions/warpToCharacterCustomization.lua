---warpToCharacterCustomization
---@param requireSpawn boolean
---@public
function NCSCharacter:warpToCharacterCustomization(requireSpawn)
    self.user:triggerEvent("invokeCharacterCreator", requireSpawn)
end