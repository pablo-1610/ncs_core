NCS:registerNetEvent("ncs_core:setVehicleProperties")
NCS:handleEvent("ncs_core:setVehicleProperties", function(model, playerCoords, playerHeading, props)
    local vehicle = API_Vehicles:spawn(model, playerCoords, playerHeading, true)
    while not DoesEntityExist(vehicle) do
        Wait(0)
    end
    API_Ped:setIntoVehicle(GetPlayerPed(-1), vehicle, -1)
    API_Vehicles:setProperties(vehicle, props)
end)