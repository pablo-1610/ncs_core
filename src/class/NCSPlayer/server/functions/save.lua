---save
---@public
function NCSPlayer:save()
    API_Database:query("UPDATE ncs_players SET role_identifier = @role_identifier WHERE player_identifier = @player_identifier", {
        ["@role_identifier"] = self.role.identifier,
        ["@player_identifier"] = self.identifier
    })
end