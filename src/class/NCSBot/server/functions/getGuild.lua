---getGuild
---@param guildId string
---@public
---@return table
function NCSBot:getGuild(guildId)
    return (json.decode(self:performDiscord(NCSEnum.MethodType.GET, ("guilds/%s"):format(guildId))))
end