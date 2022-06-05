---remove
---@param player NCSPlayer
---@return void
function MOD_Players:remove(player)
    MOD_Players.list[player.serverId] = nil
end