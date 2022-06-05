AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    NCS:checkIsUpdate()
    NCS:trace("Starting NCS, please wait...", NCSEnum.LogType.INFO)
    NCS:triggerEvent("serverInvoked")
end)
