AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    NCS:trace("^1Stopping ^7main system, please wait...", NCSEnum.LogType.INFO)
    NCS:triggerEvent("serverStopped")
end)