---setFreeze
---@param pedId number
---@param state boolean
---@return void
---@public
function API_Ped:setFreeze(pedId, state)
    FreezeEntityPosition(pedId, state)
end