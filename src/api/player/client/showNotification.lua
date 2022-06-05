---showNotification
---@param text string
---@param colorBg number
---@public
function API_Player:showNotification(text, colorBg)
    if (colorBg) then
        ThefeedNextPostBackgroundColor(colorBg)
    end
    AddTextEntry("ShowNotifSimple", text)
    BeginTextCommandThefeedPost("ShowNotifSimple")
    EndTextCommandThefeedPostTicker(false, false)
end

NCS:registerNetEvent("showNotification", function(text, colorBg)
    API_Player:showNotification(text, colorBg)
end)
