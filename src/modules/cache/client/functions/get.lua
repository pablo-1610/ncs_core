---get
---@param key string
---@return any
---@public
function MOD_Cache:get(key)
    return (self.list[key])
end