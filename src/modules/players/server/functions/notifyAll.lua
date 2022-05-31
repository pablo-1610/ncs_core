---notifyAll
---@param message string
---@return void
---@public
function MOD_Players:notifyAll(message)
    _NCS:triggerClientEvent("NCs_player:notify", -1, message)
end