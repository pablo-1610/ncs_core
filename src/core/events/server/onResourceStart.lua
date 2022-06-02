AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    _NCS:checkIsUpdate()

    _NCS:coreTrace("NCS Core has been ^2started ^7!", _NCSEnum.LogType.INFO)
    _NCS:triggerEvent("ncs_core:loaded")
end)
