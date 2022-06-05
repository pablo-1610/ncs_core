---triggerClientEvent
---@param eventName string
---@param targetId number
---@return void
---@public
function NCS:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

---onReady
---@param callback function
---@return void
---@public
function NCS:onReady(callback)
    if (self.ready) then
        callback()
    else
        self:handleEvent("serverReady", callback)
    end
end