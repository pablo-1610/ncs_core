NCS:registerNetEvent("setSkin")
NCS:handleEvent("setSkin", function(skin, save)
    applySkin(skin, save)
end)