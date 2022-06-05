---set
---@param id number
---@param player NCSPlayer
---@return void
function MOD_Players:set(id, player)
    self.list[id] = player
end