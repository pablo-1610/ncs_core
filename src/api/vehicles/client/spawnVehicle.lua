---spawn
---@param modelName string
---@param coords table
---@param heading number
---@param cb function
---@return void
---@public
function API_Vehicles:spawn(modelName, coords, heading, cb, clientSide)
    CreateThread(function()
        assert(type(modelName) == "string" or type(modelName) == "number")
        if type(modelName) == "string" then
            modelName = GetHashKey(modelName)
        end

        local model = GetHashKey(modelName)
        if (not (IsModelInCdimage(model))) then
            return _NCS:die("Model not found: " .. modelName)
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
    end)
end
