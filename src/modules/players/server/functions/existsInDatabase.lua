---existsInDatabase
---@param identifier string
---@param callback function
---@return void
---@public
function MOD_Players:existsInDatabase(identifier, callback)
    API_Database:query("SELECT 1 FROM ncs_players WHERE player_identifier = @player_identifier", {
        ["player_identifier"] = identifier
    }, function(rows)
        callback(#rows > 0)
    end)
end