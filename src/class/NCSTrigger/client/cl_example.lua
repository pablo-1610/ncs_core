RegisterCommand('TriggerTest', function()
  
  NCSTrigger:Callback({event = 'Test numero 1'}, function(text)
    print(text);
  end, 'Trigger Event\'s', 'By TheFRcRaZy');

  Wait(2500);

  NCSTrigger:Server({event = 'J\'envoie au server'}, 'Hey !!!');

  Wait(2500);

  NCSTrigger:SetClient({event = 'J\'envoie au client', cbk = function(value)
    print(value);
  end});
end);