---initialize
---@param requireSpawn boolean
---@public
---@param self NCSCharacter
function NCSCharacter.initialize(self, requireSpawn)
    local spawnLocation = (self.lastPosition and self.lastPosition or (NCSInternal.DefaultSpawn and NCSInternal.DefaultSpawn or NCSConstant.DefaultSpawn))
    self.user:triggerEvent("initializeCharacter", requireSpawn, spawnLocation, self:minify())
end