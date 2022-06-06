AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    NCS:checkIsUpdate()
    NCS:trace("^2Starting ^7main system, please wait...", NCSEnum.LogType.INFO)
    NCS:startSubScripts()
    NCS:triggerEvent("serverInvoked")
end)
