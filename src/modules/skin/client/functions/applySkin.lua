---applySkin
---@param skinTable table
---@param save boolean
---@public
function MOD_Skin:applySkin(skinTable, save)
    local playerPed = PlayerPedId()
    local skinToApply = self.character

    for index, value in pairs(skinTable) do 
        skinToApply[index] = value
    end

    SetPedHeadBlendData(playerPed, skinToApply["face"], skinToApply["face"], skinToApply["face"], skinToApply["skin"], skinToApply["skin"], skinToApply["skin"], 1.0, 1.0, 1.0, true)
    SetPedHairColor(playerPed, skinToApply["hair_color_1"], skinToApply["hair_color_2"]) -- Hair Color
    SetPedHeadOverlay(playerPed, 3, skinToApply["age_1"], (skinToApply["age_2"] / 10) + 0.0) -- Age + opacity
    SetPedHeadOverlay(playerPed, 1, skinToApply["beard_1"], (skinToApply["beard_2"] / 10) + 0.0) -- Beard + opacity
    SetPedEyeColor(playerPed, skinToApply["eye_color"], 0, 1) -- Eyes color
    SetPedHeadOverlay(playerPed, 2, skinToApply["eyebrows_1"], (skinToApply["eyebrows_2"] / 10) + 0.0) -- Eyebrows + opacity
    SetPedHeadOverlay(playerPed, 4, skinToApply["makeup_1"], (skinToApply["makeup_2"] / 10) + 0.0) -- Makeup + opacity
    SetPedHeadOverlay(playerPed, 8, skinToApply["lipstick_1"], (skinToApply["lipstick_2"] / 10) + 0.0) -- Lipstick + opacity
    SetPedComponentVariation(playerPed, 2, skinToApply["hair_1"], skinToApply["hair_2"], 2) -- Hair
    SetPedHeadOverlayColor(playerPed, 1, 1, skinToApply["beard_3"], skinToApply["beard_4"]) -- Beard Color
    SetPedHeadOverlayColor(playerPed, 2, 1, skinToApply["eyebrows_3"], skinToApply["eyebrows_4"]) -- Eyebrows Color
    SetPedHeadOverlayColor(playerPed, 4, 1, skinToApply["makeup_3"], skinToApply["makeup_4"]) -- Makeup Color
    SetPedHeadOverlayColor(playerPed, 8, 1, skinToApply["lipstick_3"], skinToApply["lipstick_4"]) -- Lipstick Color
    SetPedHeadOverlay(playerPed, 5, skinToApply["blush_1"], (skinToApply["blush_2"] / 10) + 0.0) -- Blush + opacity
    SetPedHeadOverlayColor(playerPed, 5, 2, skinToApply["blush_3"]) -- Blush Color
    SetPedHeadOverlay(playerPed, 6, skinToApply["complexion_1"], (skinToApply["complexion_2"] / 10) + 0.0) -- Complexion + opacity
    SetPedHeadOverlay(playerPed, 7, skinToApply["sun_1"], (skinToApply["sun_2"] / 10) + 0.0) -- Sun Damage + opacity
    SetPedHeadOverlay(playerPed, 9, skinToApply["moles_1"], (skinToApply["moles_2"] / 10) + 0.0) -- Moles/Freckles + opacity
    SetPedHeadOverlay(playerPed, 10, skinToApply["chest_1"], (skinToApply["chest_2"] / 10) + 0.0) -- Chest Hair + opacity
    SetPedHeadOverlayColor(playerPed, 10, 1, skinToApply["chest_3"]) -- Torso Color
    SetPedHeadOverlay(playerPed, 11, skinToApply["bodyb_1"], (skinToApply["bodyb_2"] / 10) + 0.0) -- Body Blemishes + opacity

    if skinToApply["ears_1"] == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, skinToApply["ears_1"], skinToApply["ears_2"], 2) -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, skinToApply["tshirt_1"], skinToApply["tshirt_2"], 2) -- Tshirt
    SetPedComponentVariation(playerPed, 11, skinToApply["torso_1"], skinToApply["torso_2"], 2) -- torso parts
    SetPedComponentVariation(playerPed, 3, skinToApply["arms"], skinToApply["arms_2"], 2) -- Amrs
    SetPedComponentVariation(playerPed, 10, skinToApply["decals_1"], skinToApply["decals_2"], 2) -- decals
    SetPedComponentVariation(playerPed, 4, skinToApply["pants_1"], skinToApply["pants_2"], 2) -- pants
    SetPedComponentVariation(playerPed, 6, skinToApply["shoes_1"], skinToApply["shoes_2"], 2) -- shoes
    SetPedComponentVariation(playerPed, 1, skinToApply["mask_1"], skinToApply["mask_2"], 2) -- mask
    SetPedComponentVariation(playerPed, 9, skinToApply["bproof_1"], skinToApply["bproof_2"], 2) -- bulletproof
    SetPedComponentVariation(playerPed, 7, skinToApply["chain_1"], skinToApply["chain_2"], 2) -- chain
    SetPedComponentVariation(playerPed, 5, skinToApply["bags_1"], skinToApply["bags_2"], 2) -- Bag

    if skinToApply["helmet_1"] == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, skinToApply["helmet_1"], skinToApply["helmet_2"], 2) -- Helmet
    end

    if skinToApply["glasses_1"] == -1 then
        ClearPedProp(playerPed, 1)
    else
        SetPedPropIndex(playerPed, 1, skinToApply["glasses_1"], skinToApply["glasses_2"], 2) -- Glasses
    end

    if skinToApply["watches_1"] == -1 then
        ClearPedProp(playerPed, 6)
    else
        SetPedPropIndex(playerPed, 6, skinToApply["watches_1"], skinToApply["watches_2"], 2) -- Watches
    end

    if skinToApply["bracelets_1"] == -1 then
        ClearPedProp(playerPed, 7)
    else
        SetPedPropIndex(playerPed, 7, skinToApply["bracelets_1"], skinToApply["bracelets_2"], 2) -- Bracelets
    end

    if (save) then
        self.character = API_Tables:indexUnformat(skinToApply)
        NCS:triggerServerEvent("savePlayerSkin", self.character)
    end
end