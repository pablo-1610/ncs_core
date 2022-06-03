---invokeRichePresence
---@public
---@return void
function NCSRichePresence:invokeRichePresence()
    SetDiscordAppId(self.applicationId)
    SetRichPresence(self.message)
    SetDiscordRichPresenceAsset(self.logos[1] and self.logos[1].name)
    SetDiscordRichPresenceAssetText(self.logos[1] and self.logos[1].text)
    SetDiscordRichPresenceAssetSmall(self.logos[2] and self.logos[2].name)
    SetDiscordRichPresenceAssetSmallText(self.logos[2] and self.logos[2].text)

    if (#self.buttons > 0) then
        for button = 0, #self.buttons do
            SetDiscordRichPresenceAction(button, self.buttons[button].text, self.buttons[button].redirect)
        end
    end

    _NCS:trace(("NCSDiscord: the richePresence ^2%s^7 is invoked !"):format(self.name), _NCSEnum.LogType.DEBUG)
end

_NCS:registerNetEvent("NCSRichePresence:invokeRichePresence", function(name)
    if (not MOD_Discord:exists(name)) then
        _NCS:trace(("NCSDiscord: the richePresence ^3%s^7 is not exist !"):format(name or "INVALID"))
        return
    end

    MOD_Discord:get(name):invokeRichePresence()
end)