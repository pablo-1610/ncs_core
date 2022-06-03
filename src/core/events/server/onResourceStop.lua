AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    NCS:coreTrace("^1Stopping ^7NCS Core...", NCSEnum.LogType.INFO)
end)