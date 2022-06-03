---getHealth
---@param pedId number
---@return number
---@public
function API_Ped:getHealth(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    return (GetEntityHealth(pedId))
end