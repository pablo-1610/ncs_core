---triggerServer
---@param eventName string
---@param cb function
---@public
function API_Callback:triggerServer(eventName, cb, ...)
  local ticket <const> = ("__callback:%s:%s"):format(NCS:formatEvent(eventName), GetNetworkTime())

  local p <const> = promise.new()

  NCS:registerNetEvent(ticket)
  local handler <const> = NCS:handleEvent(ticket, function(...)
    p:resolve({...})
  end)

  NCS:triggerServerEvent("ncs_core:callback:server", eventName, ticket, ...)

  local result <const> = Citizen.Await(p)
  NCS:removeEvent(handler)
  
  cb(table.unpack(result))
end
