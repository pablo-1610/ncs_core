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

---onStop
---@param callback function
---@public
function NCS:onStop(callback)
    self:handleEvent("serverStopped", callback)
end

---startSubScripts
---@public
function NCS:startSubScripts()
    for i = 0, GetNumResources(), 1 do
        local resource_name = GetResourceByFindIndex(i)
        if (resource_name == nil or resource_name == "") then
            goto continue
        end
        local dependencies = GetNumResourceMetadata(resource_name, "dependency")
        if (GetResourceState(resource_name) == "stopped" and dependencies >= 1) then
            for i = 0, (dependencies - 1) do
                local dependency = GetResourceMetadata(resource_name, "dependency", i)
                if (dependency == NCS.resourceName) then
                    NCS:trace(("^2Starting sub script ^7environment for ^3%s^7..."):format(resource_name), NCSEnum.LogType.INFO)
                    StartResource(resource_name)
                    goto continue
                end
            end
        end
        :: continue ::
    end
