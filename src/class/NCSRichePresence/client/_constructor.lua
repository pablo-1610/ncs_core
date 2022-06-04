---@class NCSRichePresence
---@field public name string
---@field public applicationId string
---@field public message string
---@field public logos table
---@field public buttons table
NCSRichePresence = {}
NCSRichePresence.__index = NCSRichePresence

setmetatable(NCSRichePresence, {
    __call = function(_, name, applicationId)
        local self = setmetatable({}, NCSRichePresence)
        self.name = name
        self.applicationId = applicationId
        self.message = ""
        self.logos = {}
        self.buttons = {}

        NCS:trace(("NCSDiscord: new richePresence ^2%s^7"):format(name), NCSEnum.LogType.INFO)
        MOD_Discord.list[name] = self
        return (self)
    end
})