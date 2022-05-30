_NCS:registerNetEvent("NCs_player:notify")
_NCS:handleEvent("NCs_player:notify", function(message, colorBg)
    API_Player:showNotification(message, colorBg)
end)
