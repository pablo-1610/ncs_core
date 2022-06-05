---registerRoleCommand
---@param command string
---@param roleIdentifier string
---@param handler function
---@public
function API_Commands:registerRoleCommand(command, roleIdentifier, handler)
    RegisterCommand(command, function(_src, args)
        if (_src == 0) then
            return
        end
        if (not (MOD_Roles:exists(roleIdentifier))) then
            return (NCS:die(("Execution of command %s failed, role %id does not exist"):format(command, roleIdentifier)))
        end
        ---@type NCSRole
        local role = MOD_Roles:get(roleIdentifier)
        if (not (MOD_Players:exists(_src))) then
            return (NCS:die(("Execution of command %s failed, player id %i does not exist"):format(command, _src)))
        end
        ---@type NCSPlayer
        local player = MOD_Players:get(_src)
        if (not (player.role == role) or (player.role < role)) then
            player:showSystemNotification(_Literals.ERROR_MISSING_RANK_PERMISSION)
            return
        end
        handler(player, args)
    end)
end