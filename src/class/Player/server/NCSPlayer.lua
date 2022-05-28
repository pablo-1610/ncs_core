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
---@public
---@return number
function NCSPlayer:getId()
    return self.id
end

--- getName
---@public
---@return string
function PZPlayer:getName()
    return self.name
end


--- getLicense
---@public
---@return string
function PZPlayer:getLicense()
    return self.license
end

--- getDimension
---@public
---@return number
function PZPlayer:getBucket()
    return GetPlayerRoutingBucket(self.id)
end

--- setBucket
---@public
---@param bucketID number
---@return void
function PZPlayer:setBucket(bucketID)
    SetEntityRoutingBucket(self.id, bucketID)
end