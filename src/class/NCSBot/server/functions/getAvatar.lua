---getAvatar
---@param discordId string
---@public
---@return string
function NCSBot:getAvatar(discordId)
    local player = self:getPlayer(discordId)
    if (player) then
        if (player.avatar) then
            if (player.avatar:sub(2, 2) == "_") then
                return ("https://cdn.discordapp.com/avatars/%s/%s.gif"):format(discordId, player.avatar)
            else
                return ("https://cdn.discordapp.com/avatars/%s/%s.png"):format(discordId, player.avatar)
            end
        else
            return ("https://cdn.discordapp.com/embed/avatars/0.png")
        end
    else
        return ("https://cdn.discordapp.com/embed/avatars/0.png")
    end
end