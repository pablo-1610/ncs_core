---createPublic
---@param position table
---@param handler function
---@param helpText string
---@param drawDistance number
---@param interactDistance number
---@return NCSZone
---@public
function MOD_Zones:createPublic(id, position, handler, helpText, color, drawDistance, interactDistance)
    local zone = NCSZone(id, position, handler, helpText, color, drawDistance, interactDistance)
    self.list[zone.id] = zone
    NCS:triggerClientEvent("subscribeZone", -1, zone:minify())
    return (zone)
end