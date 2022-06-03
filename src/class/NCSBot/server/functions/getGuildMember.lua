---getGuildMember
---@param guildId string
---@param discordId string
---@public
---@return table
function NCSBot:getGuildMember(guildId, discordId)
    return (json.decode(self:performDiscord(NCSEnum.MethodType.GET, ("guilds/%s/members/%s"):format(guildId, discordId))))
end