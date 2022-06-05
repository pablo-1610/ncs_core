---sessionDataExists
---@param key string
---@return boolean
---@public
---@param self NCSCharacter
function NCSCharacter.sessionDataExists(self, key)
    return (self.sessionData[key] ~= nil)
end