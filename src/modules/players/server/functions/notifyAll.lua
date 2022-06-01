---notifyAll
---@param message string
---@return void
---@public
function MOD_Players:notifyAll(message)
    _NCS:triggerClientEvent("ncs_core:notify", -1, message)
end