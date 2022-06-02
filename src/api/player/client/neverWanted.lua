Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then -- if player is wanted then
            SetPlayerWantedLevel(PlayerId(), 0, false) -- set wanted level to 0
            SetPlayerWantedLevelNow(PlayerId(), false) -- set wanted level to 0 now
        end
    end
end)
