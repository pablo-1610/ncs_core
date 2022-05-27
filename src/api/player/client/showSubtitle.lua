---subtitle
---@param text string
function API_Player:subtitle(text)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(0, true)
end