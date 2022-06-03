---getGuildCount
---@param guildId string
---@public
---@return table
function NCSBot:getGuildCount(guildId)
    return (json.decode(self:performDiscord(NCSEnum.MethodType.GET, ("guilds/%s"):format(guildId), nil, true)))
end