---exists
---@param name string
---@return boolean
---@public
function MOD_Jobs:exists(name)
    return (self.list[name] ~= nil)
end