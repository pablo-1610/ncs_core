registeredKeysTable = {}
---registerKey
---@param Key string
---@param commandName string
---@param commandDesc string
---@param Action function
function _NCS:registerKey(Key, commandName, commandDesc, Action)
    Key = string.upper(Key)
    if (Action) then
        registeredKeysTable[#registeredKeysTable+1] = {
            key = Key,
            commandName = commandName,
            commandDesc = commandDesc,
            action = Action,
            canUse = true,
        }
        RegisterCommand(commandName, function()
            for k,v in pairs(registeredKeysTable) do
                if (v.key == Key) then
                    if (v.canUse) then
                        Action()
                    end
                end
            end
        end, true)
        RegisterKeyMapping(commandName, commandDesc, 'keyboard', Key)
    else
        _NCS:trace(("KEY registerKey [%s - %s] Action invalid or not found"):format(Key, commandName), 5)
    end
end
