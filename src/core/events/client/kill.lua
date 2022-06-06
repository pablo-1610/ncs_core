NCS:registerNetEvent("ncs_core:killPlayer")
NCS:handleEvent("ncs_core:killPlayer", function(serverId)
    local playerId = GetPlayerFromServerId(serverId)
    local playerPed = GetPlayerPed(playerId)
    
    API_Ped:kill(playerPed)
end)