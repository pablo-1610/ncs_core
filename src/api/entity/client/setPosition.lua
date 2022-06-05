---setPosition
---@param entityId number
---@param coords table<number, number, number>
---@param keepVehicle boolean
---@return void
---@public
function API_Entity:setPosition(entityId, coords)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    RequestCollisionAtCoord(coords.xyz)
    while (not HasCollisionLoadedAroundEntity(entityId)) do
        Wait(0)
    end

    SetEntityCoords(entityId, coords.xyz)
    SetEntityHeading(entityId, coords.w or 0.0)
end