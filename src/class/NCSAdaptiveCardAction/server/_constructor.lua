---@field public type string
---@field public title string
---@field public id string
---@class NCSAdaptiveCardAction
NCSAdaptiveCardAction = {}

local __instance = {
    __index = NCSAdaptiveCardAction,
}

setmetatable(NCSAdaptiveCardAction, {
    __call = function(_, type, title, id)
        local self = setmetatable({}, __instance)
        self.type = type
        self.title = title
        self.id = id
        return (self)
    end
})