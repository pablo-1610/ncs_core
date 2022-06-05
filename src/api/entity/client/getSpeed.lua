---getSpeed
---@param entityId number
---@return number
---@public
function API_Vehicles:getSpeed(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    ---@type number
    local speed <const> = (GetEntitySpeed(entityId) * 3.6) --Set speed to km/h
    return (speed)
end
