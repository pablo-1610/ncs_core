---setLastSource
---@param identifier string
---@param source number
---@public
function MOD_Players:setLastSource(identifier, source)
    API_Database:update("UPDATE ncs_players SET last_source = @last_source WHERE player_identifier = @player_identifier", {
        ["@last_source"] = source,
        ["@player_identifier"] = identifier
    })
end