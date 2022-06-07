---save
---@public
---@param self NCSCharacter
function NCSCharacter.save(self)
    API_Database:update("UPDATE ncs_players_characters SET skin = @skin, is_dead = @is_dead WHERE character_id = @character_id", {
        ["@character_id"] = self.id,
        ["@skin"] = json.encode(self.skin),
        ["@accounts"] = json.encode(self.accounts),
        ["@lastPosition"] = json.encode(self.lastPosition),
        ["@metadata"] = json.encode(self.metadata),
        ["@is_dead"] = self.isDead,
        ["@death_cause"] = json.encode(self.deathData)
    })
end 
