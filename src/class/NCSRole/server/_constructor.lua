---@field public identifier string
---@field public label string
---@field public powerIndex number
---@field public permissions table<string, boolean>
---@class NCSRole
NCSRole = {}
NCSRole.className = "NCSRole"

local __instance = {
    __index = NCSRole,

    __tostring = function(self)
        return ("[%i] %s (%s) {%i perms}"):format(self.powerIndex, self.label, self.identifier, API_Tables:count(self.permissions))
    end,

    __eq = function(a, b)
        return (a.powerIndex == b.powerIndex)
    end,

    __lt = function(a, b)
        return (a.powerIndex < b.powerIndex)
    end,

    __le = function(a, b)
        return (a.powerIndex <= b.powerIndex)
    end
}

setmetatable(NCSRole, {
    __call = function(_, identifier, label, powerIndex)
        local self = setmetatable({}, __instance)

        self.identifier = identifier
        self.label = label
        self.powerIndex = powerIndex
        self.permissions = {}

        self.export = function()
            return (API_Tables:exportMetatable(self, function(role)
                return (MOD_Roles:get(role.identifier))
            end))
        end

        API_Database:query("SELECT * FROM ncs_roles_permissions WHERE role_identifier = @role_identifier", {
            ["role_identifier"] = self.identifier
        }, function(rows)
            for _, row in pairs(rows) do
                self.permissions[row.permission] = true
            end
        end)

        --[[
            Functions
        --]]

        API_Tables:exportMetatable(NCSRole, self)

        return (self)
    end
})