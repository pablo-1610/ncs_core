---triggerServerAsync
---@param eventName string
---@return any
---@public
function API_Callback:triggerServerAsync(eventName, ...)
  local p <const> = promise.new()

  API_Callback:triggerServer(eventName, function(...)
    p:resolve({...})
  end, ...)

  return table.unpack(Citizen.Await(p))
end