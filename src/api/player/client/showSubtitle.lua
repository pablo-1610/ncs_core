---showSubtitle
---@param text string
---@return void
---@public
function API_Player:showSubtitle(text)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(0, true)
end