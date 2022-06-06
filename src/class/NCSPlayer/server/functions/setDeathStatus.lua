---setDeathStatus
---@param DeadStatus boolean
---@public
---@param self NCSPlayer
function NCSPlayer.setDeathStatus(self, source, DeadStatus, DeathData)
    self.isDead = DeadStatus
    self.deathData = DeathData
    
    API_Database:query("UPDATE ncs_players SET is_dead = @is_dead WHERE player_identifier = @player_identifier ", {
        ["@is_dead"] = (DeadStatus and 1 or 0),
        ["@player_identifier"] = API_Player:getIdentifier(source),
    })
end