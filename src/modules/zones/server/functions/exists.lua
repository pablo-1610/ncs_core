---exists
---@param id string
---@public
function MOD_Zones:exists(id)
    return (self.list[id] ~= nil)
end