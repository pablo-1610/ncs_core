---notifyAll
---@param msg string
---@return void
---@public
function MOD_Players:notifyAll(msg)
    _NCS:triggerClientEvent("executeFunction", -1, "_G._NCS.Player.showNotification", msg)
end