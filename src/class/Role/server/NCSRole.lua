---@field public identifier string
---@field public label string
---@field public powerIndex number
---@field public permissions table<string, boolean>
---@class NCSRole
NCSRole = {}

local __instance = {
    __index = NCSRole,

    __eq = function(a, b)
        return (a.powerIndex == b.powerIndex)
    end,

    __lt = function(a, b)
        return (a.powerIndex < b.powerIndex)
    end,

    __le = function(a, b)
        return (a.powerIndex <= b.powerIndex)
    end,
}

setmetatable(NCSRole, {
    __call = function(_, identifier, label, powerIndex)
        local self = setmetatable({}, __instance)

        self.identifier = identifier
        self.label = label
        self.powerIndex = powerIndex

        API_Database:query("SELECT * FROM ncs_roles_permissions WHERE role_identifier = @role_identifier", {
            ["role_identifier"] = self.identifier
        }, function(rows)
            for _, row in pairs(rows) do
                self.permissions[row.permission] = true
            end
        end)

        return (self)
    end
})

---hasPermission
---@param permission string
---@return boolean
---@public
function NCSRole:hasPermission(permission)
    return (self.permissions[permission] ~= nil)
end

---addPermission
---@param permission string
---@return void
---@public
function NCSRole:addPermission(permission)
    if (self:hasPermission(permission)) then
        return
    end
    self.permissions[permission] = true
    API_Database:query("INSERT INTO ncs_roles_permissions (role_identifier, permission) VALUES (@role_identifier, @permission)", {
        ["role_identifier"] = self.identifier,
        ["permission"] = permission
    })
end

---removePermission
---@param permission string
---@return void
---@public
function NCSRole:removePermission(permission)
    if (not self:hasPermission(permission)) then
        return
    end
    self.permissions[permission] = nil
    API_Database:query("DELETE FROM ncs_roles_permissions WHERE role_identifier = @role_identifier AND permission = @permission", {
        ["role_identifier"] = self.identifier,
        ["permission"] = permission
    })
end