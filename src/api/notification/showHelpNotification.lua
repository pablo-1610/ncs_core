---players_showHelpNotification
---@param text string
---@return void
---@public

function _NCS:players_showHelpNotification(text)
    AddTextEntry("HELP", text)
    DisplayHelpTextThisFrame("HELP", false)
end
