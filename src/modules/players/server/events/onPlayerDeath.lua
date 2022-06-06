NCS:handleEvent("NowInGame", function()
    local _src <const> = source
    local NCSisDead = false
    local waitTime = 850
    
    while true do
        if (NetworkIsPlayerActive(_src)) then
            local PlayerPed <const> = GetPlayerPed(_src)

            if IsPedFatallyInjured(PlayerPed) and not NCSisDead then
                waitTime = 10
                NCSisDead = true
                
                local SourceKillerEntity <const>, SourceDeathCause <const> = GetPedSourceOfDeath(PlayerPed)
                local SourceKillerClientId <const> = NetworkGetPlayerIndexFromPed(SourceKillerEntity)
                local PlayerDeathCoords <const> = GetEntityCoords(PlayerPed)

                if SourceKillerEntity ~= _src and SourceKillerClientId and NetworkIsPlayerActive(SourceKillerEntity) then
                    local PlayerKillerCoords <const> = GetEntityCoords(SourceKillerEntity)
                    local distance <const> = #(PlayerDeathCoords - PlayerKillerCoords)
                    
                    local PlayerDeathData = {
                        ["PlayerDeathCoords"] = PlayerDeathCoords,
                        ["PlayerDeathCause"] = SourceDeathCause,
                        ["PlayerDeathTime"] = GetGameTimer(),
                        ["KilledByPlayer"] = SourceKillerEntity,
                        ["KillerClientId"] = SourceKillerClientId,
                        ["KilledByPlayerCoords"] = PlayerKillerCoords,
                        ["Distance"] = API_Maths.round(distance, 1)
                    }
                    NCSPlayer.setDeathStatus(_src, NCSisDead, PlayerDeathData)
                else
                    local PlayerDeathData = {
                        ["PlayerDeathCoords"] = PlayerDeathCoords,
                        ["PlayerDeathCause"] = SourceDeathCause,
                        ["PlayerDeathTime"] = GetGameTimer(),
                        ["KilledByPlayer"] = false
                    }
                    NCSPlayer.setDeathStatus(_src, NCSisDead, PlayerDeathData)
                end
            elseif not IsPedFatallyInjured(PlayerPed) and NCSisDead then
                waitTime = 0
                NCSisDead = false
            end
          end
        Wait(waitTime)
    end
end)