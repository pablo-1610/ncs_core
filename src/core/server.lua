---triggerClientEvent
---@param eventName string
---@param targetId number
---@return void
---@public
function _NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

_NCS:trace("Loading NCS Core, please wait...", _NCSEnum.LogType.INFO)
_NCS:triggerEvent("ncs_core:loaded")