---setPosition
---@param pedId number
---@param coords table<number, number, number>
---@return void
---@public
function API_Ped:setPosition(pedId, coords)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end    

    RequestCollisionAtCoord(coords.xyz)
    while not HasCollisionLoadedAroundEntity(pedId) do
        Wait(0)
    end
    
    SetEntityCoords(pedId, coords.xyz)
    SetEntityHeading(pedId, coords.w or 0.0)
end
