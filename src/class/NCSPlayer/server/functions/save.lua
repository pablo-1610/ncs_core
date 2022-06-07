---save
---@public
---@param self NCSPlayer
function NCSPlayer.save(self)
    API_Database:update("UPDATE ncs_players SET role_identifier = @role_identifier WHERE player_identifier = @player_identifier", {
        ["@role_identifier"] = self.role.identifier,
        ["@player_identifier"] = self.identifier
    })
end