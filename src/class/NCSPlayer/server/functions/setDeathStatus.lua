---setDeathStatus
---@param DeadStatus boolean
---@public
---@param self NCSPlayer
function NCSPlayer.setDeathStatus(self, source, DeadStatus, DeathData)
    self.isDead = DeadStatus
    self.deathData = DeathData
    
    is_dead = 0
    if DeadStatus then
        is_dead = 1
    end

    API_Database:query("UPDATE ncs_players SET is_dead = @is_dead WHERE player_identifier = @player_identifier ", {
        ["@is_dead"] = is_dead,
        ["@player_identifier"] = API_Player:getIdentifier(source),
    })
end