---getPlayersServerId
---@return void
---@public
function _NCS:getActivePlayers()
    local ActivePlayers = {}
    for k, v in pairs(GetActivePlayers()) do 
        local found = false
        for _, id in paurs(PlayersServerId) do 
            if GetPlayerServerId(v) == id then
                found = true
            end
        end
        if not found then
            table.insert(ActivePlayers, GetPlayerServerId(v))
        end
    end
    return(ActivePlayers)
end