---getHealth
---@param pedId number
---@return number
---@public
function API_Ped:setAlpha(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    return (GetEntityHealth(pedId))
end