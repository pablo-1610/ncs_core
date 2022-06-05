AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    NCS:checkIsUpdate()
    NCS:systemTrace("^3Invoking ^7NCS Core...")
    NCS:triggerEvent("serverInvoked")
end)
