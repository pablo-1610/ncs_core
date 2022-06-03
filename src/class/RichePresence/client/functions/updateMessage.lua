---updateMessage
---@param newMessage
---@public
---@return void
function NCSRichePresence:updateMessage(newMessage)
    self.message = newMessage
    SetRichPresence(newMessage)

    _NCS:trace(("NCSDiscord: the message for richePresence ^2%s^7 is updated (^3%s^7) !"):format(self.name, newMessage), _NCSEnum.LogType.DEBUG)
end

_NCS:registerNetEvent("NCSRichePresence:updateMessage", function(name, newMessage)
    if (not MOD_Discord:exists(name)) then
        _NCS:trace(("NCSDiscord: the richePresence ^3%s^7 is not exist !"):format(name or "INVALID"))
        return
    end

    MOD_Discord:get(name):updateMessage(newMessage)
end)