local splitDistance <const> = GetConvarInt("ncs_zones_split_distance", 100)

function MOD_Zones:startDivider()
    CreateThread(function()
        while (true) do
            local coords <const> = GetEntityCoords(PlayerPedId())

            -- Check if the zone is too far from the player
            ---@param zone NCSZone
            for id, zone in pairs(self.drawing) do
                if (#(coords - zone.position) > splitDistance) then
                    self.drawing[id] = nil
                end
            end

            -- Check if the zone is in the player's range
            ---@param zone NCSZone
            for id, zone in pairs(self.list) do
                if (self.drawing[id]) then
                    goto continue
                end
                if (#(coords - zone.position) <= splitDistance) then
                    self.drawing[id] = zone
                end
                :: continue ::
            end

            Wait(2000)
        end
    end)
end