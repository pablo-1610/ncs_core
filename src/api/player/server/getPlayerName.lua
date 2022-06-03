---getName
---@param playerId number
---@return string
---@public
function API_Player:getName(playerId)
    if (playerId) then
        ---@type string
        local name <const> = GetPlayerName(playerId)
        if (name) then
            return (name)
        end
    end
    _NCS:die("Unable to find ID")
end