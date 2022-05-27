---keyboardInput
---@param TextEntry string
---@param ExampleText string
---@param MaxStringLenght number
function _NCS:keyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry)

    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
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
