NCS:registerNetEvent("ncs_core:notify")
NCS:handleEvent("ncs_core:notify", function(message, colorBg)
    API_Player:showNotification(message, colorBg)
end)
