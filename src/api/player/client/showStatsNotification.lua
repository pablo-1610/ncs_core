---showStatNotification
---@param icon string
---@param title string
---@param subTitle string
---@param oldProgress number
---@param newProgress number
---@public
function API_Player:showStatsNotification(icon, title, subTitle, oldProgress, newProgress)
    API_Streaming:requestStreamedTextureDict(icon)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(subTitle)
    AddTextEntry(title,title)
    EndTextCommandThefeedPostStats(title, 0, newProgress, oldProgress, 0, icon, icon)
end