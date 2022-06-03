---getSpeed
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getSpeed(vehicleId)
    if (vehicleId) then
        ---@type number
        local speed <const> = (GetEntitySpeed(vehicleId) * 3.6) --Set speed to km/h
        return (speed)
    end
    NCS:trace("Unable to find vehicle", 1)
end
