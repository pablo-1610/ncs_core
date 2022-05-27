---keyboardInput
---@param textEntry string
---@param exampleText string
---@param maxStringLenght number
function _NCS:keyboardInput(textEntry, exampleText, maxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', textEntry)

    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", exampleText, "", "", "", maxStringLenght)
    while (UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2) do
        Wait(0)
    end

    if (UpdateOnscreenKeyboard() ~= 2) then
        Wait(500)
        return (GetOnscreenKeyboardResult())
    else
        Citizen.Wait(500)
        return (nil)
    end
end