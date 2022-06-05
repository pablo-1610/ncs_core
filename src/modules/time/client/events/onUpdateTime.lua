NCS:registerNetEvent("updateTime", function(timeTable)
    NetworkOverrideClockTime(timeTable[1], timeTable[2])
end)