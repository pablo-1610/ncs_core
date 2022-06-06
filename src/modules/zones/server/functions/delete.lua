---delete
---@param id number
---@public
function MOD_Zones:delete(id)
    if (not (self:exists(id))) then
        return NCS:die(("Trying to delete invalid zone id: %s"):format(id))
    end
    NCS:triggerClientEvent("unsubscribeZone", -1, id)
end