---serverSpawn
---@param modelName string
---@param coords table (vector4)
---@param cb function
---@public
function API_Vehicles:serverSpawn(modelName, coords, cb)
    local vehicle = Citizen.InvokeNative('CREATE_AUTOMOBILE', joaat(modelName), coords)
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

    cb(vehicle, NetworkGetNetworkIdFromEntity(vehicle))
end
