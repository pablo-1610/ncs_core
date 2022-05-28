---exists
---@param id number
---@return boolean
---@public
function MOD_Players:exists(id)
    return (self.list[id] ~= nil)
end