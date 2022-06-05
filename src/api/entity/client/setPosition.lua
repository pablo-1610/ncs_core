---setPosition
---@param entityId number
---@param coords table<number, number, number>
---@param keepVehicle boolean
---@return void
---@public
function API_Entity:setPosition(entityId, coords, keepVehicle)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    RequestCollisionAtCoord(coords.xyz)
    while (not HasCollisionLoadedAroundEntity(entityId)) do
        Wait(0)
    end

    if (keepVehicle) then
        local vehicle <const> = GetVehiclePedIsIn(entityId, false)
        if (DoesEntityExist(vehicle) and vehicle ~= 0) then
            SetPedCoordsKeepVehicle(entityId, coords.xyz)
            SetEntityHeading(vehicle, coords.w or 0.0)
            return
        end
    end
    
    SetEntityCoords(entityId, coords.xyz)
    SetEntityHeading(entityId, coords.w or 0.0)
end