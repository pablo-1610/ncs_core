AddEventHandler("ncs_core:dbConnected", function()
    _NCS:triggerEvent("databaseReady")
end)