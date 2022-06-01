---register
---@param identifier string
---@param callback function
---@public
function MOD_Players:register(identifier, callback)
    API_Database:insert("INSERT INTO ncs_players (player_identifier) VALUES (@player_identifier)", {
        ["player_identifier"] = identifier
    }, function()
        if (callback) then
            callback()
        end
    end)
end