---save
---@public
---@param self NCSCharacter
function NCSCharacter.save(self)
    API_Database:query("UPDATE ncs_players_characters SET skin = @skin WHERE character_id = @character_id", {
        ["@character_id"] = self.id,
        ["@skin"] = json.encode(self.skin)
    })
end