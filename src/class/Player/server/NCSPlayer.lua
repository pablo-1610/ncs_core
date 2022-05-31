---@class NCSPlayer
NCSPlayer = {}
NCSPlayer.__index = NCSPlayer

setmetatable(NCSPlayer, {
    __call = function(_, id)
        local self = setmetatable({}, NCSPlayer)
        self.id = id
        self.name = GetPlayerName(self.id)
        self.identifier = API_Player:getIdentifier(self.id)
        self.inGame = false
        return (self)
    end
})

---triggerEvent
---@param eventName string
---@return void
---@public
function NCSPlayer:triggerEvent(eventName, ...)
    TriggerClientEvent(eventName, self.id, ...)
end

---ready
---@return void
---@public
function NCSPlayer:ready()
    self.inGame = true
    if (MOD_Players.connectingList[self.identifier]) then
        MOD_Players.connectingList[self.identifier] = false
    end
end