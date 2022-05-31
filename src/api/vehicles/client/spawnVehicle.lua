---spawn
---@param modelName string
---@param coords table<number, number, number>
---@param heading number
---@param callback? function
---@param clientSide? boolean
---@return void
---@public
function API_Vehicles:spawn(modelName, coords, heading, callback, clientSide)
    assert(type(modelName) == "string" or type(modelName) == "number")
    if type(modelName) == "string" then
        modelName = GetHashKey(modelName)
    end

    if (not (IsModelInCdimage(modelName))) then
        return _NCS:die("Model not found: " .. modelName)
    end
    RequestModel(modelName)
    while (not (HasModelLoaded(modelName))) do
        Wait(1)
    end
    local vehicle = CreateVehicle(modelName, coords, heading, not (clientSide), 0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityHeading(vehicle, heading)
    SetEntityAsMissionEntity(vehicle, 1, 1)
    if callback ~= nil then
        callback(vehicle)
    end
    SetModelAsNoLongerNeeded(vehicle)
end
