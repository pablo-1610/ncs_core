---remove
---@param key string
---@return void
---@public
function MOD_Cache:remove(key)
    self.list[key] = nil
end