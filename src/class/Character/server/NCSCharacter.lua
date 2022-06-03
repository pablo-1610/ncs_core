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

        return (self)
    end
})

---minify
---@return table
---@public
function NCSCharacter:minify()
    return {
        id = self.id,
        identity = self.identity,
        skin = self.skin,
        accounts = self.accounts,
        lastPosition = self.lastPosition,
        metadata = self.metadata
    }
end

---setUser
---@param user NCSPlayer
---@public
function NCSCharacter:setUser(user)
    self.user = user
    return (self)
end

---getFullName
---@return string
---@public
function NCSCharacter:getFullName()
    return ("%s %s"):format(API_Strings:firstToUpper(self.identity.firstname:lower()), API_Strings:firstToUpper(self.identity.lastname:lower()))
end

---initialize
---@param requireSpawn boolean
---@public
function NCSCharacter:initialize(requireSpawn)
    local spawnLocation = (self.lastPosition and self.lastPosition or NCSConstant.DefaultSpawn)
    self.user:triggerEvent("initializeCharacter", requireSpawn, spawnLocation, self:minify())
end

---warpToCharacterCustomization
---@param requireSpawn boolean
---@public
function NCSCharacter:warpToCharacterCustomization(requireSpawn)
    self.user:triggerEvent("invokeCharacterCreator", requireSpawn)
end

---getSessionData
---@param key string
---@return any
---@public
function NCSCharacter:getSessionData(key)
    return (self.sessionData[key])
end

---setSessionData
---@param key string
---@param value any
---@public
function NCSCharacter:setSessionData(key, value)
    self.sessionData[key] = value
end

---sessionDataExists
---@param key string
---@return boolean
---@public
function NCSCharacter:sessionDataExists(key)
    return (self.sessionData[key] ~= nil)
end