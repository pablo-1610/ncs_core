CreateThread(function()
    while (not (NetworkIsPlayerActive(PlayerId()))) do
        Wait(100)
    end
    _NCS:triggerServerEvent("nowInGame")
end)