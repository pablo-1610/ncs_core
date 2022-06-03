---getGuildName
---@param guildId string
---@public
---@return string
function NCSBot:getGuildName(guildId)
    local guild = self:getGuild(guildId)
    return (guild and guild.name or "INVALID")
end
