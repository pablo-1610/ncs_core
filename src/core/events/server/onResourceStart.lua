AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    _NCS:checkIsUpdate()
    _NCS:coreTrace("^3Invoking ^7NCS Core...")
    _NCS:triggerEvent("serverInvoked")
end)
