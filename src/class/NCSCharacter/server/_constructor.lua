---@field public user NCSPlayer
---@field public id number
---@field public identity table
---@field public skin table
---@field public accounts table
---@field public lastPosition any
---@field public metadata table
---@field public sessionData table
---@class NCSCharacter
NCSCharacter = {}
NCSCharacter.className = "NCSCharacter"

local __instance = {
    __index = NCSCharacter,

    __eq = function(a, b)
        return (a.id == b.id)
    end,

    __tostring = function(self)
        return (self.id)
    end
}

setmetatable(NCSCharacter, {
    __call = function(_, id, identity, skin, accounts, lastPosition, metadata)
        local self = setmetatable({}, __instance)

        self.id = id
        self.identity = identity
        self.skin = skin
        self.accounts = accounts
        self.metadata = metadata
        self.lastPosition = lastPosition

        self.sessionData = {}

        --[[
            Functions
        --]]

        API_Tables:exportMetatable(NCSCharacter, self)

        return (self)
    end
})