local interval <const> = GetConvarInt("ncs_clock_minute_incrementation", 60000)

function MOD_Time:startClock()
    if (self.running) then
        return
    end
    MOD_Time.running = true
    CreateThread(function()
        while (self.running) do
            MOD_Time.currentTime[2] = MOD_Time.currentTime[2] + 1
            if (MOD_Time.currentTime[2] >= 60) then
                MOD_Time.currentTime[2] = 0
                MOD_Time.currentTime[1] = MOD_Time.currentTime[1] + 1
                if (MOD_Time.currentTime[1] >= 24) then
                    MOD_Time.currentTime[1] = 0
                end
            end
            NCS:triggerClientEvent("updateTime", -1, self.currentTime)
            Wait(interval)
        end
    end)
end