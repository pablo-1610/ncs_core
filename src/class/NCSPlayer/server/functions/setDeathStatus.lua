---setDeathStatus
---@param self NCSPlayer
---@param _src number
---@param deathStatus number
---@param deathData table
---@public
function NCSPlayer.setDeathStatus(self, _src, deathStatus, deathData)
    local player = MOD_Players:get(_src)
    player.isDead = deathStatus
    player.deathData = deathData
    MOD_Players:set(_src, player)
end