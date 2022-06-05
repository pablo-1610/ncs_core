---registerPermissionCommand
---@param command string
---@param permission string
---@param handler function
---@public
function API_Commands:registerPermissionCommand(command, permission, handler)
    RegisterCommand(command, function(_src, args)
        if (_src == 0) then
            return
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