---helpNotif
---@param text string
---@public

function _NCS:helpNotif(text)
    AddTextEntry('HELP', text)
    DisplayHelpTextThisFrame('HELP', false)
end