---delete
---@param self NCSZone
---@public
function NCSZone.delete(self)
    MOD_Zones:delete(self.id)
end