NCS:registerNetEvent("subscribeZones", function(zones)
    ---@param zone NCSZone
    for _, zone in pairs(zones) do
        MOD_Zones:add(zone)
    end
end)