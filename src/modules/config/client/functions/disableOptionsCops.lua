NCS:onReady(function()
    if NCSInternal.DisableWantedLevel then
        SetMaxWantedLevel(0)
        ClearPlayerWantedLevel(PlayerId())
    end
end)