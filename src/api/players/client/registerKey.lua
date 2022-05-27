registeredKeysTable = {}
---registerKey
---@param key string
---@param commandName string
---@param commandDesc string
---@param action function
function _NCS:registerKey(key, commandName, commandDesc, action)
    key = string.upper(key)
    if (action) then
        registeredKeysTable[#registeredKeysTable+1] = {
            key = key,
            commandName = commandName,
            commandDesc = commandDesc,
            action = action,
            canUse = true,
        }
        RegisterCommand(commandName, function()
            for k,v in pairs(registeredKeysTable) do
                if (v.key == key) then
                    if (v.canUse) then
                        action()
                    end
                end
            end
        end, true)
        RegisterKeyMapping(commandName, commandDesc, 'keyboard', key)
    else
        _NCS:trace(("KEY registerKey [%s - %s] Action invalid or not found"):format(key, commandName), 5)
    end
end
