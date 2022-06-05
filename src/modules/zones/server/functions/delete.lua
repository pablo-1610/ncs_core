---delete
---@param publicId number
---@public
function MOD_Zones:delete(publicId)
    local id = (type(publicId) == "string" and GetHashKey(publicId) or publicId)
    if (not (self:exists(id))) then
        return NCS:die(("Trying to delete invalid zone id: %s"):format(publicId))
    end
    NCS:triggerClientEvent("unsubscribeZone", -1, id)
end