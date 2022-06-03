---getGuildIcon
---@param guildId string
---@public
---@return string
function NCSBot:getGuildIcon(guildId)
    local guild = self:getGuild(guildId)
    if (guild and guild.icon) then
        if (guild.icon:sub(2, 2) == "_") then
            -- Determine if the icon is PNG or GIF
            return ("https://cdn.discordapp.com/icons/%s/%s.gif"):format(guildId, guild.icon)
        else
            return ("https://cdn.discordapp.com/icons/%s/%s.png"):format(guildId, guild.icon)
        end
    else
        return ("https://cdn.discordapp.com/embed/avatars/0.png")
    end
end