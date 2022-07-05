---registerPermissionCommand
---@param command string
---@param permission string
---@param handler function
---@public
function API_Commands:registerPermissionCommand(command, permission, handler)
    local registerCommand = function(commandName, permissionIdentifier, handlerFunc)
        RegisterCommand(commandName, function(_src, args)
            if (_src == 0) then
                return
            end
            if (not (MOD_Players:exists(_src))) then
                return (NCS:die(("Execution of command %s failed, player id %i does not exist"):format(commandName, _src)))
            end
            ---@type NCSPlayer
            local player = MOD_Players:get(_src)
            if (not (player.role:hasPermission(permissionIdentifier))) then
                player:showSystemNotification(_Literals.ERROR_MISSING_RANK_PERMISSION, NCSEnum.LogType.ERROR)
                return
            end
            handlerFunc(player, args)
        end)
    end

    if type(command) == "string" then
        registerCommand(command, permission, handler)
    elseif type(command) == "table" then
        for _, v  in pairs(command) do
            registerCommand(v, permission, handler)
        end
    end
end