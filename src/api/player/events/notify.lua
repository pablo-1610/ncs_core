_NCS:registerNetEvent("ncs_core:notify")
_NCS:handleEvent("ncs_core:notify", function(message, colorBg)
    API_Player:showNotification(message, colorBg)
end)
