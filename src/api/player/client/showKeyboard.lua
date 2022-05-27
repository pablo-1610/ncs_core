---showKeyboard
---@param textEntry string
---@param maxInputLength number
---@return string
---@public
function API_Player:showKeyboard(textEntry, exampleText, maxInputLength)
    CreateThread(function() 
        AddTextEntry("FMMC_KEY_TIP1", textEntry)
        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", exampleText, "", "", "", maxInputLength)
        while (UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2) do
            Wait(0)
        end
        if (UpdateOnscreenKeyboard() ~= 2) then
            local result <const> = GetOnscreenKeyboardResult()
            Wait(500)
            return (result)
        else
            Wait(500)
            return (nil)
        end
    end)
end
