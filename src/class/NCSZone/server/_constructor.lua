---@class NCSZone
---@field public id number
---@field public position table
---@field public handler function
---@field public helpText string
---@field public color table<number, number, number, number>
---@field public drawDistance number
---@field public interactDistance number
NCSZone = {}

local __instance = {
    __index = NCSZone
}

setmetatable(NCSZone, {
    __call = function(_, id, position, handler, helpText, color, drawDistance, interactDistance)
        local self = setmetatable({}, __instance)

        self.id = id
        self.position = position
        self.handler = handler
        self.helpText = helpText
        self.color = color
        self.drawDistance = drawDistance
        self.interactDistance = interactDistance

        API_Tables:exportMetatable(NCSZone, self)

        return (self)
    end
})