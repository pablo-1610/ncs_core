NCS:registerNetEvent("ncs_core:revivePlayer")
NCS:handleEvent("ncs_core:revivePlayer", function(coords)
    API_Player:spawn(coords)
end)