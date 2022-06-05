local dataName <const> = "time"

NCS:onStop(function()
    NCS.NoSQL:setContent(dataName, MOD_Time.currentTime)
end)