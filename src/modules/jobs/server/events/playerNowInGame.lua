NCS:handleEvent("playerNowInGame", function(_src)
    NCS:triggerClientEvent("receiveJobs", _src, MOD_Jobs:getAll())
end)