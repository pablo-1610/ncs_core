---getSessionData
---@param key string
---@return any
---@public
function NCSCharacter:getSessionData(key)
    return (self.sessionData[key])
end