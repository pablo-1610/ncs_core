---notifyAll
---@param message string
---@return void
---@public
function MOD_Players:notifyAll(message)
    NCS:triggerClientEvent("showNotification", -1, message)
end