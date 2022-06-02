---showNotification
---@param text string
---@param colorBg number
---@public
function API_Player:showNotification(text, colorBg)
    if (colorBg) then
        ThefeedNextPostBackgroundColor(colorBg)
    end
    AddTextEntry("SowNotifSimple", text)
    BeginTextCommandThefeedPost("SowNotifSimple")
    EndTextCommandThefeedPostTicker(false, false)
end
