---@field public payload string
---@class NCSAdaptiveCardBuilder
NCSAdaptiveCardBuilder = {}

local __instance = {
    __index = NCSAdaptiveCardBuilder,
}

setmetatable(NCSAdaptiveCardBuilder, {
    __call = function(_)
        local self = setmetatable({}, __instance)
        self.payload = json.decode([[{"type":"AdaptiveCard","$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.5"}]])
        self.payload.body = {}
        return (self)
    end
})