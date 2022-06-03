---getPlayer
---@param discordId string
---@public
---@return table
function NCSBot:getPlayer(discordId)
    return (json.decode(self:performDiscord(NCSEnum.MethodType.GET, ("users/%s"):format(discordId))))
end