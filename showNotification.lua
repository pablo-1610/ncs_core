---players_showNotification
---@param text string
---@param colorBg number
---@return void
---@public

function _NCS:players_showNotification(text, colorBg)
    if (colorBg) then
        ThefeedNextPostBackgroundColor(colorBg)
    end
    AddTextEntry("SowNotifSimple", text)
    BeginTextCommandThefeedPost("SowNotifSimple")
    EndTextCommandThefeedPostTicker(false, false)
end