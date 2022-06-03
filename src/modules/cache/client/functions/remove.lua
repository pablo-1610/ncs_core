---remove
---@param key string
---@public
function MOD_Cache:remove(key)
    self.list[key] = nil
end