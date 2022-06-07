---set
---@param id number
---@param player NCSPlayer
function MOD_Players:set(id, player)
    MOD_Players.list[id] = player
    MOD_Players.listByIdentifier[player.identifier] = player
end