---remove
---@param id number
function MOD_Players:remove(id)
    self.list[id] = nil
end