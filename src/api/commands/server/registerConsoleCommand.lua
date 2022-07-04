---registerConsoleCommand
---@param command string
---@param handler function
---@param restrictedArgs table<string>
---@public
function API_Commands:registerConsoleCommand(command, handler, restrictedArgs)
    local useMess = ""
    for _, arg in pairs(restrictedArgs or {}) do
        useMess = useMess .. " ".. ("(^3%s^7)"):format(arg)
    end

    RegisterCommand(command, function(_src, args)
        if (_src ~= 0) then
            return
        end
        local _restrictedArgs = (restrictedArgs and #restrictedArgs or 0)
        if (_restrictedArgs > 0 and (#args ~= _restrictedArgs)) then
            return (NCS:trace(("Bad use command : /%s %s"):format(command, useMess), NCSEnum.LogType.WARNING))
        end

        handler(_src, args)
    end)
end