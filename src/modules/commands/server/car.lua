local colorCar = {
    red = {255, 0, 0},
    green = {0, 255, 0},
    blue = {0, 0, 255},
    white = {255, 255, 255},
    black = {0, 0, 0},
    yellow = {255, 255, 0},
    orange = {255, 123, 0},
    pink = {255, 0, 255},
    purple = {60, 0, 255},
    brown = {153, 102, 51},
    grey = {128, 128, 128},
}

API_Commands:registerPermissionCommand('car', 'canCar', function(player, args)
    if (#args >= 3) then 
        return (player:showSystemNotification(_Literals.ERROR_TOO_MANY_ARGS, NCSEnum.LogType.ERROR))
    end 
    if (args[1] == nil) then 
        return (player:showSystemNotification(_Literals.ERROR_CAR_NO_MODEL, NCSEnum.LogType.ERROR))
    end
    local function spawnVehicle(colorVeh)
        local playerCoords = GetEntityCoords(GetPlayerPed(player.serverId))
        local playerHeading = GetEntityHeading(GetPlayerPed(player.serverId))
        local props = {
            plate = 'NCS_CORE', 
            color1 = {colorVeh[1], colorVeh[2], colorVeh[3]},
            color2 = {colorVeh[1], colorVeh[2], colorVeh[3]},
        }
        NCS:triggerClientEvent("ncs_core:setVehicleProperties", player.serverId, args[1], playerCoords, playerHeading, props)
        return (player:showSystemNotification(_Literals.SUCCESS_CAR_SPAWNED, NCSEnum.LogType.SUCCESS))
    end
    if (args[2] == nil) then 
        local r, g, b = math.random(255), math.random(255), math.random(255)
        spawnVehicle({r, g, b})
    else 
        spawnVehicle(colorCar[args[2]])
    end
end)