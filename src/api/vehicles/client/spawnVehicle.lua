---spawn
---@param modelName string
---@param coords table
---@param heading number
---@param cb function
---@public
function API_Vehicles:spawn(modelName, coords, heading, cb, clientSide)
    local model = GetHashKey(modelName)
    if (not (IsModelInCdimage(model))) then
        return
    end
    RequestModel(model)
    while (not (HasModelLoaded(model))) do
        Wait(1)
    end
    local vehicle = CreateVehicle(model, coords, heading, not (clientSide), 0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityHeading(vehicle, heading)
    SetEntityAsMissionEntity(vehicle, 1, 1)
    if cb ~= nil then
        cb(vehicle)
    end
    SetModelAsNoLongerNeeded(vehicle)
end