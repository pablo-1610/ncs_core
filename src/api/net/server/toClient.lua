---net_toClient
---@param eventName string
---@param targetId number
---@return void
---@public
function _NCS:net_toClient(eventName, targetId, ...)
    TriggerClientEvent(self:net_formatEvent(eventName), targetId, ...)
end