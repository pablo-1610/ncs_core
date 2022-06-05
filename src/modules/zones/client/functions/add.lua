---add
---@param zone NCSZone
---@public
function MOD_Zones:add(zone)
    zone.color = (zone.color or { 255, 255, 255, 255 })
    zone.helpText = (zone.helpText or _Literals.ZONE_DEFAULT_HELP_TEXT)
    self.list[zone.id] = zone
end