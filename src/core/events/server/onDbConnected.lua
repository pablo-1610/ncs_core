AddEventHandler("ncs_core:dbConnected", function()
    NCS:triggerEvent("databaseReady")
end)