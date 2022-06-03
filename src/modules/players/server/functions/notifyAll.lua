---notifyAll
---@param message string
---@public
function MOD_Players:notifyAll(message)
    NCS:triggerClientEvent("ncs_core:notify", -1, message)
end