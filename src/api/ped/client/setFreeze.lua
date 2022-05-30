---setFreeze
---@param pedId number
---@param state boolean
---@return void
---@public
function API_Ped:setFreeze(pedId, state)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end    
    
    FreezeEntityPosition(pedId, state)
end