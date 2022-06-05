local dataName <const> = "time"

NCS:onReady(function()
    if (not (NCS.NoSQL:getIsContentAvailable(dataName))) then
        MOD_Time.currentTime = { 12, 00 }
    else
        MOD_Time.currentTime = NCS.NoSQL:getContent(dataName)
    end
    MOD_Time:startClock()
end)