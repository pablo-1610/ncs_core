---@field public user NCSPlayer
---@field public id number
---@field public identity table
---@field public skin table
---@field public accounts table
---@field public lastPosition any
---@field public metadata table
---@field public inventory table<maxWeight:number; allowedContent:table; accounts:table; weapons:table; items:table>
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
    __call = function(_, id, identity, skin, job, job_grade, lastPosition, metadata, isDead, deathCause, inventory)
        local self = setmetatable({}, __instance)

        self.id = id
        self.identity = identity
        self.skin = skin
        self.job = job
        self.job_grade = job_grade
        self.metadata = metadata
        self.lastPosition = lastPosition
        self.isDead = isDead
        self.death_data = deathCause
        self.inventory = inventory
        self.sessionData = {}

        --[[
            Functions
        --]]

        API_Tables:exportMetatable(NCSCharacter, self)

        return (self)
    end
})