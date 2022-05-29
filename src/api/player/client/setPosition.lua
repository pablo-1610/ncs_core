---setPosition
---@param coords position
---@return void
---@public
function API_Player:setPosition(coords)
    SetEntityCoords(PlayerPedId(), coords)
end