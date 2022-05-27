---showMissionNotification
---@param text string
---@param time number
---@return void
---@public

function API_Player:showMissionNotification(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time, true)
end
