---subscribeToZones
---@param player NCSPlayer
---@public
function MOD_Zones:subscribeToZones(player)
    local payload = {}
    ---@param zone NCSZone
    for _, zone in pairs(self:getAll()) do
        table.insert(payload, zone:minify())
    end
    player:triggerEvent("subscribeZones", payload)
end