---setCharacterByIdentifier
---@param characterId string
---@param callback function
---@public
function NCSPlayer:setCharacterByIdentifier(characterId, callback)
    API_Database:query("SELECT * FROM ncs_players_characters WHERE character_id = @character_id", {
        ["@character_id"] = characterId
    }, function(rows)
        if (#rows <= 0) then
            callback(false)
            return
        end
        local row <const> = rows[1]
        ---@type NCSCharacter
        local newCharacter = NCSCharacter(characterId, json.decode(row.identity), json.decode(row.skin), json.decode(row.accounts), json.decode(row.last_position), json.decode(row.metadata))
                :setUser(self)
        self:setCharacter(newCharacter, callback)
    end)
end