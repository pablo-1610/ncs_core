---sessionDataExists
---@param key string
---@return boolean
---@public
function NCSCharacter:sessionDataExists(key)
    return (self.sessionData[key] ~= nil)
end