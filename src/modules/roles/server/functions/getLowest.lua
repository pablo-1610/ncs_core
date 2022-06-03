---getLowest
---@return NCSRole
---@public
function MOD_Roles:getLowest()
    ---@type NCSRole
    local lowestRole = nil
    ---@param role NCSRole
    for _, role in pairs(self.list) do
        if (not (lowestRole)) then
            lowestRole = role
        elseif (role.powerIndex < lowestRole.powerIndex) then
            lowestRole = role
        end
    end
    return (lowestRole)
end