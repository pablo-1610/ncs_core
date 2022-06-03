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