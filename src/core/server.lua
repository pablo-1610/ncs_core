_NCS:trace("Loading NCS Core, please wait...")

---triggerClientEvent
---@param eventName string
---@param targetId number
---@return void
---@public
function _NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

AddEventHandler("ncs_core:dbConnected", function()
    _NCS:triggerEvent("ncs_core:loaded")
end)