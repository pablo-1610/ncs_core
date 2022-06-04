---triggerServerEvent
---@param eventName string
---@public
function NCS:triggerServerEvent(eventName, ...)
    TriggerServerEvent(self:formatEvent(eventName), ...)
end

---getPlayerData
---@return NCSPlayerData
---@public
function NCS:getPlayerData()
    ---@type NCSPlayerData
    local playerData = MOD_Cache:get(NCSEnum.CacheType.PLAYER_DATA)
    return (playerData)
end

CreateThread(function()
    NCS:triggerEvent("client_ready")
end)

NCS:handleEvent("cacheSet", function(cacheType, firstTime)
    print(cacheType, firstTime)
end)