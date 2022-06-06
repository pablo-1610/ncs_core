---exists
---@param id number
---@return boolean
---@public
function MOD_Players:exists(id)
    return (MOD_Players.list[id] ~= nil)
end