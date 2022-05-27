---spawnVehicle
---@param modelOrHash string or number
---@param coord table
---@param heading number
---@param cb function
---@public
function _NCS:spawnVehicle(modelOrHash, coord, heading, cb)
    if IsModelInCdimage(modelOrHash) then
        RequestModel(modelOrHash)
        while not HasModelLoaded(modelOrHash) do
            _NCS:trace("Waiting model "..modelOrHash, 3)
            Wait(100)
        end
    end
    local vehicle = CreateVehicle(modelOrHash, coord, heading, 1, 0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetEntityCoordsNoOffset(vehicle, coord.x, coord.y, coord.z+0.5, 0.0, 0.0, 0.0)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityHeading(vehicle, heading)
    SetEntityAsMissionEntity(vehicle, 1, 1)
    if cb ~= nil then
        cb(vehicle)
    end
    SetModelAsNoLongerNeeded(vehicle)
end