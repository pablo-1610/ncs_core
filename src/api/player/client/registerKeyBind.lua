---registerKeyBind
---@param name string
---@param defaultKey string
---@param description string
---@param callback function
---@return void
---@public
function API_Player:registerKeyBind(name, defaultKey, description, callback)
    local cmd <const> = ("ncs_%s"):format(name)
    RegisterCommand(cmd, function()
        callback()
    end)
    RegisterKeyMapping(cmd, description, "keyboard", defaultKey)
end
