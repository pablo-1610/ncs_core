
---save
---@public
---@param self NCSCharacter
---@param callback function
function NCSCharacter.save(self, callback)
    API_Database:update("UPDATE ncs_players_characters, ncs_inventories SET ncs_players_characters.skin = @skin, ncs_players_characters.is_dead = @is_dead, ncs_players_characters.death_cause = @death_cause, ncs_players_characters.job = @job, ncs_players_characters.job_grade = @job_grade, ncs_inventories.max_weight = @max_weight, ncs_inventories.allowed_content = @allowed_content, ncs_inventories.accounts = @accounts, ncs_inventories.weapons = @weapons, ncs_inventories.items = @items WHERE ncs_players_characters.character_id = @character_id and ncs_inventories.character_id = @character_id",{
        ["@character_id"] = self.id,
        ["@skin"] = json.encode(self.skin),
        ["@lastPosition"] = json.encode(self.lastPosition),
        ["@metadata"] = json.encode(self.metadata),
        ["@is_dead"] = self.isDead,
        ["@death_cause"] = json.encode(self.deathData),
        ["@job"] = self.job,
        ["@job_grade"] = self.job_grade,
        
        ["@max_weight"] = tonumber(self.inventory.maxWeight),
        ["@allowed_content"] = json.encode(self.inventory.allowedContent or {}),
        ["@accounts"] = json.encode(self.inventory.accounts),
        ["@weapons"] = json.encode(self.inventory.weapons),
        ["@items"] = json.encode(self.inventory.items),
    }, function(status)
        if (callback) then
            callback(status)
        end
    end)
end 


