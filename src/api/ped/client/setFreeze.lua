---setFreeze
---@param pedId number
---@param state boolean
---@return void
---@public
function API_Ped:setFreeze(pedId, state)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    
    FreezeEntityPosition(pedId, state)
end