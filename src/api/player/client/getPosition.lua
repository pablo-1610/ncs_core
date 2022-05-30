---getPosition
---@return table<number, number, number>
---@public
function API_Player:getPosition()
    return GetEntityCoords(PlayerPedId())
end