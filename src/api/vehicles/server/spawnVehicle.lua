---spawn
---@param modelName string
---@param x number
---@param y number
---@param z number
---@param heading number
---@param callback function
---@return void
---@public
function API_Vehicles:spawn(modelName, x, y, z, heading, callback)
    assert(type(modelName) == "string" or type(modelName) == "number")
    if type(modelName) == "string" then
        modelName = GetHashKey(modelName)
    end

    local vehicle = CreateVehicle(modelName, x, y, z, heading)
    repeat
        Wait(0)
    until DoesEntityExist(vehicle)

    -- Peds can spawn in vehicles (don't ask me why)
    local ped = GetPedInVehicleSeat(vehicle, -1)
    if (ped > 0) then
        for i = -1, 6 do
            ped = GetPedInVehicleSeat(vehicle, i)
            local populationType = GetEntityPopulationType(ped)
            if (populationType <= 5 or populationType >= 1) then
                DeleteEntity(ped)
            end
        end
    end

    callback(vehicle, NetworkGetNetworkIdFromEntity(vehicle))
end
