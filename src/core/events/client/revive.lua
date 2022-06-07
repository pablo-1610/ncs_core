NCS:registerNetEvent("ncs_core:revivePlayer")
NCS:handleEvent("ncs_core:revivePlayer", function(coords, skin)
    API_Player:spawn(coords)

    CreateThread(function()
        Wait(100)

        MOD_Skin:applySkin(skin)
    end)
end)