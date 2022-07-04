---save
---@public
---@param self NCSCharacter
function NCSCharacter.save(self)
    API_Database:update("UPDATE ncs_players_characters SET skin = @skin, is_dead = @is_dead, death_cause = @death_cause, job = @job, job_grade = @job_grade WHERE character_id = @character_id", {
        ["@character_id"] = self.id,
        ["@skin"] = json.encode(self.skin),
        ["@job"] = self.job,
        ["@job_grade"] = self.job_grade,
        ["@accounts"] = json.encode(self.accounts),
        ["@lastPosition"] = json.encode(self.lastPosition),
        ["@metadata"] = json.encode(self.metadata),
        ["@is_dead"] = self.isDead,
        ["@death_cause"] = json.encode(self.deathData)
    })
end 
