---@class NCSBot
---@field public name string
---@field public token string
NCSBot = {}
NCSBot.__index = NCSBot

setmetatable(NCSBot, {
    __call = function(_, params)
        local self = setmetatable({}, NCSBot)
        self.name = params.name
        self.token = params.token

        NCS:trace(("NCSBot: new bot ^2%s^7"):format(self.name), NCSEnum.LogType.INFO)
        MOD_Bots.list[self.name] = self

        API_Tables:exportMetatable(NCSBot, self)

        return (self)
    end
})


