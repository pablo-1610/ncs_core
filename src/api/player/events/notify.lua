_NCS:registerNetEvent("NCs_player:notify")
_NCS:handleEvent("NCs_player:notify", function(msg)
    API_Player:showNotification(msg)
end)