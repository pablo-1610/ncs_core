---getGuildOnlineMembersCount
---@param guildId string
---@public
---@return number
function NCSBot:getGuildOnlineMembersCount(guildId)
    local guild = self:getGuildCount(guildId)
    return (guild and guild.approximate_presence_count - 1 or 0)
end