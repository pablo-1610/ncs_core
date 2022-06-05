---@param zone NCSZone
NCS:registerNetEvent("subscribeZone", function(zone)
    MOD_Zones:add(zone)
end)