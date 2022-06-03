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