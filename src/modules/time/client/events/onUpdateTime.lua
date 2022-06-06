NCS:registerNetEvent("updateTime", function(timeTable)
    if (MOD_Time.isTimeOverride) then
        NetworkOverrideClockTime(MOD_Time.isTimeOverride[1], MOD_Time.isTimeOverride[2])
        return
    end
    NetworkOverrideClockTime(timeTable[1], timeTable[2])
end)