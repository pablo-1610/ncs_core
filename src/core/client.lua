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

---onReady
---@param callback function
---@public
function NCS:onReady(callback)
    if (self.ready) then
        callback()
    else
        self:handleEvent("clientReady", callback)
    end
end

NCS:handleEvent("cacheSet", function(cacheType, firstTime)
    if (not (NCS.ready)) then
        if (cacheType == NCSEnum.CacheType.PLAYER_DATA and firstTime) then
            NCS.ready = true
            NCS:triggerEvent("clientReady")
        end
    end
end)