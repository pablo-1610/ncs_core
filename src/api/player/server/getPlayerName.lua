---getName
---@param playerId number
---@return string
---@public
function API_Player:getName(playerId)
    if (playerId) then
        local name <const> = GetPlayerName(playerId)
        if (name) then
            return (name)
        end
    end
    _NCS:trace('Unable to find ID', 5)
    return (false)
end