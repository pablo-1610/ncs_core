---save
---@public
---@param self NCSPlayer
function NCSPlayer.save(self)
    API_Database:query("UPDATE ncs_players SET role_identifier = @role_identifier WHERE player_identifier = @player_identifier", {
        ["@role_identifier"] = self.role.identifier,
        ["@player_identifier"] = self.identifier,
        ["@is_dead"] = self.isDead,
        ["@death_data"] = json.encode(self.deathData)
    })
end