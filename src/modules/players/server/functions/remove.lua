---remove
---@param id number
---@public
---@return void
function MOD_Players:remove(id)
    self.list[id] = nil
end
