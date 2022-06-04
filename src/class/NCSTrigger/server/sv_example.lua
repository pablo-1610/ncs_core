NCSTrigger:SetCallback({event = 'Test numero 1', cbk = function(src, cbk, val1, val2)
  print(src, cbk, val1, val2);

  cbk('Ceci est un callback');
end});


NCSTrigger:SetServer({event = 'J\'envoie au server', cbk = function(src, text)
  print(text);

  Trigger:Client({event = 'J\'envoie au client'}, src or -1, text);
end});