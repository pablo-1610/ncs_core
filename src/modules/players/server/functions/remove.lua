---remove
---@param player NCSPlayer
function MOD_Players:remove(player)
    MOD_Players.list[player.serverId] = nil
    MOD_Players.listByIdentifier[player.identifier] = nil
end