---showHelpNotification
---@param text string
---@public
function API_Player:showHelpNotification(text)
    AddTextEntry("HELP", text)
    DisplayHelpTextThisFrame("HELP", false)
end
