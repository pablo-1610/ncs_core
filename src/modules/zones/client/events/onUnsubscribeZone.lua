NCS:registerNetEvent("unsubscribeZone", function(id)
    MOD_Zones:delete(id)
end)