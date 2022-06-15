---clonePed
---@param pedId number
---@param heading number
---@param isNetwork boolean
---@param keepVariation boolean
---@return clonedPed entity
---@public
function API_Ped:clonePed(pedId, heading, isNetwork, keepVariation)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    return (ClonePed(pedId, heading, isNetwork, keepVariation))
end