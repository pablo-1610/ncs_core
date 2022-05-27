---showAdvancedNotification
---@param icon string
---@param type number
---@param sender string
---@param title string
---@param text string
---@param colorBg number
---@return void
---@public

function API_Player:showAdvancedNotification(icon, type, sender, title, text, colorBg)
    if (colorBg) then
        ThefeedNextPostBackgroundColor(colorBg)
    end
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, sender, title, text)
    DrawNotification(false, true)
end
