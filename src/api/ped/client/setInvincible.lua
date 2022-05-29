---setInvincible
---@param pedId number
---@param state boolean
---@return void
---@public
function API_Ped:setInvincible(pedId, state)
    SetEntityInvincible(pedId, state)
end