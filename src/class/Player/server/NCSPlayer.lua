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
        self.name = _G._NCS.Player:getName(self.id)
        self.license = _G._NCS.Player:getLicense(self.id)
        return (self)
    end
})

--- getId
---@return number
---@public
function NCSPlayer:getId()
    return self.id
end

--- getName
---@return string
---@public
function NCSPlayer:getName()
    return self.name
end


--- getLicense
---@return string
---@public
function NCSPlayer:getLicense()
    return self.license
end

--- getDimension
---@return number
---@public
function NCSPlayer:getBucket()
    return GetPlayerRoutingBucket(self.id)
end

--- setBucket
---@param bucketID number
---@return void
---@public
function NCSPlayer:setBucket(bucketID)
    SetEntityRoutingBucket(self.id, bucketID)
end
