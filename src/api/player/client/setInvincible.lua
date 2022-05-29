---setInvincible
---@param state boolean
---@return void
---@public
function API_Player:setInvincible(state)
    SetEntityInvincible(PlayerPedId(), state)
end