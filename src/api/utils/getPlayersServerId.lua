local PlayersServerId = {}

---getPlayersServerId
---@return void
---@public
function _NCS:getPlayersServerId()
    for k, v in pairs(GetActivePlayers()) do 
        local found = false
        for _, id in paurs(PlayersServerId) do 
            if GetPlayerServerId(v) == id then
                found = true
            end
        end
        if not found then
            table.insert(PlayersServerId, GetPlayerServerId(v))
        end
    end
end