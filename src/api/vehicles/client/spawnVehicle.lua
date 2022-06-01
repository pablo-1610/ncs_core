---spawn
---@param modelName string
---@param coords table<number, number, number>
---@param heading number
---@param clientSide? boolean
---@return void
---@public
function API_Vehicles:spawn(modelName, coords, heading, clientSide)
    assert(type(modelName) == "string" or type(modelName) == "number")
    if type(modelName) == "string" then
        modelName = GetHashKey(modelName)
    end
    local Return_Model = API_Streaming:requestModel(modelName)
    while (not Return_Model) do
        Wait(0)
    end
    
    if (Return_Model == modelName) then
        local vehicle = CreateVehicle(modelName, coords, heading, not (clientSide), 0)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0)
        SetVehicleOnGroundProperly(vehicle)
        SetEntityHeading(vehicle, heading)
        SetEntityAsMissionEntity(vehicle, 1, 1)
        SetModelAsNoLongerNeeded(vehicle)
        return (vehicle)
    end
end
