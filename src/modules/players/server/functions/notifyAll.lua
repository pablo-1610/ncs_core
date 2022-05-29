---notifyAll
---@param msg string
---@return void
---@public
function MOD_Players:notifyAll(msg)
    _NCS:triggerClientEvent("NCs_player:notify", -1, msg)
end