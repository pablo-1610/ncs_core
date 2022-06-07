---applySkin
---@param skinTable table
---@param save boolean
---@public
function MOD_Skin:applySkin(skinTable, save)
    local playerPed = PlayerPedId()

    SetPedHeadBlendData(playerPed, skinTable["face"], skinTable["face"], skinTable["face"], skinTable["skin"], skinTable["skin"], skinTable["skin"], 1.0, 1.0, 1.0, true)
    SetPedHairColor(playerPed, skinTable["hair_color_1"], skinTable["hair_color_2"]) -- Hair Color
    SetPedHeadOverlay(playerPed, 3, skinTable["age_1"], (skinTable["age_2"] / 10) + 0.0) -- Age + opacity
    SetPedHeadOverlay(playerPed, 1, skinTable["beard_1"], (skinTable["beard_2"] / 10) + 0.0) -- Beard + opacity
    SetPedEyeColor(playerPed, skinTable["eye_color"], 0, 1) -- Eyes color
    SetPedHeadOverlay(playerPed, 2, skinTable["eyebrows_1"], (skinTable["eyebrows_2"] / 10) + 0.0) -- Eyebrows + opacity
    SetPedHeadOverlay(playerPed, 4, skinTable["makeup_1"], (skinTable["makeup_2"] / 10) + 0.0) -- Makeup + opacity
    SetPedHeadOverlay(playerPed, 8, skinTable["lipstick_1"], (skinTable["lipstick_2"] / 10) + 0.0) -- Lipstick + opacity
    SetPedComponentVariation(playerPed, 2, skinTable["hair_1"], skinTable["hair_2"], 2) -- Hair
    SetPedHeadOverlayColor(playerPed, 1, 1, skinTable["beard_3"], skinTable["beard_4"]) -- Beard Color
    SetPedHeadOverlayColor(playerPed, 2, 1, skinTable["eyebrows_3"], skinTable["eyebrows_4"]) -- Eyebrows Color
    SetPedHeadOverlayColor(playerPed, 4, 1, skinTable["makeup_3"], skinTable["makeup_4"]) -- Makeup Color
    SetPedHeadOverlayColor(playerPed, 8, 1, skinTable["lipstick_3"], skinTable["lipstick_4"]) -- Lipstick Color
    SetPedHeadOverlay(playerPed, 5, skinTable["blush_1"], (skinTable["blush_2"] / 10) + 0.0) -- Blush + opacity
    SetPedHeadOverlayColor(playerPed, 5, 2, skinTable["blush_3"]) -- Blush Color
    SetPedHeadOverlay(playerPed, 6, skinTable["complexion_1"], (skinTable["complexion_2"] / 10) + 0.0) -- Complexion + opacity
    SetPedHeadOverlay(playerPed, 7, skinTable["sun_1"], (skinTable["sun_2"] / 10) + 0.0) -- Sun Damage + opacity
    SetPedHeadOverlay(playerPed, 9, skinTable["moles_1"], (skinTable["moles_2"] / 10) + 0.0) -- Moles/Freckles + opacity
    SetPedHeadOverlay(playerPed, 10, skinTable["chest_1"], (skinTable["chest_2"] / 10) + 0.0) -- Chest Hair + opacity
    SetPedHeadOverlayColor(playerPed, 10, 1, skinTable["chest_3"]) -- Torso Color
    SetPedHeadOverlay(playerPed, 11, skinTable["bodyb_1"], (skinTable["bodyb_2"] / 10) + 0.0) -- Body Blemishes + opacity

    if skinTable["ears_1"] == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, skinTable["ears_1"], skinTable["ears_2"], 2) -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, skinTable["tshirt_1"], skinTable["tshirt_2"], 2) -- Tshirt
    SetPedComponentVariation(playerPed, 11, skinTable["torso_1"], skinTable["torso_2"], 2) -- torso parts
    SetPedComponentVariation(playerPed, 3, skinTable["arms"], skinTable["arms_2"], 2) -- Amrs
    SetPedComponentVariation(playerPed, 10, skinTable["decals_1"], skinTable["decals_2"], 2) -- decals
    SetPedComponentVariation(playerPed, 4, skinTable["pants_1"], skinTable["pants_2"], 2) -- pants
    SetPedComponentVariation(playerPed, 6, skinTable["shoes_1"], skinTable["shoes_2"], 2) -- shoes
    SetPedComponentVariation(playerPed, 1, skinTable["mask_1"], skinTable["mask_2"], 2) -- mask
    SetPedComponentVariation(playerPed, 9, skinTable["bproof_1"], skinTable["bproof_2"], 2) -- bulletproof
    SetPedComponentVariation(playerPed, 7, skinTable["chain_1"], skinTable["chain_2"], 2) -- chain
    SetPedComponentVariation(playerPed, 5, skinTable["bags_1"], skinTable["bags_2"], 2) -- Bag

    if skinTable["helmet_1"] == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, skinTable["helmet_1"], skinTable["helmet_2"], 2) -- Helmet
    end

    if skinTable["glasses_1"] == -1 then
        ClearPedProp(playerPed, 1)
    else
        SetPedPropIndex(playerPed, 1, skinTable["glasses_1"], skinTable["glasses_2"], 2) -- Glasses
    end

    if skinTable["watches_1"] == -1 then
        ClearPedProp(playerPed, 6)
    else
        SetPedPropIndex(playerPed, 6, skinTable["watches_1"], skinTable["watches_2"], 2) -- Watches
    end

    if skinTable["bracelets_1"] == -1 then
        ClearPedProp(playerPed, 7)
    else
        SetPedPropIndex(playerPed, 7, skinTable["bracelets_1"], skinTable["bracelets_2"], 2) -- Bracelets
    end

    if (save) then
        self.character = skinTable
    end
end