---getPlayerJoinedAtInGuild
---@param discordId string
---@param guildId string
---@public
---@return string
function NCSBot:getPlayerJoinedAtInGuild(guildId, discordId)
    local member = self:getGuildMember(guildId, discordId)
    return (member and member.joined_at or "INVALID")
end