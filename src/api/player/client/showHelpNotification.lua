---showHelpNotification
---@param text string
---@return void
---@public
function API_Player:showHelpNotification(text)
    AddTextEntry("HELP", text)
    DisplayHelpTextThisFrame("HELP", false)
end
