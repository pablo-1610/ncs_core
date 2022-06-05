local isRunning = false

function MOD_Zones:startDrawer()
    if (isRunning) then
        return
    end
    isRunning = true
    CreateThread(function()
        while (isRunning) do
            local playerPos<const> = GetEntityCoords(PlayerPedId())
            local interval = 200

            ---@param zone NCSZone
            for id, zone in pairs(self.drawing) do
                local color = (self.enabled and zone.color or { zone.color[1], zone.color[2], zone.color[3], 50 })
                local distance <const> = #(playerPos - zone.position)
                if (distance <= zone.drawDistance) then
                    interval = 0
                    DrawMarker(25, zone.position.x, zone.position.y, (zone.position.z - 0.97), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, zone.interactDistance, zone.interactDistance, zone.interactDistance, color[1], color[2], color[3], color[4], false, true, 2, false, false, false, false)
                    if (distance <= zone.interactDistance and (self.enabled)) then
                        API_Player:showHelpNotification(zone.helpText)
                        if (IsControlJustPressed(0, 51)) then
                            NCS:triggerServerEvent("zoneInteract", id)
                        end
                    end
                end
            end

            Wait(interval)
        end
    end)
end