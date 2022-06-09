NCS:registerNetEvent("setSkin")
NCS:handleEvent("setSkin", function(skin)
    MOD_Skin:applySkin(skin)
end)