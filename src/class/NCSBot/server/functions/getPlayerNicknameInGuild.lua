---getPlayerNicknameInGuild
---@param discordId string
---@param guildId string
---@public
---@return string
function NCSBot:getPlayerNicknameInGuild(guildId, discordId)
    local member = self:getGuildMember(guildId, discordId)
    return (member and (member.nick and member.nick or member.user.username) or "INVALID")
end