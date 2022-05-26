---triggerServerEvent
---@param eventName string
---@return void
---@public
function _NCS:triggerServerEvent(eventName, ...)
    TriggerServerEvent(self:formatEvent(eventName), ...)
end