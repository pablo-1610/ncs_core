---getSessionData
---@param key string
---@return any
---@public
---@param self NCSCharacter
function NCSCharacter.getSessionData(self, key)
    return (self.sessionData[key])
end