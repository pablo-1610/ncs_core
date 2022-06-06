---@field public serverId number
---@field public identifier string
---@field public name string
---@field public inGame boolean
---@field public role NCSRole
---@field public character NCSCharacter
---@field public dataLoaded boolean
---@field public sayHello function
---@class NCSPlayer
NCSPlayer = {}
NCSPlayer.className = "NCSPlayer"

local meta<const> = {
    __index = NCSPlayer,

    __eq = function(a, b)
        return (a.id == b.id)
    end,

    __tostring = function(self)
        return ("%s [%s]"):format(self.name, self.id)
    end,
}

setmetatable(NCSPlayer, {
    __call = function(_, serverId)
        local self = setmetatable({}, meta)

        --[[
            Variables
        --]]

        self.serverId = serverId
        self.identifier = API_Player:getIdentifier(self.serverId)
        self.name = API_Player:getName(self.serverId)
        self.inGame = false
        self.dataLoaded = false
        self.deathData = {}

        API_Database:query("SELECT role_identifier FROM ncs_players WHERE player_identifier = @player_identifier", {
            ["@player_identifier"] = self.identifier,
        }, function(rows)
            local row <const> = rows[1]
            local roleIdentifier <const> = row.role_identifier

            if (not (roleIdentifier) or not (MOD_Roles:exists(roleIdentifier))) then
                self.role = (MOD_Roles:exists(NCSInternal.DefaultRoleIdentifier) and MOD_Roles:get(NCSInternal.DefaultRoleIdentifier) or MOD_Roles:getLowest())
                self:save()
                return
            end

            self.role = MOD_Roles:get(roleIdentifier)
            self.dataLoaded = true
        end)

        --[[
            Functions
        --]]

        API_Tables:exportMetatable(NCSPlayer, self)

        return (self)
    end
})