NCS:registerNetEvent("initializeCharacter", function(requireSpawn, spawnCoords, character)
    local function loadModel()
        if character.skin["sex"] == 1 then
            API_Player:setModel('mp_f_freemode_01')
        end
    end

    if (requireSpawn) then
        API_Player:spawn(spawnCoords, function()
            loadModel()
            MOD_Skin:applySkin(character.skin, true)
        end)
        NCS:triggerServerEvent("initializedCharacter")
        return
    end

    loadModel()
    MOD_Skin:applySkin(character.skin, true)
    NCS:triggerServerEvent("initializedCharacter")
end)