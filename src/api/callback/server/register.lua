local serverCallbacks <const> = {}

---register
---@param eventName string
---@param cb function
---@public
function API_Callback:register(eventName, cb)
  if (type(eventName) ~= "string") then 
    return NCS:die(("eventName expected string, but got %s"):format(type(eventName)))
  end

  if (type(cb) ~= "function") then 
    return NCS:die(("cb name expected string, but got %s"):format(type(eventName)))
  end

  if (serverCallbacks[eventName]) then 
    NCS:trace(("Server callback override, eventName: "):format(eventName), 2)
  end

  serverCallbacks[eventName] = cb
end

NCS:registerNetEvent("ncs_core:callback:server")
NCS:handleEvent("ncs_core:callback:server", function(eventName, ticket, ...)
  if (not serverCallbacks[eventName]) then 
    return NCS:die(("server callback not registered! eventName: %s"):format(type(eventName)))
  end

  local result <const> = { serverCallbacks[eventName](source, ...) }

  NCS:triggerClientEvent(ticket, source, table.unpack(result))
end)