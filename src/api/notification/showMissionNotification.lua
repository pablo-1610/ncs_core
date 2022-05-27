---players_showMissionNotification
---@param text string
---@param time number
---@return void
---@public

function _NCS:players_showMissionNotification(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time, true)
end
