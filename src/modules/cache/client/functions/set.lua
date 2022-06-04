---set
---@param key string
---@param value any
---@public
function MOD_Cache:set(key, value)
    NCS:triggerEvent("cacheSet", key, (self.list[key] == nil))
    self.list[key] = value
end