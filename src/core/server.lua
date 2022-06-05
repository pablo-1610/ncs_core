---triggerClientEvent
---@param eventName string
---@param targetId number
---@public
function NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

---onReady
---@param callback function
---@public
function NCS:onReady(callback)
    if (self.ready) then
        callback()
    else
        self:handleEvent("serverReady", callback)
    end
end

---onStop
---@param callback function
---@public
function NCS:onStop(callback)
    self:handleEvent("serverStopped", callback)
end