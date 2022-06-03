---getGuildMembersCount
---@param guildId string
---@public
---@return number
function NCSBot:getGuildMembersCount(guildId)
    local guild = self:getGuildCount(guildId)
    return (guild and guild.approximate_member_count or 0)
end