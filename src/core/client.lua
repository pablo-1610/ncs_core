---triggerServerEvent
---@param eventName string
---@public
function _NCS:triggerServerEvent(eventName, ...)
    TriggerServerEvent(self:formatEvent(eventName), ...)
end

---getPlayerData
---@return table
---@public
function _NCS:getPlayerData()
    return (MOD_Cache:get(_NCSEnum.CacheType.PLAYER_DATA))
end

CreateThread(function()
    _NCS:triggerEvent("client_ready")
end)