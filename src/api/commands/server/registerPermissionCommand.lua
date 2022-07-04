---registerPermissionCommand
---@param command string
---@param permission string
---@param handler function
---@param restrictedArgs table<string>
---@public
function API_Commands:registerPermissionCommand(command, permission, handler, restrictedArgs)
    local useMess = ""
    for _, arg in pairs(restrictedArgs or {}) do
        useMess = useMess .. " ".. ("(^3%s^7)"):format(arg)
    end

    RegisterCommand(command, function(_src, args)
        if (_src == 0) then
            return
        end
        local _restrictedArgs = (restrictedArgs and #restrictedArgs or 0)
        if (_restrictedArgs > 0 and (#args ~= _restrictedArgs)) then
            return (NCS:trace(("Bad use command : /%s %s"):format(command, useMess), NCSEnum.LogType.WARNING))
        end
        if (not (MOD_Players:exists(_src))) then
            return (NCS:die(("Execution of command %s failed, player id %i does not exist"):format(command, _src)))
        end
        ---@type NCSPlayer
        local player = MOD_Players:get(_src)
        if (not (player.role:hasPermission(permission))) then
            player:showSystemNotification(_Literals.ERROR_MISSING_RANK_PERMISSION, NCSEnum.LogType.ERROR)
            return
        end
        handler(player, args)
    end)
end