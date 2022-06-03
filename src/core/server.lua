---triggerClientEvent
---@param eventName string
---@param targetId number
---@public
function _NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

---onReady
---@param callback function
---@public
function _NCS:onReady(callback)
    if (self.ready) then
        callback()
    else
        self:handleEvent("serverReady", callback)
    end
end