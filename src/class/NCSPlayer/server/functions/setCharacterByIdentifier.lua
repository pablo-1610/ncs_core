---setCharacterByIdentifier
---@param characterId string
---@param callback function
---@public
---@param self NCSPlayer
function NCSPlayer.setCharacterByIdentifier(self, characterId, callback)
    API_Database:query("SELECT * FROM ncs_players_characters NATURAL JOIN ncs_inventories WHERE character_id = @character_id", {
        ["@character_id"] = characterId
    }, function(rows)
        if (#rows <= 0) then
            callback(false)
            return
        end
        local row <const> = rows[1]
        ---@type NCSCharacter
        local newCharacter = NCSCharacter(characterId, json.decode(row.identity), json.decode(row.skin), json.decode(row.last_position), json.decode(row.metadata), row.is_dead, json.decode(row.death_cause), {
            maxWeight = tonumber(row.max_weight),
            allowedContent = json.decode(row.allowed_content),
            accounts = json.decode(row.accounts),
            weapons = json.decode(row.weapons),
            items = json.decode(row.items)
        })

        newCharacter:setUser(self)
        self:setCharacter(newCharacter, callback)
    end)
end
