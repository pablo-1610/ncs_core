---showMissionNotification
---@param text string
---@param time number
---@return void
---@public

function _NCS:showMissionNotification(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time, true)
end
