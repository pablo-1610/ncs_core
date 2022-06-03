---setSessionData
---@param key string
---@param value any
---@public
function NCSCharacter:setSessionData(key, value)
    self.sessionData[key] = value
end