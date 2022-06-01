---retrieveCharacters
---@param identifier string
---@param cb function
---@public
function MOD_Players:retrieveCharacters(identifier, cb)
    API_Database:query("SELECT * FROM ncs_players_characters WHERE player_identifier = @player_identifier", {["player_identifier"] = identifier}, function(result)
        cb(result)
    end)
end