---@class NCSBot
---@field public name string
---@field public token string
NCSBot = {}
NCSBot.__index = NCSBot

setmetatable(NCSBot, {
    __call = function(_, params)
        local self = setmetatable({}, NCSBot)
        self.name = params.name
        self.token = params.token

        _NCS:trace(("NCSBot: new bot ^2%s^7"):format(self.name), _NCSEnum.LogType.INFO)
        MOD_Bots.list[self.name] = self
        return (self)
    end
})

---performDiscord
---@param method string
---@param endpoint string
---@param data table
---@param getCount boolean
---@public
---@return table
function NCSBot:performDiscord(method, endpoint, data, getCount)
    local request = nil

    PerformHttpRequest(("https://discordapp.com/api/%s?with_counts=%s"):format(endpoint, getCount or false), function(errorCode, resultData, resultHeaders)
        request = { error = errorCode, result = resultData, headers = resultHeaders }
        _NCS:trace(("Discord API Request: %s"):format(endpoint), _NCSEnum.LogType.DEBUG)
    end, method, data and json.encode(data) or "", {["Content-Type"] = "application/json", ["Authorization"] = ("Bot %s"):format(self.token)})

    while (not request) do
        Wait(0)
    end

    if (request.error ~= _NCSEnum.DiscordErrorType.GOOD) then
        _NCS:trace(("Discord API Error: %s"):format(_NCSEnum._getDiscordErrorType(request.error)), _NCSEnum.LogType.ERROR)
    end

    return (request.result)
end

---get_player
---@param discordId string
---@public
---@return table
function NCSBot:get_player(discordId)
    return (json.decode(self:performDiscord(_NCSEnum.MethodType.GET, ("users/%s"):format(discordId))))
end

---get_guild
---@public
---@return table
function NCSBot:get_guild(guildId)
    return (json.decode(self:performDiscord(_NCSEnum.MethodType.GET, ("guilds/%s"):format(guildId))))
end

---get_guild_member
---@param guildId string
---@param discordId string
---@public
---@return table
function NCSBot:get_guild_member(guildId, discordId)
    return (json.decode(self:performDiscord(_NCSEnum.MethodType.GET, ("guilds/%s/members/%s"):format(guildId, discordId))))
end

---get_guild_count
---@param guildId string
---@public
---@return table
function NCSBot:get_guild_count(guildId)
    return (json.decode(self:performDiscord(_NCSEnum.MethodType.GET, ("guilds/%s"):format(guildId), nil, true)))
end

---get_username
---@param discordId string
---@param showDiscriminator boolean
---@public
---@return string
function NCSBot:get_username(discordId, showDiscriminator)
    local player = self:get_player(discordId)

    return (player and (showDiscriminator and ("%s#%s"):format(player.username, player.discriminator) or player.username) or "INVALID")
end

---get_avatar
---@param discordId string
---@public
---@return string
function NCSBot:get_avatar(discordId)
    local player = self:get_player(discordId)

    if (player) then
        if (player.avatar) then
            if (player.avatar:sub(2, 2) == "_") then -- Determine if the avatar is PNG or GIF
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

---get_guild_name
---@param guildId string
---@public
---@return string
function NCSBot:get_guild_name(guildId)
    local guild = self:get_guild()

    return (guild and guild.name or "INVALID")
end

---get_guild_icon
---@param guildId string
---@public
---@return string
function NCSBot:get_guild_icon(guildId)
    local guild = self:get_guild(guildId)

    if (guild) then
        if (guild.icon) then
            if (guild.icon:sub(2, 2) == "_") then -- Determine if the icon is PNG or GIF
                return ("https://cdn.discordapp.com/icons/%s/%s.gif"):format(guildId, guild.icon)
            else
                return ("https://cdn.discordapp.com/icons/%s/%s.png"):format(guildId, guild.icon)
            end
        else
            return ("https://cdn.discordapp.com/embed/avatars/0.png")
        end
    else
        return ("https://cdn.discordapp.com/embed/avatars/0.png")
    end
end

---get_guild_roles
---@param guildId string
---@public
---@return table
function NCSBot:get_guild_roles(guildId)
    local guild = self:get_guild(guildId)

    return (guild and guild.roles or {})
end

---get_guild_roles_count
---@param guildId string
---@public
---@return table
function NCSBot:get_guild_roles_count(guildId)
    local guild = self:get_guild(guildId)

    return (guild and guild.roles and #guild.roles or 0)
end

---get_guild_members_count
---@param guildId string
---@public
---@return table
function NCSBot:get_guild_members_count(guildId)
    local guild = self:get_guild_count(guildId)

    return (guild and guild.approximate_member_count or 0)
end

---get_guild_online_members_count
---@param guildId string
---@public
---@return table
function NCSBot:get_guild_online_members_count(guildId)
    local guild = self:get_guild_count(guildId)

    return (guild and guild.approximate_presence_count -1 or 0)
end

---get_player_role_in_guild
---@param discordId string
---@param guildId string
---@public
---@return table
function NCSBot:get_player_role_in_guild(guildId, discordId)
    local member = self:get_guild_member(guildId, discordId)

    return (member and member.roles or {})
end

---player_has_role_in_guild
---@param discordId string
---@param guildId string
---@param roleId string
---@public
---@return boolean
function NCSBot:player_has_role_in_guild(guildId, discordId, roleId)
    local member = self:get_guild_member(guildId, discordId)

    for _, role in pairs(member.roles) do
        if (role == roleId) then
            return (true)
        end
    end

    return (false)
end

---get_player_nickname_in_guild
---@param discordId string
---@param guildId string
---@public
---@return string
function NCSBot:get_player_nickname_in_guild(guildId, discordId)
    local member = self:get_guild_member(guildId, discordId)

    return (member and (member.nick and member.nick or member.user.username) or "INVALID")
end

---is_player_mute_in_guild
---@param discordId string
---@param guildId string
---@public
---@return boolean
function NCSBot:is_player_mute_in_guild(guildId, discordId)
    local member = self:get_guild_member(guildId, discordId)

    return (member and member.mute or false)
end

---get_player_joined_at_in_guild
---@param discordId string
---@param guildId string
---@public
---@return string
function NCSBot:get_player_joined_at_in_guild(guildId, discordId)
    local member = self:get_guild_member(guildId, discordId)

    return (member and member.joined_at or "INVALID")
end


