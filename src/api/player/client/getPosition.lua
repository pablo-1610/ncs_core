---getPosition
---@return table
---@public
function API_Player:getPosition()
    return GetEntityCoords(PlayerPedId())
end