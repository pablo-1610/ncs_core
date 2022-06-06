---subscribeToZones
---@param player NCSPlayer
---@public
function MOD_Zones:subscribeToZones(player)
    local payload = {}
    ---@param zone NCSZone
    for _, zone in pairs(self:getAll()) do
        payload[#payload + 1] = zone:minify()
    end
    player:triggerEvent("subscribeZones", payload)
end