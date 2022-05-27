---showHelpNotification
---@param text string
---@return void
---@public

function _NCS:showHelpNotification(text)
    AddTextEntry("HELP", text)
    DisplayHelpTextThisFrame("HELP", false)
end