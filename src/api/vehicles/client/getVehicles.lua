---getVehicles
---@return table
---@public
function API_Vehicles:getVehicles()
    return GetGamePool("CVehicle")
end