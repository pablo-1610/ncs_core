local dataName <const> = "time"

NCS:onReady(function()
    local content <const> = NCS.NoSQL:getContent(dataName)
    if (not (NCS.NoSQL:contentIsAvailable(dataName)) or not content) then
        MOD_Time.currentTime = { 12, 00 }
    elseif content then
        MOD_Time.currentTime = content
    end
    MOD_Time:startClock()
end)