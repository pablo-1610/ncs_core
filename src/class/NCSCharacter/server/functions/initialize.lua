---initialize
---@param requireSpawn boolean
---@public
function NCSCharacter:initialize(requireSpawn)
    local spawnLocation = (self.lastPosition and self.lastPosition or NCSConstant.DefaultSpawn)
    self.user:triggerEvent("initializeCharacter", requireSpawn, spawnLocation, self:minify())
end