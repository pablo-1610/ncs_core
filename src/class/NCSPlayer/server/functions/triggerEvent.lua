---triggerEvent
---@param eventName string
---@public
---@param self NCSPlayer
function NCSPlayer.triggerEvent(self, eventName, ...)
    NCS:triggerClientEvent(eventName, self.serverId, ...)
end