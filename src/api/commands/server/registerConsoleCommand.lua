---registerConsoleCommand
---@param command string
---@param handler function
---@public
function API_Commands:registerConsoleCommand(command, handler)
    RegisterCommand(command, function(_src, args)
        if (_src ~= 0) then
            return
        end
        handler(_src, args)
    end)
end