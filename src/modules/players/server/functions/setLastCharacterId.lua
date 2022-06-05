---setLastCharacterId
---@param identifier string
---@param characterId number
---@return void
function MOD_Players:setLastCharacterId(identifier, characterId)
    API_Database:query("UPDATE ncs_players SET last_character_id = @last_character_id WHERE player_identifier = @player_identifier", {
        ["@last_character_id"] = characterId,
        ["@player_identifier"] = identifier
    })
end