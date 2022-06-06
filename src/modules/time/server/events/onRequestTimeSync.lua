NCS:registerNetEvent("requestTimeSync", function()
    NCS:triggerClientEvent("updateTime", -1, MOD_Time.currentTime)
end)