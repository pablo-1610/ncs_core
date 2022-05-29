---setFreeze
---@param state boolean
---@return void
---@public
function API_Player:setFreeze(state)
    FreezeEntityPosition(PlayerPedId(), state)
end