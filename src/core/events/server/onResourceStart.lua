AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    NCS:checkIsUpdate()
    NCS:coreTrace("^3Invoking ^7NCS Core...")
    NCS:triggerEvent("serverInvoked")
end)
