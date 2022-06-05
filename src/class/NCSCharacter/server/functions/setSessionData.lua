---setSessionData
---@param key string
---@param value any
---@public
---@param self NCSCharacter
function NCSCharacter.setSessionData(self, key, value)
    self.sessionData[key] = value
end