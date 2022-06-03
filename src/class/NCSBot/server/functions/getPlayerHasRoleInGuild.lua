---getPlayerHasRoleInGuild
---@param discordId string
---@param guildId string
---@param roleId string
---@public
---@return boolean
function NCSBot:getPlayerHasRoleInGuild(guildId, discordId, roleId)
    local member = self:getGuildMember(guildId, discordId)
    for _, role in pairs(member.roles) do
        if (role == roleId) then
            return (true)
        end
    end
    return (false)
end