---triggerClientEvent
---@param eventName string
---@param targetId number
---@public
function _NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end