---notifyAll
---@param message string
---@return void
---@public
function MOD_Players:notifyAll(message)
    _NCS:triggerClientEvent("NCS_player:notify", -1, message)
end