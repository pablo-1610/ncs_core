---triggerEvent
---@param eventName string
---@public
function NCSPlayer:triggerEvent(eventName, ...)
    NCS:triggerClientEvent(eventName, self.serverId, ...)
end