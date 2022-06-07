---setDeathStatus
---@param self NCSCharacter
---@param _src number
---@param deathStatus number
---@param deathData table
---@public
function NCSCharacter.setDeathStatus(self, _src, deathStatus, deathData)
    local player = MOD_Players:get(_src)

    self.isDead = deathStatus
    self.deathData = deathData

    player.character.isDead = deathStatus
    player.character.deathData = deathData

    MOD_Players:set(_src, player)
end