---triggerServerEvent
---@param eventName string
---@public
function NCS:triggerServerEvent(eventName, ...)
    TriggerServerEvent(self:formatEvent(eventName), ...)
end

---getPlayerData
---@return table
---@public
function NCS:getPlayerData()
    return (MOD_Cache:get(NCSEnum.CacheType.PLAYER_DATA))
end

CreateThread(function()
    NCS:triggerEvent("client_ready")
end)