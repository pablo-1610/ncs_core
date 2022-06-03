---getGuildRolesCount
---@param guildId string
---@public
---@return number
function NCSBot:getGuildRolesCount(guildId)
    local guild = self:getGuild(guildId)
    return (guild and guild.roles and #guild.roles or 0)
end