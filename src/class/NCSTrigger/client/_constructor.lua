local CurrentRequestId = 0;
local Callbacks = {};
local TriggerClient = {};

NCSTrigger = {}

--- @param object {event:string, cbk:any}
Trigger:SetClient = function(object)
  TriggerClient[object.event] = object.cbk;
end;

--- @param object {event:string}
--- @param ... any
Trigger:Client = function(object, ...)
  if (TriggerClient[object.event]) then
    TriggerClient[object.event](...);
  else
    TriggerEvent(object.event, ...);
  end;
end;

--- @param object {event:string, data:object}
--- @param ... any
Trigger:Server = function(object, ...)
  if (object.data and object.data[1] == "Callback") then
    TriggerServerEvent('NCSFramework:Callback', object.event, object.data[2], ...);
  else
    TriggerServerEvent('NCSFramework:Server', object.event, ...);
  end;
end;

--- @param object {event:string, cbk:any}
--- @param ... any
Trigger:Callback = function(object, ...)
  Callbacks[CurrentRequestId] = object.cbk;
  Trigger:Server({event = object.event, data = {"Callback", CurrentRequestId}}, ...);
  if (CurrentRequestId < 65535) then
    CurrentRequestId = CurrentRequestId + 1;
  else
    CurrentRequestId = 0;
  end;
end;

--- @param requestId number
--- @param ... any
RegisterNetEvent('NCSFramework:Callback');
AddEventHandler('NCSFramework:Callback', function(requestId, ...)
  Callbacks[requestId](...);
	Callbacks[requestId] = nil;
end);


--- @param event string
--- @param ... any
RegisterNetEvent('NCSFramework:Client');
AddEventHandler('NCSFramework:Client', function(event, ...)
  Trigger:Client({event = event}, ...)
end);