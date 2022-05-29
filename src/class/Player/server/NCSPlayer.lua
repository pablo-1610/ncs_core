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
        self.identifiers = _G._NCS.Player:getIdentiers(self.id)
        return (self)
    end
})

---getId
---@return number
---@public
function NCSPlayer:getId()
    return self.id
end

---getName
---@return string
---@public
function NCSPlayer:getName()
    return self.name
end


---getLicense
---@return string
---@public
function NCSPlayer:getLicense()
    return self.identifiers["license"]
end

---getIdentier
---@param identifier string
---@return string
---@public
function NCSPlayer:getIdentier(identifier)
    return self.identifiers[identifier]
end

---getIdentiers
---@return table
---@public
function NCSPlayer:getIdentiers()
    return self.identifiers
end

---getDimension
---@return number
---@public
function NCSPlayer:getBucket()
    return GetPlayerRoutingBucket(self.id)
end

---setBucket
---@param bucketID number
---@return void
---@public
function NCSPlayer:setBucket(bucketID)
    SetPlayerRoutingBucket(self.id, bucketID)
end

---notify
---@param message string
---@return void
---@public
function NCSPlayer:notify(message)
    _NCS:triggerClientEvent("NCs_player:notify", self.id, message)
end