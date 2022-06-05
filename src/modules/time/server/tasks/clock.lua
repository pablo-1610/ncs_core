local interval <const> = GetConvarInt("ncs_clock_minute_incrementation", 60000)

function MOD_Time:startClock()
    if (self.running) then
        return
    end
    self.running = true
    CreateThread(function()
        while (self.running) do
            self.currentTime[2] = self.currentTime[2] + 1
            if (self.currentTime[2] >= 60) then
                self.currentTime[2] = 0
                self.currentTime[1] = self.currentTime[1] + 1
                if (self.currentTime[1] >= 24) then
                    self.currentTime[1] = 0
                end
            end
            NCS:triggerClientEvent("updateTime", -1, self.currentTime)
            Wait(interval)
        end
    end)
end