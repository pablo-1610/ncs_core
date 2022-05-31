---registerKeyMapping
---@param key string
---@param command string
---@param label string
---@param input string
---@param onPressed function
---@param onReleased function
---@return void
---@public
function API_Keybind:registerKeyMapping(key, command, label, input, onPressed, onReleased)
    assert(rawequal(type(key), "string"), "API_Keybind:registerKeyMapping : param key is not a string")
    assert(rawequal(type(command), "string"), "API_Keybind:registerKeyMapping : param command is not a string")
    assert(rawequal(type(label), "string"), "API_Keybind:registerKeyMapping : param label is not a string")
    assert(rawequal(type(input), "string"), "API_Keybind:registerKeyMapping : param input is not a string")
    assert(rawequal(type(onPressed), "function"), "API_Keybind:registerKeyMapping : param onPressed is not a function")

    if onReleased then
        assert(rawequal(type(onReleased), "function"), "API_Keybind:registerKeyMapping : param onReleased is not a function")
    end

    -- for custom import
    if not API_Keybind.data[key] then
        API_Keybind.data[key] = {
            command = command,
            label = label,
            onPressed = onPressed,
            onReleased = onReleased or nil
        }
    end

    RegisterKeyMapping(("+ncs_bind %s"):format((key)), label, input, key)
end

---unregisterKeyMapping
---@param key string
---@return void
---@public
function API_Keybind:unregisterKeyMapping(key)
    assert(rawequal(type(key), "string"))

    if not API_Keybind.data[key] then
        _NCS:die("API_Keybind:unregisterKeyMapping : Key binding not found !")
        return
    end

    ExecuteCommand(("unbind %s %s"):format(API_Keybind.data[key].input or "keyboard", key))
end

RegisterCommand("+ncs_bind", function(_, args)
    if not API_Keybind.data[args[1]] then
        return
    end

    local onPressed = API_Keybind.data[args[1]].onPressed
    if onPressed then
        onPressed()
    end
end)

RegisterCommand("-ncs_bind", function(_, args)
    if not API_Keybind.data[args[1]] then
        return
    end

    local onReleased = API_Keybind.data[args[1]].onReleased
    if onReleased then
        onReleased()
    end
end)

RegisterCommand("debind", function(_, args)
    if not args[1] then
        _NCS:die("Debind command : Add argument to command !")
        return
    end

    API_Keybind:unregisterKeyMapping(args[1])
end)

-- for properly init data
CreateThread(function()
    local data = API_Keybind.data

    for key, value in pairs(data) do
        API_Keybind:registerKeyMapping(key, value.command, value.label, value.input or "keyboard", value.onPressed, value.onReleased or nil)
    end
end)