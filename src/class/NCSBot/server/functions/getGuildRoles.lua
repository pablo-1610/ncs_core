---getGuildRoles
---@param guildId string
---@public
---@return table
function NCSBot:getGuildRoles(guildId)
    local guild = self:getGuild(guildId)
    return (guild and guild.roles or {})
end