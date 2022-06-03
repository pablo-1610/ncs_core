---remove
---@param player NCSPlayer
function MOD_Players:remove(player)
    MOD_Players.list[player.serverId] = nil
end