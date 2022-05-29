---getPosition
---@return void
---@public
function API_Player:getPosition()
    return GetEntityCoords(PlayerPedId())
end