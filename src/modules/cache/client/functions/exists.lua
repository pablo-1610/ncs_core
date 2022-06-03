---exists
---@param key string
---@return boolean
---@public
function MOD_Cache:exists(key)
    return (self.list[key] ~= nil)
end