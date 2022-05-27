_NCS:trace("Loading NCS Core, please wait...")

---triggerClientEvent
---@param eventName string
---@return void
---@public
function _NCS:triggerClientEvent(eventName, ...)
    TriggerClientEvent(string eventName, int playerId[, ...])
end

