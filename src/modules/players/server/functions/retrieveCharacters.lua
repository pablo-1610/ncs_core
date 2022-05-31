---retrieveCharacters
---@param identifier string
---@param cb function
---@return void
---@public
function MOD_Players:retrieveCharacters(identifier, cb)
    local _src <const> = source
    local identifier <const> = API_Player:getIdentifier(_src)

    API_Database:query("SELECT * FROM ncs_players_characters WHERE player_identifier = @player_identifier", {["player_identifier"] = identifier}, function(result)
        cb(result)
    end)
end