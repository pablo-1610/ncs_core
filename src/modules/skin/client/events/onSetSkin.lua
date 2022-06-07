NCS:registerNetEvent("setSkin")
NCS:handleEvent("setSkin", function(skin, save)
    MOD_Skin:applySkin(skin, save)
end)