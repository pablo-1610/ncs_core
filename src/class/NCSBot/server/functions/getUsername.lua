---getUsername
---@param discordId string
---@param showDiscriminator boolean
---@public
---@return string
function NCSBot:getUsername(discordId, showDiscriminator)
    local player = self:getPlayer(discordId)
    return (player and (showDiscriminator and ("%s#%s"):format(player.username, player.discriminator) or player.username) or "INVALID")
end