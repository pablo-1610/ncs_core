---getHeading
---@param pedId number
---@return number
---@public
function API_Ped:getHeading(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    return (GetEntityHeading(pedId))
end