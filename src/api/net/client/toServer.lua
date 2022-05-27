---net_toServer
---@param eventName string
---@return void
---@public
function _NCS:net_toServer(eventName, ...)
    TriggerServerEvent(self:net_formatEvent(eventName), ...)
end