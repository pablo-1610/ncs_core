---setPosition
---@param pedId number
---@param coords table<number, number, number>
---@param keepVehicle boolean
---@return void
---@public
function API_Ped:setPosition(pedId, coords, keepVehicle)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    RequestCollisionAtCoord(coords.xyz)
    while (not HasCollisionLoadedAroundEntity(pedId)) do
        Wait(0)
    end

    if (keepVehicle) then
        local vehicle <const> = GetVehiclePedIsIn(pedId, false)
        if (DoesEntityExist(vehicle) and vehicle ~= 0) then
            SetPedCoordsKeepVehicle(pedId, coords.xyz)
            SetEntityHeading(vehicle, coords.w or 0.0)
            return
        end
    end
    
    SetEntityCoords(pedId, coords.xyz)
    SetEntityHeading(pedId, coords.w or 0.0)
end