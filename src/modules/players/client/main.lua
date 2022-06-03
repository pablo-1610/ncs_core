CreateThread(function()
    while (not (NetworkIsPlayerActive(PlayerId()))) do
        Wait(100)
    end
    NCS:triggerServerEvent("nowInGame")
end)