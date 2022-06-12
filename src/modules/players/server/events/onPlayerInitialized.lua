NCS:registerNetEvent("initializedCharacter", function()
    local _src <const> = source
    local isDead = 0
    local waitTime = 1000

    while true do
        if (MOD_Players:exists(_src)) then
            local playerPed <const> = GetPlayerPed(_src)
            if ((GetEntityHealth(playerPed) <= 0) and (isDead == 0)) then
                waitTime = 100
                isDead = 1
                local player = MOD_Players:getPlayer(_src)
                
                local sourceKillerEntity <const>, sourceDeathCause <const> = GetPedSourceOfDeath(playerPed), GetPedCauseOfDeath(playerPed)
                local playerDeathCoords <const> = GetEntityCoords(playerPed)
                if sourceKillerEntity ~= _src and sourceKillerEntity  ~= 0 then
                    local playerDeathData = {
                        ["playerDeathCoords"] = playerDeathCoords,
                        ["playerDeathCause"] = sourceDeathCause,
                        ["playerDeathTime"] = GetGameTimer(),
                        ["killerEntity"] = sourceKillerEntity
                    }
                    NCS:trace(("Player id ^2%s ^7(^2%s^7) as been killed by ^2%s ^7(^2%s^7)"):format(_src, MOD_Players:get(_src).name, sourceKillerEntity, MOD_Players:get(sourceKillerEntity).name), 3)
                    player.character:setDeathStatus(isDead, playerDeathData)
                    TriggerEvent("playerIsNowDeath", _src, playerDeathData)
                    MOD_Players:setPlayer(_src, player)
                else
                    local playerDeathData = {
                        ["playerDeathCoords"] = playerDeathCoords,
                        ["playerDeathCause"] = sourceDeathCause,
                        ["playerDeathTime"] = GetGameTimer(),
                        ["killerEntity"] = false
                    }
                    NCS:trace(("Player id ^2%s ^7(^2%s^7) died without killer"):format(_src, MOD_Players:get(_src).name), 3)
                    player.character:setDeathStatus(isDead, playerDeathData)
                    NCS:triggerEvent("playerIsNowDeath", _src, playerDeathData)
                    MOD_Players:setPlayer(_src, player)
                end
            elseif (GetEntityHealth(playerPed) >= 1) and (isDead == 1) then
                waitTime = 1000
                isDead = 0
            end
        end
        Wait(waitTime)
    end
end)

NCS:handleEvent("initializedCharacter", function()
    local _src <const> = source
    Wait(5000)
    if (MOD_Players:exists(_src)) then
        local player = MOD_Players:get(_src)
        if (player.character.isDead ~= 0) then
            NCS:triggerClientEvent("playerIsNowDeath", _src)
            NCS:trace(("Kill player id ^2%s ^7(^2%s^7), he was died before disconnect"):format(_src, MOD_Players:get(_src).name), 3)
        end
    end
end)
