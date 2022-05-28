---@class NCSPlayer
---@field public id string
---@field public label string
---@field public type string
---@field public owner string
---@field public society string
NCSPlayer = {}
NCSPlayer.__index = NCSPlayer

setmetatable(NCSPlayer, {
    __call = function(_, id)
        local self = setmetatable({}, NCSPlayer)
        self.id = id
        return (self)
    end
})