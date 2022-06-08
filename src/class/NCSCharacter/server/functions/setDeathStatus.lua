---setDeathStatus
---@param self NCSCharacter
---@param _src number
---@param deathStatus number
---@param deathData table
---@public
function NCSCharacter.setDeathStatus(self, deathStatus, deathData)
    self.isDead = deathStatus
    self.deathData = deathData
end