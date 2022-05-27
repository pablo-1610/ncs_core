AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    _NCS:coreTrace("^1Stopping ^7NCS Core...", _NCSEnum.LogType.INFO)
end)