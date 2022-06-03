---set
---@param key string
---@param value any
---@public
function MOD_Cache:set(key, value)
    self.list[key] = value
end