---set
---@param id number
---@param player NCSPlayer
function MOD_Players:set(id, player)
    self.list[id] = player
end