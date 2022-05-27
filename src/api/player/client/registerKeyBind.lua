---registerKey
---@param name string
---@param defaultKey string
---@param desc string
---@param callback function
---@return void
---@public
function API_Player:registerKeyBind(name, defaultKey, desc, callback)
    local cmd <const> = ("ncs_%s"):format(name)
    RegisterCommand(cmd, function()
        callback()
    end)
    RegisterKeyMapping(cmd, desc, "keyboard", defaultKey)
end
