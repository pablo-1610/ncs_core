---delete
---@param id number
---@public
function MOD_Zones:delete(id)
    self.list[id] = nil
    self.drawing[id] = nil
end