---@class NCSRichePresence
---@field public name string
---@field public applicationId string
---@field public logos table
---@field public buttons table
---@field public message string
NCSRichePresence = {}
NCSRichePresence.__index = NCSRichePresence

setmetatable(NCSRichePresence, {
    __call = function(_, name, applicationId, message, logos, buttons)
        local self = setmetatable({}, NCSRichePresence)
        self.name = name
        self.message = message
        self.applicationId = applicationId
        self.logos = logos or {}
        self.buttons = buttons or {}

        _NCS:trace(("NCSDiscord: new richePresence ^2%s^7"):format(name), _NCSEnum.LogType.INFO)
        MOD_Discord.list[name] = self
        return (self)
    end
})

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

---updateMessage
---@param newMessage
---@public
---@return void
function NCSRichePresence:updateMessage(newMessage)
    self.message = newMessage
    SetRichPresence(newMessage)

    _NCS:trace(("NCSDiscord: the message for richePresence ^2%s^7 is updated (^3%s^7) !"):format(self.name, newMessage), _NCSEnum.LogType.DEBUG)
end

_NCS:registerNetEvent("NCSRichePresence:invokeRichePresence", function(name)
    if (not MOD_Discord:exists(name)) then
        _NCS:trace(("NCSDiscord: the richePresence ^3%s^7 is not exist !"):format(name or "INVALID"))
        return
    end

    MOD_Discord:get(name):invokeRichePresence()
end)

_NCS:registerNetEvent("NCSRichePresence:updateMessage", function(name, newMessage)
    if (not MOD_Discord:exists(name)) then
        _NCS:trace(("NCSDiscord: the richePresence ^3%s^7 is not exist !"):format(name or "INVALID"))
        return
    end

    MOD_Discord:get(name):updateMessage(newMessage)
end)