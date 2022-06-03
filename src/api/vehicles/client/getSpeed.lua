---getSpeed
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getSpeed(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    ---@type number
    local speed <const> = (GetEntitySpeed(vehicleId) * 3.6) --Set speed to km/h
    return (speed)
end
