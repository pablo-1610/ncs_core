---getIsPlayerMuteInGuild
---@param discordId string
---@param guildId string
---@public
---@return boolean
function NCSBot:getIsPlayerMuteInGuild(guildId, discordId)
    local member = self:getGuildMember(guildId, discordId)
    return (member and member.mute or false)
end