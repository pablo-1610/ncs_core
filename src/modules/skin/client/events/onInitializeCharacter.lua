_NCS:registerNetEvent("initializeCharacter", function(requireSpawn, spawnCoords, character)
    local function applyComponents()
        -- TODO : When module skin will be ready, apply components such as skin, and then outfit (character.metadata.outfits[character.metadata.selectedOutfit])
    end

    if (requireSpawn) then
        API_Player:spawn(spawnCoords, function()
            applyComponents()
        end)
        return
    end

    applyComponents()
end)