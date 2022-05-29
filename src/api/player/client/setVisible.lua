---setVisible
---@param state boolean
---@return void
---@public
function API_Player:setVisible(state)
    SetEntityVisible(PlayerPedId(), state)
end