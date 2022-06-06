---exists
---@param name string
---@return boolean
---@public
function MOD_Items:exists(name)
    return (self.list[name] ~= nil)
end