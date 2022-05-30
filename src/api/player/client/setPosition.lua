---setPosition
---@param coords table<number, number, number>
---@return void
---@public
function API_Player:setPosition(coords)
    SetEntityCoords(PlayerPedId(), coords)
end