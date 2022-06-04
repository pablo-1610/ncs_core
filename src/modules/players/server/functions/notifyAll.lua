---notifyAll
---@param message string
---@public
function MOD_Players:notifyAll(message)
    NCS:triggerClientEvent("showNotification", -1, message)
end