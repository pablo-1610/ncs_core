NCS:onReady(function()
    MOD_Zones:startDrawer()
    MOD_Zones:startDivider()

    MOD_InteractionKey:addListener(function()
        local pos <const> = GetEntityCoords(PlayerPedId())
        ---@param zone NCSZone
        for _, zone in pairs(MOD_Zones.drawing) do
            if (#(pos - zone.position) <= zone.interactDistance) then
                NCS:triggerServerEvent("zoneInteract", zone.id)
            end
        end
    end)
end)