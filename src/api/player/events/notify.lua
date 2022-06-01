_NCS:registerNetEvent("NCS_player:notify")
_NCS:handleEvent("NCS_player:notify", function(message, colorBg)
    API_Player:showNotification(message, colorBg)
end)
