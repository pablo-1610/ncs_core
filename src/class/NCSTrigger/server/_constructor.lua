local Callbacks = {};
local TriggerServer = {};

NCSTrigger = {}

--- @param object {event:string, cbk:any}
Trigger:SetServer = function(object)
  TriggerServer[object.event] = object.cbk;
end;

--- @param object {event:string}
--- @param src any
--- @param ... any
Trigger:Server = function(object, src, ...)
  if (TriggerServer[object.event]) then
    TriggerServer[object.event](src, ...);
  else
    TriggerEvent(object.event, ...);
  end;
end;

--- @param object {event:string, data:object}
--- @param src any
--- @param ... any
Trigger:Client = function(object, src, ...)
  if (object.data and object.data[1] == "Callback") then
    TriggerClientEvent('NCSFramework:Callback', src, object.data[2], ...);
  else
    TriggerClientEvent('NCSFramework:Client', src, object.event, ...);
  end;
end;

--- @param object {event:string, cbk:any}
Trigger:SetCallback = function(object)
  Callbacks[object.event] = object.cbk;
end;

--- @param object {event:string}
--- @param src any
--- @param cbk any
--- @param ... any
Trigger:Callback = function(object, src, cbk, ...)
  if (Callbacks[object.event]) then
    Callbacks[object.event](src, cbk, ...);
  else
    print(('[^4NCSFramework^7] ^1Error: ^2Server callback %s does not exist.^7'):format(object.event));
  end;
end;

--- @param event string
--- @param requestId number
--- @param ... any
RegisterNetEvent('NCSFramework:Callback');
AddEventHandler('NCSFramework:Callback', function(event, requestId, ...)
  local src = source;
  Trigger:Callback({event = event}, src, function(...)
    Trigger:Client({event = event, data = {"Callback", requestId}}, src, ...);
  end, ...);
end);

--- @param event string
--- @param ... any
RegisterNetEvent('NCSFramework:Server');
AddEventHandler('NCSFramework:Server', function(event, ...)
  local src = source;
  Trigger:Server({event = event}, src, ...);
end);