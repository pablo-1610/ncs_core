---@field public serverId number
---@field public identifier string
---@field public name string
---@field public inGame boolean
---@field public role NCSRole
---@field public character NCSCharacter
---@class NCSPlayer
NCSPlayer = {}

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
    __call = function(_, serverId)
        local self = setmetatable({}, __instance)

        self.serverId = serverId
        self.identifier = API_Player:getIdentifier(self.serverId)
        self.name = API_Player:getName(self.serverId)
        self.inGame = false

        API_Database:query("SELECT role_identifier FROM ncs_players WHERE player_identifier = @player_identifier", {
            ["@player_identifier"] = self.identifier
        }, function(rows)
            local row <const> = rows[1]
            local roleIdentifier <const> = row.role_identifier

            if (not (roleIdentifier) or not (MOD_Roles:exists(roleIdentifier))) then
                self.role = (MOD_Roles:exists(NCSInternal.DefaultRoleIdentifier) and MOD_Roles:get(NCSInternal.DefaultRoleIdentifier) or MOD_Roles:getLowest())
                self:save()
                return
            end

            self.role = MOD_Roles:get(roleIdentifier)
        end)

        return (self)
    end
})

---minify
---@return table
---@public
function NCSPlayer:minify()
    return {
        id = self.id,
        serverId = self.serverId,
        identifier = self.identifier,
        name = self.name,
        role = self.role:minify(),
        character = self.character:minify()
    }
end

---setCharacter
---@param newCharacter NCSCharacter
---@param callback function
---@public
function NCSPlayer:setCharacter(newCharacter, callback)
    self.character = newCharacter

    if (callback) then
        callback(true)
    end
end

---setCharacterByIdentifier
---@param characterId string
---@param callback function
---@public
function NCSPlayer:setCharacterByIdentifier(characterId, callback)
    API_Database:query("SELECT * FROM ncs_players_characters WHERE character_id = @character_id", {
        ["@character_id"] = characterId
    }, function(rows)
        if (#rows <= 0) then
            callback(false)
            return
        end
        local row <const> = rows[1]
        ---@type NCSCharacter
        local newCharacter = NCSCharacter(characterId, json.decode(row.identity), json.decode(row.skin), json.decode(row.accounts), json.decode(row.last_position), json.decode(row.metadata))
                :setUser(self)
        self:setCharacter(newCharacter, callback)
    end)
end

---triggerEvent
---@param eventName string
---@public
function NCSPlayer:triggerEvent(eventName, ...)
    NCS:triggerClientEvent(eventName, self.serverId, ...)
end

---setLastSource
---@param source number
---@public
function NCSPlayer:setLastSource(source)
    MOD_Players:setLastSource(self.identifier, source)
end

---save
---@public
function NCSPlayer:save()
    API_Database:query("UPDATE ncs_players SET role_identifier = @role_identifier WHERE player_identifier = @player_identifier", {
        ["@role_identifier"] = self.role.identifier,
        ["@player_identifier"] = self.identifier
    })
end

---sendData
---@public
function NCSPlayer:sendData()
    self:triggerEvent("setCache", NCSEnum.CacheType.PLAYER_DATA, self:minify())
end