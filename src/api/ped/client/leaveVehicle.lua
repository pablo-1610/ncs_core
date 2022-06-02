---leaveVehicle
---@param pedId number
---@param instant boolean
---@public
function API_Ped:leaveVehicle(pedId, instant)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    if (instant) then
        print('ok')
        TaskLeaveAnyVehicle(pedId, 0, 16)
    else
        print('ok2')
        TaskLeaveAnyVehicle(pedId, 0, 0)
    end
end

RegisterCommand('car', function()
    local model = GetHashKey('sultan')
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(0)
    end
    local veh = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), false, false)
end)