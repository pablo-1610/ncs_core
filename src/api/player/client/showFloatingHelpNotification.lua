---showFloatingHelpNotification
---@param text string
---@param pos any
---@public
function API_Player:showFloatingHelpNotification(text, pos)
    AddTextEntry("HELP", text)
    SetFloatingHelpTextWorldPosition(1, pos)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp("HELP")
    EndTextCommandDisplayHelp(2, false, false, -1)
end
