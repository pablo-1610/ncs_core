---getPlayerRoleInGuild
---@param discordId string
---@param guildId string
---@public
---@return table
function NCSBot:getPlayerRoleInGuild(guildId, discordId)
    local member = self:getGuildMember(guildId, discordId)
    return (member and member.roles or {})
end