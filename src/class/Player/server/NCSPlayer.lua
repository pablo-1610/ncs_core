---@class NCSPlayer
local NCSPlayer = {}

local __instance = {
    __index = NCSPlayer,

    __eq = function(a, b)
        return (a.id == b.id)
    end,

    __tostring = function(self)
        return ("%s [%s]"):format(self.name, self.id)
    end
}

setmetatable(NCSPlayer, {
    __call = function(_, id)
        local self = setmetatable({}, __instance)

        self.id = id
        self.name = GetPlayerName(self.id)
        self.identifier = API_Player:getIdentifier(self.id)
        self.inGame = false

        return (self)
    end
})

---triggerEvent
---@param eventName string
---@public
function NCSPlayer:triggerEvent(eventName, ...)
    TriggerClientEvent(eventName, self.id, ...)
end

---ready
---@public
function NCSPlayer:ready()
    self.inGame = true
    if (MOD_Players.connectingList[self.identifier]) then
        MOD_Players.connectingList[self.identifier] = false
    end
end